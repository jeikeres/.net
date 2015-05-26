Imports System.Data.SqlClient
Imports DevExpress.Web.ASPxTreeList
Imports DevExpress.Web
Imports Negocio
Imports DevExpress.Web.ASPxPivotGrid
Imports DevExpress.XtraPivotGrid.Data
Imports Web.OrdenamientoxComparacion
Imports System.Globalization
Imports DevExpress.XtraCharts
Imports DevExpress.XtraCharts.Web
Imports System.Drawing
Imports DevExpress.Utils

Public Class TipoTx_Segmento
    Inherits System.Web.UI.Page
    Dim Multicanal As New cls_MultiCanal
    Dim _ds As DataSet

    Protected Sub CreaGrafico()
        Dim Grafico As WebChartControl = TryCast(wchx_barras, WebChartControl)
        Dim i As Integer
        'wchx_barras
        _ds = Multicanal.TipoTxSegmeto(cbbx_anoini.SelectedItem.Value, cbbx_anofin.SelectedItem.Value, cbbx_mesini.SelectedItem.Value, cbbx_mesfin.SelectedItem.Value, cbbx_tipotx.SelectedItem.Value)

        Grafico.DataSource = _ds.Tables(0)

        Grafico.SeriesDataMember = "CANAL"
        Grafico.SeriesTemplate.ArgumentDataMember = "SEGMENTO"
        Grafico.SeriesTemplate.ValueDataMembers.AddRange(New String() {"CANTIDAD"})
        Grafico.SeriesTemplate.CrosshairLabelPattern = "{S} : {V:n0}"
        Grafico.SeriesTemplate.Label.TextPattern = "{V:n0}"
        Grafico.SeriesTemplate.LabelsVisibility = DefaultBoolean.True

        Grafico.DataBind()
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack() Then
            CargaMes()
            CargaFiltros()
            CreaGrafico()
        End If
    End Sub
    Protected Sub CargaFiltros()
        _ds = Multicanal.ConsultaFiltros("AÑO")

        cbbx_anoini.Items.Clear()
        cbbx_anoini.ValueField = "ANO"
        cbbx_anoini.TextField = "NOMBRE"
        cbbx_anoini.DataSource = _ds
        cbbx_anoini.DataBind()

        cbbx_anofin.Items.Clear()
        cbbx_anofin.ValueField = "ANO"
        cbbx_anofin.TextField = "NOMBRE"
        cbbx_anofin.DataSource = _ds
        cbbx_anofin.DataBind()

        _ds = Multicanal.ConsultaFiltros("TIPOTX")

        cbbx_tipotx.Items.Clear()
        cbbx_tipotx.ValueField = "ID"
        cbbx_tipotx.TextField = "NOMBRE"
        cbbx_tipotx.DataSource = _ds
        cbbx_tipotx.DataBind()

        cbbx_tipotx.SelectedIndex = 0
        cbbx_anofin.SelectedIndex = 0
        cbbx_anoini.SelectedIndex = 0

    End Sub
    Protected Sub CargaMes()
        _ds = Multicanal.ConsultaFiltros("MES")
        Dim _ds2 As DataSet = _ds

        Dim DefaultItem As New ListEditItem("TODOS", 0)
        cbbx_mesini.Items.Insert(0, DefaultItem)

        For i = 0 To _ds.Tables(0).Rows.Count - 1 Step 1
            Dim Item As New ListEditItem(CultureInfo.CurrentUICulture.DateTimeFormat.MonthNames(CInt(Fix(_ds2.Tables(0).Rows(i)(0) - 1))).ToUpper, i + 1)
            cbbx_mesini.Items.Insert(i + 1, Item)
        Next
        cbbx_mesini.DataBind()
        cbbx_mesini.SelectedIndex = 0

        Dim DefaultItem1 As New ListEditItem("TODOS", 0)
        cbbx_mesfin.Items.Insert(0, DefaultItem1)

        For i = 0 To _ds.Tables(0).Rows.Count - 1 Step 1
            Dim Item1 As New ListEditItem(CultureInfo.CurrentUICulture.DateTimeFormat.MonthNames(CInt(Fix(_ds.Tables(0).Rows(i)(0) - 1))).ToUpper, i + 1)
            cbbx_mesfin.Items.Insert(i + 1, Item1)
        Next
        cbbx_mesfin.DataBind()
        cbbx_mesfin.SelectedIndex = 0
    End Sub

    Protected Sub wchx_barras_CustomCallback(sender As Object, e As CustomCallbackEventArgs) Handles wchx_barras.CustomCallback
        CreaGrafico()
    End Sub
End Class