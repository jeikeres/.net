Imports DevExpress.Web
Imports DevExpress.Web.ASPxPivotGrid
Imports DevExpress.XtraGrid
Imports Negocio
Imports System.Data
'Imports DevExpress.XtraPivotGrid
Imports DevExpress.XtraPrinting
Imports System.Drawing
Imports DevExpress.XtraPrintingLinks
Imports System.IO


Public Class TransxGrupo_OFI
    Inherits System.Web.UI.Page

    Dim DsOficina As DataSet
    Dim DsAnio As DataSet
    Dim DsGrilla1 As DataSet
    Dim DsGrilla2 As DataSet
    Dim DsLabels As DataSet
    Dim _Ds As DataSet
    Dim Objetos As New Objetos
    Dim Pagina As New cls_CargaPagina
    Dim Datos As New cls_TransOfxGrupo

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LlenaComboAnios()
            LlenaComboOficinas()
            'EditaHorarios()
            CreaGrilla1()
            CreaGrilla2()
            _Ds = Pagina.CargaPermisosPagina(Session("IDUsuario"), System.IO.Path.GetFileName(Request.ServerVariables("SCRIPT_NAME")))
            btnx_expxls.Visible = CType(Objetos.ActivaButtonsPermiso(_Ds, "EXPXLSX"), Boolean)
        Else
            CreaGrilla1()
            CreaGrilla2()
        End If
    End Sub

    Public Sub EditaHorarios()
        DsLabels = Datos.DatosHorarios(cb_Anio.Value, cb_Oficina.Value)

        'DsLabels = DatosHorarios(cb_Oficina.SelectedItem.Value)

        lbl_HorarioNormal.Text = DsLabels.Tables(0).Rows(0)(1)
        lbl_HorarioAdicional.Text = DsLabels.Tables(0).Rows(0)(2)
        lbl_HoraNorSab.Text = DsLabels.Tables(0).Rows(0)(3)
        lbl_HoraNorFest.Text = DsLabels.Tables(0).Rows(0)(4)

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

    Public Sub CreaGrilla1()

        Try

            EditaHorarios()
            DsGrilla1 = Datos.DatosGrupoTxTotal(cb_Anio.Value, cb_Oficina.Value)
            pvt_Pivote1.Fields.Clear()
            pvt_Pivote1.DataSource = DsGrilla1.Tables(0)

            Dim Mes As PivotGridField = pvt_Pivote1.Fields.Add(DsGrilla1.Tables(0).Columns(0).ColumnName, DevExpress.XtraPivotGrid.PivotArea.RowArea)
            Mes.Options.AllowDrag = DevExpress.Utils.DefaultBoolean.False
            Mes.Options.AllowExpand = DevExpress.Utils.DefaultBoolean.False
            Mes.Options.AllowSort = DevExpress.Utils.DefaultBoolean.False
            Mes.Caption = "MES"

            Dim Glosa As PivotGridField = pvt_Pivote1.Fields.Add(DsGrilla1.Tables(0).Columns(1).ColumnName, DevExpress.XtraPivotGrid.PivotArea.ColumnArea)
            Glosa.Options.AllowDrag = DevExpress.Utils.DefaultBoolean.False
            Glosa.Options.AllowExpand = DevExpress.Utils.DefaultBoolean.False
            Glosa.Options.AllowSort = DevExpress.Utils.DefaultBoolean.False
            'Glosa.AreaIndex = 0

            Dim Horario As PivotGridField = pvt_Pivote1.Fields.Add(DsGrilla1.Tables(0).Columns(2).ColumnName, DevExpress.XtraPivotGrid.PivotArea.ColumnArea)
            Horario.Options.AllowDrag = DevExpress.Utils.DefaultBoolean.False
            Horario.Options.AllowExpand = DevExpress.Utils.DefaultBoolean.False
            Horario.Options.AllowSort = DevExpress.Utils.DefaultBoolean.False
            'Horario.AreaIndex = 1

            Dim QTrans As PivotGridField = pvt_Pivote1.Fields.Add(DsGrilla1.Tables(0).Columns(3).ColumnName, DevExpress.XtraPivotGrid.PivotArea.DataArea)
            QTrans.Options.AllowDrag = DevExpress.Utils.DefaultBoolean.False
            QTrans.Options.AllowExpand = DevExpress.Utils.DefaultBoolean.False
            QTrans.Options.AllowSort = DevExpress.Utils.DefaultBoolean.False
            QTrans.CellFormat.FormatType = DevExpress.Utils.FormatType.Numeric
            QTrans.CellFormat.FormatString = "N0"

            'pvt_Pivote1.OptionsView.ShowColumnHeaders = False
            pvt_Pivote1.OptionsView.ShowDataHeaders = False
            pvt_Pivote1.OptionsView.ShowFilterHeaders = False
            'pvt_Pivote1.OptionsView.ShowRowHeaders = False
            pvt_Pivote1.OptionsView.ShowColumnGrandTotals = True
            pvt_Pivote1.OptionsView.ShowRowGrandTotals = False
            pvt_Pivote1.OptionsView.ShowColumnTotals = False
            pvt_Pivote1.OptionsView.ShowColumnHeaders = False


            If pvt_Pivote1.Fields.Count <> 0 Then
                pvt_Pivote1.DataBind()
                Return
            End If

            'pvt_Pivote1.DataBind()

        Catch ex As Exception

        End Try

    End Sub

    Public Sub CreaGrilla2()

        Try

            DsGrilla2 = Datos.DatosGrupoTxFDS(cb_Anio.Value, cb_Oficina.Value)
            pvt_Pivote2.Fields.Clear()
            pvt_Pivote2.DataSource = DsGrilla2.Tables(0)


            Dim Mes As PivotGridField = pvt_Pivote2.Fields.Add(DsGrilla2.Tables(0).Columns(0).ColumnName, DevExpress.XtraPivotGrid.PivotArea.RowArea)
            Mes.Options.AllowDrag = DevExpress.Utils.DefaultBoolean.False
            Mes.Options.AllowExpand = DevExpress.Utils.DefaultBoolean.False
            Mes.Options.AllowSort = DevExpress.Utils.DefaultBoolean.False
            Mes.Caption = "MES FIN DE SEMANA"

            Dim Glosa As PivotGridField = pvt_Pivote2.Fields.Add(DsGrilla2.Tables(0).Columns(1).ColumnName, DevExpress.XtraPivotGrid.PivotArea.ColumnArea)
            Glosa.Options.AllowDrag = DevExpress.Utils.DefaultBoolean.False
            Glosa.Options.AllowExpand = DevExpress.Utils.DefaultBoolean.False
            Glosa.Options.AllowSort = DevExpress.Utils.DefaultBoolean.False
            Glosa.AreaIndex = 0

            Dim Horario As PivotGridField = pvt_Pivote2.Fields.Add(DsGrilla2.Tables(0).Columns(2).ColumnName, DevExpress.XtraPivotGrid.PivotArea.ColumnArea)
            Horario.Options.AllowDrag = DevExpress.Utils.DefaultBoolean.False
            Horario.Options.AllowExpand = DevExpress.Utils.DefaultBoolean.False
            Horario.Options.AllowSort = DevExpress.Utils.DefaultBoolean.False
            Horario.AreaIndex = 1

            Dim QTrans As PivotGridField = pvt_Pivote2.Fields.Add(DsGrilla2.Tables(0).Columns(3).ColumnName, DevExpress.XtraPivotGrid.PivotArea.DataArea)
            QTrans.Options.AllowDrag = DevExpress.Utils.DefaultBoolean.False
            QTrans.Options.AllowExpand = DevExpress.Utils.DefaultBoolean.False
            QTrans.Options.AllowSort = DevExpress.Utils.DefaultBoolean.False
            QTrans.CellFormat.FormatType = DevExpress.Utils.FormatType.Numeric
            QTrans.CellFormat.FormatString = "N0"

            'pvt_Pivote2.OptionsView.ShowColumnHeaders = False
            pvt_Pivote2.OptionsView.ShowDataHeaders = False
            pvt_Pivote2.OptionsView.ShowFilterHeaders = False
            'pvt_Pivote2.OptionsView.ShowRowHeaders = False
            pvt_Pivote2.OptionsView.ShowColumnGrandTotals = True
            pvt_Pivote2.OptionsView.ShowRowGrandTotals = False
            pvt_Pivote2.OptionsView.ShowColumnTotals = False
            pvt_Pivote2.OptionsView.ShowColumnHeaders = False


            If pvt_Pivote2.Fields.Count <> 0 Then
                pvt_Pivote2.DataBind()
                Return
            End If
            'pvt_Pivote2.DataBind()
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub cbp_Grillas_Callback(sender As Object, e As CallbackEventArgsBase)
        CreaGrilla1()
        CreaGrilla2()
        'EditaHorarios()
    End Sub

    Protected Sub cb_Oficina_Callback(sender As Object, e As CallbackEventArgsBase)
        LlenaComboOficinas()
    End Sub

    Protected Sub pvt_Pivote1_FieldValueDisplayText(sender As Object, e As PivotFieldDisplayTextEventArgs)
        Try
            If e.Field.FieldName = "MES" Then
                e.DisplayText = Right(e.DisplayText, e.DisplayText.Count - 2)
            End If
        Catch ex As Exception
            Return
        End Try
    End Sub

    Protected Sub pvt_Pivote2_FieldValueDisplayText(sender As Object, e As PivotFieldDisplayTextEventArgs)
        Try
            If e.Field.FieldName = "MES fin de semana" Then
                e.DisplayText = Right(e.DisplayText, e.DisplayText.Count - 2)
            End If
        Catch ex As Exception
            Return
        End Try
    End Sub

    Protected Sub btnx_expxls_Click(sender As Object, e As EventArgs) Handles btnx_expxls.Click

        Dim ps As New PrintingSystem()
        Dim link0 As New PrintableComponentLink()
        link0.Component = pvex_datos0
        link0.PrintingSystem = ps


        'Dim ps As New PrintingSystem()
        Dim link1 As New PrintableComponentLink()
        link1.Component = pvex_datos
        link1.PrintingSystem = ps

        Dim link2 As New Link()
        AddHandler link2.CreateDetailArea, AddressOf link2_CreateDetailArea
        link2.PrintingSystem = ps

        Dim link3 As New Link()
        link2.PrintingSystem = ps

        Dim compositeLink As New CompositeLink()
        compositeLink.Links.AddRange(New Object() {link2, link1, link3, link0})
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