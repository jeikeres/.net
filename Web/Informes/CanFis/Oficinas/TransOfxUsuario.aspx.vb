Imports Negocio
Imports DevExpress.Web
Imports System.Data
Imports DevExpress.XtraPrinting
Imports System.Drawing
Imports DevExpress.XtraPrintingLinks
Imports System.IO


Public Class Pantalla4
    Inherits System.Web.UI.Page

    Dim DsOficina As DataSet
    Dim DsAnio As DataSet
    Dim DsMeses As DataSet
    Dim DsGrilla1 As DataSet
    Dim DsGrilla2 As DataSet
    Dim TD As New cls_tabladinamica
    Dim _Ds As DataSet
    Dim Objetos As New Objetos
    Dim Pagina As New cls_CargaPagina
    Dim Datos As New cls_TransOfxUsuario

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LlenaComboAnios()
            LlenaListMeses()
            LlenaComboOficinas()
            LlenaGrilla1()
            LlenaGrilla2()
            gv_Grilla1.ExpandAll()
            gv_Grilla2.ExpandAll()

            _Ds = Pagina.CargaPermisosPagina(Session("IDUsuario"), System.IO.Path.GetFileName(Request.ServerVariables("SCRIPT_NAME")))
            btnx_expxls.Visible = CType(Objetos.ActivaButtonsPermiso(_Ds, "EXPXLSX"), Boolean)
        End If

        If gv_Grilla1.IsCallback Then
            LlenaGrilla1()
        End If

        If gv_Grilla2.IsCallback Then
            LlenaGrilla2()
        End If
    End Sub

    Function DatosAnios() As DataTable
        Dim Dt As New DataTable

        Dt.Columns.Add("Anio", GetType(String))

        Dim AnioActual As Integer = DateTime.Now.Year

        For i As Integer = 0 To 4
            Dt.Rows.Add(CStr(AnioActual - i))
        Next

        Return Dt
    End Function

    Public Sub LlenaComboAnios()
        DsAnio = Datos.DatosAnios()

        cb_Anio.Items.Clear()
        'Dim Dt As DataTable = DatosAnios()

        For Each fila As DataRow In DsAnio.Tables(0).Rows
            cb_Anio.Items.Add(fila(0))
        Next

        cb_Anio.Items(0).Selected = True
    End Sub

    Public Sub LlenaListMeses()
        'Dim Dt As DataTable = DatosMeses()

        DsMeses = Datos.DatosMeses(cb_Anio.Value)

        cb_Mes.Items.Clear()

        Dim AnioActual As Integer = DateTime.Now.Year
        Dim MesActual As Integer = DateTime.Now.Month

        For Each fila As DataRow In DsMeses.Tables(0).Rows
            Dim Value As String = Left(fila(0), 2)
            Dim Text As String = Right(fila(0), fila(0).ToString.Length - 2)
            cb_Mes.Items.Add(Text, Value)
        Next

        If cb_Anio.Items.Count <> 0 Then
            If AnioActual = Convert.ToInt32(cb_Anio.Value) Then
                cb_Mes.Items(cb_Mes.Items.Count - 1).Selected = True
            Else
                cb_Mes.Items(0).Selected = True
            End If
        End If
    End Sub

    Public Sub LlenaComboOficinas()
        DsOficina = Datos.DatosOficinas(cb_Anio.Value, cb_Mes.Value)

        cb_Oficina.Items.Clear()

        For Each fila As DataRow In DsOficina.Tables(0).Rows
            cb_Oficina.Items.Add("Oficina " & fila(0), fila(0))
        Next

        If cb_Oficina.Items.Count <> 0 Then
            cb_Oficina.Items(0).Selected = True
        End If
    End Sub

    Public Sub LlenaGrilla1()
        Dim Grilla As ASPxGridView = CType(gv_Grilla1, ASPxGridView)

        DsGrilla1 = Datos.DatosUsuariosTotales(cb_Anio.Value, cb_Mes.Value, cb_Oficina.Value)

        'Dim Dt As DataTable = DatosGrilla1(cb_Oficina.Value, cb_Anio.Value, cb_Mes.Value)

        Grilla.DataSource = DsGrilla1.Tables(0)

        If Grilla.Columns.Count <> 0 Then
            Grilla.DataBind()
            Return
        End If

        Dim CodTx As New GridViewDataTextColumn
        CodTx.FieldName = DsGrilla1.Tables(0).Columns(0).ColumnName
        CodTx.VisibleIndex = 0
        CodTx.Settings.HeaderFilterMode = HeaderFilterMode.CheckedList
        Grilla.Columns.Add(CodTx)

        Dim GlosaTx As New GridViewDataTextColumn
        GlosaTx.FieldName = DsGrilla1.Tables(0).Columns(1).ColumnName
        GlosaTx.VisibleIndex = 1
        GlosaTx.Settings.HeaderFilterMode = HeaderFilterMode.CheckedList
        Grilla.Columns.Add(GlosaTx)

        Dim SumaTxs As New GridViewDataTextColumn
        SumaTxs.FieldName = DsGrilla1.Tables(0).Columns(2).ColumnName
        SumaTxs.VisibleIndex = 2
        SumaTxs.Settings.HeaderFilterMode = HeaderFilterMode.CheckedList
        SumaTxs.PropertiesTextEdit.DisplayFormatString = "N0"
        Grilla.Columns.Add(SumaTxs)

        Grilla.GroupBy(Grilla.Columns(0))

        Dim Total As ASPxSummaryItem = New ASPxSummaryItem
        Total.FieldName = DsGrilla1.Tables(0).Columns(2).ColumnName
        Total.SummaryType = DevExpress.Data.SummaryItemType.Sum
        Total.DisplayFormat = "{0}"
        Grilla.GroupSummary.Add(Total)

        Grilla.Settings.ShowHeaderFilterButton = True
        Grilla.Settings.ShowGroupPanel = True
        Grilla.SettingsBehavior.AllowDragDrop = False
        Grilla.SettingsBehavior.AllowSort = False
        Grilla.SettingsPager.PageSize = 12
        Grilla.Styles.GroupRow.Font.Bold = True

        Grilla.DataBind()
    End Sub

    Public Sub LlenaGrilla2()
        Dim Grilla As ASPxGridView = CType(gv_Grilla2, ASPxGridView)

        DsGrilla2 = Datos.DatosUsuariosFDS(cb_Anio.Value, cb_Mes.Value, cb_Oficina.Value)

        'Dim Dt As DataTable = DatosGrilla2(cb_Oficina.Value, cb_Anio.Value, cb_Mes.Value)

        Grilla.DataSource = DsGrilla2.Tables(0)

        If Grilla.Columns.Count <> 0 Then
            Grilla.DataBind()
            Return
        End If

        Dim CodTx As New GridViewDataColumn
        CodTx.FieldName = DsGrilla2.Tables(0).Columns(0).ColumnName
        CodTx.VisibleIndex = 0
        CodTx.Settings.HeaderFilterMode = HeaderFilterMode.CheckedList
        Grilla.Columns.Add(CodTx)

        Dim GlosaTx As New GridViewDataTextColumn
        GlosaTx.FieldName = DsGrilla2.Tables(0).Columns(1).ColumnName
        GlosaTx.VisibleIndex = 1
        GlosaTx.Settings.HeaderFilterMode = HeaderFilterMode.CheckedList
        Grilla.Columns.Add(GlosaTx)

        Dim SumaTxs As New GridViewDataTextColumn
        SumaTxs.FieldName = DsGrilla2.Tables(0).Columns(2).ColumnName
        SumaTxs.VisibleIndex = 2
        SumaTxs.Settings.HeaderFilterMode = HeaderFilterMode.CheckedList
        SumaTxs.PropertiesTextEdit.DisplayFormatString = "N0"
        Grilla.Columns.Add(SumaTxs)

        Grilla.GroupBy(Grilla.Columns(0))

        Dim Total As ASPxSummaryItem = New ASPxSummaryItem
        Total.FieldName = DsGrilla2.Tables(0).Columns(2).ColumnName
        Total.SummaryType = DevExpress.Data.SummaryItemType.Sum
        Total.DisplayFormat = "<b>{0}</b>"
        Grilla.GroupSummary.Add(Total)

        Grilla.Settings.ShowHeaderFilterButton = True
        Grilla.Settings.ShowGroupPanel = True
        Grilla.SettingsBehavior.AllowDragDrop = False
        Grilla.SettingsBehavior.AllowSort = False
        Grilla.SettingsPager.PageSize = 12
        Grilla.Styles.GroupRow.Font.Bold = True

        Grilla.DataBind()
    End Sub

    Protected Sub ASPxCallbackPanel1_Callback(sender As Object, e As CallbackEventArgsBase)
        LlenaGrilla1()
        LlenaGrilla2()

        gv_Grilla1.ExpandAll()
        gv_Grilla2.ExpandAll()
    End Sub

    Protected Sub gv_Grilla1_HeaderFilterFillItems(sender As Object, e As ASPxGridViewHeaderFilterEventArgs)
        Dim Grilla As ASPxGridView = CType(sender, ASPxGridView)

        If e.Column.VisibleIndex = Grilla.Columns.Count - 1 Then
            Dim NombreCampo As String = e.Column.FieldName
            PrepareSumaFilterItems(e, NombreCampo)
        End If
    End Sub

    Protected Sub gv_Grilla1_CustomCallback(sender As Object, e As ASPxGridViewCustomCallbackEventArgs)
        If e.Parameters.Contains("CleanFilter") Then
            gv_Grilla1.FilterExpression = String.Empty
            gv_Grilla1.ExpandAll()
            Return
        End If

        If e.Parameters.Contains("CleanSort") Then
            gv_Grilla1.ClearSort()
            gv_Grilla1.GroupBy(gv_Grilla1.Columns(0))
            gv_Grilla1.ExpandAll()
            Return
        End If
    End Sub

    Protected Sub gv_Grilla2_HeaderFilterFillItems(sender As Object, e As ASPxGridViewHeaderFilterEventArgs)
        Dim Grilla As ASPxGridView = CType(sender, ASPxGridView)

        If e.Column.VisibleIndex = Grilla.Columns.Count - 1 Then
            Dim NombreCampo As String = e.Column.FieldName
            PrepareSumaFilterItems(e, NombreCampo)
        End If
    End Sub

    Protected Sub gv_Grilla2_CustomCallback(sender As Object, e As ASPxGridViewCustomCallbackEventArgs)
        If e.Parameters.Contains("CleanFilter") Then
            gv_Grilla2.FilterExpression = String.Empty
            gv_Grilla2.ExpandAll()
            Return
        End If

        If e.Parameters.Contains("CleanSort") Then
            gv_Grilla2.ClearSort()
            gv_Grilla2.GroupBy(gv_Grilla1.Columns(0))
            gv_Grilla2.ExpandAll()
            Return
        End If
    End Sub

    Protected Overridable Sub PrepareSumaFilterItems(ByVal e As ASPxGridViewHeaderFilterEventArgs, NombreCampo As String)
        e.Values.Clear()
        If e.Column.Settings.HeaderFilterMode = HeaderFilterMode.List Then
            e.AddShowAll()
        End If
        Dim [step] As Integer = 100
        For i As Integer = 0 To 9
            Dim start As Integer = [step] * i
            Dim [end] As Integer = start + [step] - 1
            e.AddValue(String.Format("De {0} a {1}", start, [end]), "", String.Format("[{2}] >= {0} and [{2}] <= {1}", start, [end], NombreCampo))
        Next i
        e.AddValue(String.Format("> {0}", 1000), "", "[" & NombreCampo & "] > 1000")
    End Sub

    Protected Sub cb_Mes_Callback(sender As Object, e As CallbackEventArgsBase)
        LlenaListMeses()
    End Sub

    Protected Sub cb_Oficina_Callback(sender As Object, e As CallbackEventArgsBase)
        LlenaComboOficinas()
    End Sub


    Protected Sub btnx_expxls_Click(sender As Object, e As EventArgs) Handles btnx_expxls.Click

        LlenaGrilla1()
        LlenaGrilla2()
     

        Dim ps As New PrintingSystem()
        Dim link0 As New PrintableComponentLink()
        link0.Component = pvex_datos1
        link0.PrintingSystem = ps

        Dim link1 As New PrintableComponentLink()
        link1.Component = pvex_datos2
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