Imports DevExpress.Web
Imports DevExpress.Web.ASPxPivotGrid
Imports DevExpress.XtraGrid
Imports System.Data
Imports Negocio
Imports System.Globalization
Imports DevExpress.XtraPrinting
Imports System.Drawing
Imports DevExpress.XtraPrintingLinks
Imports System.IO

Public Class TransOfxGrupoRet
    Inherits System.Web.UI.Page

    Private mergedCells As New Dictionary(Of GridViewDataColumn, TableCell)()
    Private cellRowSpans As New Dictionary(Of TableCell, Integer)()

    Dim DsOficina As DataSet
    Dim DsAnio As DataSet
    Dim DsGrilla As DataSet
    Dim _Ds As DataSet
    Dim Objetos As New Objetos
    Dim Pagina As New cls_CargaPagina
    Dim Datos As New cls_TransOfxGrupoRet1

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LlenaComboAnios()
            LlenaComboOficinas()
            CreaGrilla1()
            _Ds = Pagina.CargaPermisosPagina(Session("IDUsuario"), System.IO.Path.GetFileName(Request.ServerVariables("SCRIPT_NAME")))
            btnx_expxls.Visible = CType(Objetos.ActivaButtonsPermiso(_Ds, "EXPXLSX"), Boolean)
        End If

        If pvt_Pivote1.IsCallback Then
            CreaGrilla1()
        End If
    End Sub

    Public Sub LlenaComboOficinas()
        DsOficina = Datos.DatosOficinas(cb_Anio.Value)

        'Dim Dt As DataTable = DatosOficinas()

        For Each fila As DataRow In DsOficina.Tables(0).Rows
            cb_Oficina.Items.Add(fila(1), fila(0))
        Next

        If cb_Oficina.Items.Count <> 0 Then
            cb_Oficina.Items(0).Selected = True
        End If
    End Sub

    Public Sub LlenaComboAnios()
        DsAnio = Datos.DatosAnio()

        'Dim Dt As DataTable = DatosAnios()

        For Each fila As DataRow In DsAnio.Tables(0).Rows
            cb_Anio.Items.Add(fila(0))
        Next

        If cb_Anio.Items.Count <> 0 Then
            cb_Anio.Items(0).Selected = True
        End If
    End Sub
   
    Public Sub CreaGrilla1()
        DsGrilla = Datos.DatosTxMedRgo(cb_Anio.Value, cb_Oficina.Value)

        pvt_Pivote1.DataSource = DsGrilla.Tables(0)

        If pvt_Pivote1.Fields.Count <> 0 Then
            pvt_Pivote1.DataBind()
            Return
        End If

        Dim Glosa_Medio As PivotGridField = pvt_Pivote1.Fields.Add(DsGrilla.Tables(0).Columns(1).ColumnName, DevExpress.XtraPivotGrid.PivotArea.RowArea)
        Glosa_Medio.Options.AllowDrag = DevExpress.Utils.DefaultBoolean.False
        Glosa_Medio.Options.AllowExpand = DevExpress.Utils.DefaultBoolean.False
        Glosa_Medio.Options.AllowSort = DevExpress.Utils.DefaultBoolean.False
        Glosa_Medio.AreaIndex = 0
        Glosa_Medio.Options.AllowExpand = DevExpress.Utils.DefaultBoolean.True

        Dim Glosa_Rango As PivotGridField = pvt_Pivote1.Fields.Add(DsGrilla.Tables(0).Columns(2).ColumnName, DevExpress.XtraPivotGrid.PivotArea.RowArea)
        Glosa_Rango.Options.AllowDrag = DevExpress.Utils.DefaultBoolean.False
        Glosa_Rango.Options.AllowExpand = DevExpress.Utils.DefaultBoolean.False
        Glosa_Rango.Options.AllowSort = DevExpress.Utils.DefaultBoolean.False
        Glosa_Rango.AreaIndex = 1
        Glosa_Rango.Options.AllowExpand = DevExpress.Utils.DefaultBoolean.True

        Dim Periodo As PivotGridField = pvt_Pivote1.Fields.Add(DsGrilla.Tables(0).Columns(0).ColumnName, DevExpress.XtraPivotGrid.PivotArea.ColumnArea)
        Periodo.Options.AllowDrag = DevExpress.Utils.DefaultBoolean.False
        Periodo.Options.AllowExpand = DevExpress.Utils.DefaultBoolean.False
        Periodo.Options.AllowSort = DevExpress.Utils.DefaultBoolean.False
        Periodo.Options.AllowExpand = DevExpress.Utils.DefaultBoolean.True

        Dim Cantidad As PivotGridField = pvt_Pivote1.Fields.Add(DsGrilla.Tables(0).Columns(3).ColumnName, DevExpress.XtraPivotGrid.PivotArea.DataArea)
        Cantidad.Options.AllowDrag = DevExpress.Utils.DefaultBoolean.False
        Cantidad.Options.AllowExpand = DevExpress.Utils.DefaultBoolean.False
        Cantidad.Options.AllowSort = DevExpress.Utils.DefaultBoolean.False
        Cantidad.CellFormat.FormatType = DevExpress.Utils.FormatType.Numeric
        Cantidad.CellFormat.FormatString = "N0"
        Cantidad.Options.AllowExpand = DevExpress.Utils.DefaultBoolean.True

        'pvt_Pivote1.OptionsView.ShowColumnHeaders = False
        pvt_Pivote1.OptionsView.ShowDataHeaders = False
        pvt_Pivote1.OptionsView.ShowFilterHeaders = False
        'pvt_Pivote1.OptionsView.ShowRowHeaders = False
        pvt_Pivote1.OptionsView.ShowColumnGrandTotals = False
        pvt_Pivote1.OptionsView.ShowRowTotals = False
        pvt_Pivote1.OptionsView.ShowRowGrandTotals = False
        pvt_Pivote1.OptionsView.ShowColumnTotals = False
        pvt_Pivote1.OptionsView.ShowColumnGrandTotals = True

        pvt_Pivote1.DataBind()
    End Sub

    Protected Sub cbp_Grilla_Callback(sender As Object, e As CallbackEventArgsBase)
        CreaGrilla1()
    End Sub

    Protected Sub cb_Oficina_Callback(sender As Object, e As CallbackEventArgsBase)
        LlenaComboOficinas()
    End Sub

    Protected Sub pvt_Pivote1_FieldValueDisplayText(sender As Object, e As PivotFieldDisplayTextEventArgs)
        Try
            If e.Field.FieldName = "PERIODO" Then
                e.DisplayText = Right(e.DisplayText, e.DisplayText.Count - 6)
            End If

            If e.Field.FieldName = "GLOSA_RANGO" Then
                e.DisplayText = Right(e.DisplayText, e.DisplayText.Count - 2)
            End If
        Catch ex As Exception
            Return
        End Try
    End Sub


    Protected Sub btnx_expxls_Click(sender As Object, e As EventArgs) Handles btnx_expxls.Click

        CreaGrilla1()

        Dim ps As New PrintingSystem()
        Dim link1 As New PrintableComponentLink()
        link1.Component = pvex_datos
        link1.PrintingSystem = ps

        Dim link2 As New Link()
        AddHandler link2.CreateDetailArea, AddressOf link2_CreateDetailArea
        link2.PrintingSystem = ps

        Dim compositeLink As New CompositeLink()
        compositeLink.Links.AddRange(New Object() {link2, link1})
        compositeLink.PrintingSystem = ps

        compositeLink.CreateDocument()
        compositeLink.PrintingSystem.ExportOptions.Pdf.DocumentOptions.Author = "Gestran S.A."

        Using stream As New MemoryStream()
            compositeLink.PrintingSystem.ExportToXlsx(stream)
            Response.Clear()
            Response.Buffer = False
            Response.AppendHeader("Content-Type", "application/xlsx")
            Response.AppendHeader("Content-Transfer-Encoding", "binary")
            Response.AppendHeader("Content-Disposition", "attachment; filename=" & rdpx_header.HeaderText & ".xlsx")
            Response.BinaryWrite(stream.ToArray())
            Response.End()
        End Using
        ps.Dispose()

    End Sub

    Private Sub link2_CreateDetailArea(ByVal sender As Object, ByVal e As CreateAreaEventArgs)
        Dim l As Link = TryCast(sender, Link)
        Dim tb As New TextBrick()
        tb.Text = rdpx_header.HeaderText
        tb.StringFormat = New BrickStringFormat(StringAlignment.Center)
        tb.Rect = New RectangleF(0, 0, l.PrintingSystem.Graph.ClientPageSize.Width, 30)
        tb.Sides = BorderSide.None
        e.Graph.DrawBrick(tb)
    End Sub
End Class