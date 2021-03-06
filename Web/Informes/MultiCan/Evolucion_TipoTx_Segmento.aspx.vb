﻿Imports System.Data.SqlClient
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

Public Class Evolucion_TipoTx_Segmento
    Inherits System.Web.UI.Page
    Dim Multicanal As New cls_MultiCanal
    Dim _ds As DataSet

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Dim NumFecha As Integer = SetCargaInicial()
            CargaMes(NumFecha)
            CargaFiltros(NumFecha)
            CreaGrafico()
        End If

    End Sub
    Protected Function SetCargaInicial() As Integer
        _ds = Multicanal.ConsultaFiltros("FILTRO INICIAL")
        Return _ds.Tables(0).Rows(0)(0)
    End Function
    Protected Sub CargaFiltros(ByVal NumFecha As Integer)
        _ds = Multicanal.ConsultaFiltros("AÑO")

        NumFecha = Left(NumFecha, 4)

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

        cbbx_anofin.SelectedIndex = 0
        cbbx_anoini.SelectedIndex = 0

        For i = 0 To cbbx_anoini.Items.Count - 1
            If cbbx_anoini.Items(i).Value = NumFecha Then
                cbbx_anoini.SelectedIndex = i
            End If
        Next

        For i = 0 To cbbx_anofin.Items.Count - 1
            If cbbx_anofin.Items(i).Value = NumFecha Then
                cbbx_anofin.SelectedIndex = i
            End If
        Next
    End Sub

    Public Function RetornaSeleccionadas(ByVal Lstx As String, ByVal dde As ASPxDropDownEdit) As String
        Dim lBox As ASPxListBox = dde.FindControl(Lstx)
        Dim LstID As String
        LstID = ""

        For i = 0 To lBox.Items.Count - 1
            If Trim(lBox.Items(i).Value) > 0 Then
                If lBox.Items(i).Selected = True And i > 0 Then
                    LstID &= lBox.Items(i).Value & ","
                End If
            End If
        Next

        If Len(Trim(LstID)) > 1 Then
            LstID = Left(LstID, Len(LstID) - 1)
        End If
        Return LstID
    End Function

    Protected Sub CargaMes(ByVal NumFecha As Integer)

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

    Protected Sub CreaGrafico()

        Dim IDSegmento As String = Nothing
        Dim IDTransaccion As String = Nothing

        IDSegmento = RetornaSeleccionadas("lstx_segmentos", dde_segmento)
        IDTransaccion = RetornaSeleccionadas("lstx_transaccion", dde_transaccion)
        If IDSegmento = "" Then IDSegmento = "0"
        If IDTransaccion = "" Then IDTransaccion = "0"

        Dim Grafico As WebChartControl = TryCast(wchx_pie, WebChartControl)
        Dim i As Integer
        'wchx_barras
        _ds = Multicanal.Evolucion_TipoTx_Segmento(cbbx_anoini.SelectedItem.Value, cbbx_anofin.SelectedItem.Value, cbbx_mesini.SelectedItem.Value, cbbx_mesfin.SelectedItem.Value, IDSegmento, IDTransaccion)

        Grafico.DataSource = _ds.Tables(0)

        Grafico.SeriesDataMember = "CANAL"
        Grafico.SeriesTemplate.ArgumentDataMember = "MES" ' mESES
        Grafico.SeriesTemplate.ChangeView(ViewType.Line)
        Grafico.SeriesTemplate.CrosshairLabelPattern = "{S} : {V:n0}"
        Grafico.SeriesTemplate.Label.TextPattern = "{V:n0}"
        Dim diagram As XYDiagram = CType(Grafico.Diagram, XYDiagram)
        diagram.AxisY.Label.TextPattern = "{V:n0}"
        Grafico.SeriesTemplate.ValueDataMembers.AddRange(New String() {"CANTIDAD"})
        Grafico.SeriesTemplate.LabelsVisibility = DefaultBoolean.True

        Grafico.DataBind()

    End Sub

    Protected Sub wchx_pie_CustomCallback(sender As Object, e As CustomCallbackEventArgs) Handles wchx_pie.CustomCallback
        CreaGrafico()
    End Sub

End Class