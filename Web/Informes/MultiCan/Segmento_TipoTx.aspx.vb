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

Public Class Segmento_TipoTx
    Inherits System.Web.UI.Page
    Dim Multicanal As New cls_MultiCanal
    Dim _ds As DataSet

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack() Then
            Dim NumFecha As Integer = SetCargaInicial()
            CargaMes(NumFecha)
            CargaFiltros(NumFecha)
            CreaGrafico()
        End If
    End Sub

    Protected Sub CreaGrafico()
        Dim Grafico As WebChartControl = TryCast(wchx_barras, WebChartControl)
        Dim i As Integer
        'wchx_barras
        Dim IDSegmento As String = Nothing

        retornaSegmento_Seleccionadas(IDSegmento)
        If IDSegmento = "" Then IDSegmento = "0"

        _ds = Multicanal.SegmetoTipoTx(cbbx_anoini.SelectedItem.Value, cbbx_anofin.SelectedItem.Value, cbbx_mesini.SelectedItem.Value, cbbx_mesfin.SelectedItem.Value, IDSegmento)

        Grafico.DataSource = _ds.Tables(0)
        Grafico.Series.Clear()
        Grafico.SeriesDataMember = "CANAL"
        Grafico.SeriesTemplate.ArgumentDataMember = "TIPOTX"
        'Grafico.SeriesTemplate.ChangeView(ViewType.SideBySideStackedBar3D)
        Dim diagram As XYDiagram3D = CType(Grafico.Diagram, XYDiagram3D)
        diagram.AxisY.Label.TextPattern = "{V:n0}"

        Grafico.SeriesTemplate.CrosshairLabelPattern = "{S} : {V:n0}"
        Grafico.SeriesTemplate.Label.TextPattern = "{V:n0}"

        Grafico.SeriesTemplate.ValueDataMembers.AddRange(New String() {"CANTIDAD"})
        Grafico.SeriesTemplate.LabelsVisibility = DefaultBoolean.True

        Grafico.DataBind()
    End Sub

    Public Sub retornaSegmento_Seleccionadas(ByRef IDSegmento As String)
        Dim lBoxSuc As ASPxListBox = dde_segmento.FindControl("lstx_segmentos")
        IDSegmento = ""

        For i = 0 To lBoxSuc.Items.Count - 1
            If Trim(lBoxSuc.Items(i).Value) > 0 Then
                If lBoxSuc.Items(i).Selected = True And i > 0 Then
                    IDSegmento &= lBoxSuc.Items(i).Value & ","
                End If
            End If
        Next

        If Len(Trim(IDSegmento)) > 1 Then
            IDSegmento = Left(IDSegmento, Len(IDSegmento) - 1)
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
    Protected Sub CargaMes(ByVal NumFecha As Integer)
        _ds = Multicanal.ConsultaFiltros("MES")
        Dim _ds2 As DataSet = _ds

        NumFecha = Right(NumFecha, 2)

        Dim DefaultItem As New ListEditItem("TODOS", 0)
        cbbx_mesini.Items.Insert(0, DefaultItem)

        For i = 0 To _ds.Tables(0).Rows.Count - 1 Step 1
            Dim Item As New ListEditItem(CultureInfo.CurrentUICulture.DateTimeFormat.MonthNames(CInt(Fix(_ds2.Tables(0).Rows(i)(0) - 1))).ToUpper, i + 1)
            cbbx_mesini.Items.Insert(i + 1, Item)
        Next
        cbbx_mesini.DataBind()
        cbbx_mesini.SelectedIndex = 0

        For i = 0 To cbbx_mesini.Items.Count - 1
            If cbbx_mesini.Items(i).Value = NumFecha Then
                cbbx_mesini.SelectedIndex = i
            End If
        Next

        Dim DefaultItem1 As New ListEditItem("TODOS", 0)
        cbbx_mesfin.Items.Insert(0, DefaultItem1)

        For i = 0 To _ds.Tables(0).Rows.Count - 1 Step 1
            Dim Item1 As New ListEditItem(CultureInfo.CurrentUICulture.DateTimeFormat.MonthNames(CInt(Fix(_ds.Tables(0).Rows(i)(0) - 1))).ToUpper, i + 1)
            cbbx_mesfin.Items.Insert(i + 1, Item1)
        Next
        cbbx_mesfin.DataBind()
        cbbx_mesfin.SelectedIndex = 0

        For i = 0 To cbbx_mesfin.Items.Count - 1
            If cbbx_mesfin.Items(i).Value = NumFecha Then
                cbbx_mesfin.SelectedIndex = i
            End If
        Next
    End Sub

    Protected Sub wchx_barras_CustomCallback(sender As Object, e As CustomCallbackEventArgs) Handles wchx_barras.CustomCallback
        CreaGrafico()
    End Sub
End Class