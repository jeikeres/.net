Imports System.Data.SqlClient
Imports DevExpress.XtraCharts
Imports DevExpress.XtraCharts.Web
Imports DevExpress
Imports DevExpress.Web
Imports Negocio

Public Class TEND_CB
    Inherits System.Web.UI.Page

    Dim TEND As New cls_tendencias
    Dim _Ds As DataSet
    Dim Objetos As New Objetos
    Dim Pagina As New cls_CargaPagina
    Const Canal As Integer = 27

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'Me._Tab1_WebChar1.Visible = False
            'Me._Tab1_WebChar2.Visible = False
            'Me._Tab1_WebChar3.Visible = False
            'Me._Tab1_WebChar4.Visible = False

            Genera_Graficos(1, "TX Monetarias", _Tab1_WebChar1, "Cifras en millones")
            Genera_Graficos(2, "Consultas", _Tab1_WebChar2, "Cifras en millones")
            Genera_Graficos(3, "Montos", _Tab1_WebChar3, "Montos en millones", "$")

        End If
    End Sub

    Public Function Genera_Graficos(ByVal Opcion As String, ByVal Titulo As String, ByVal WebChart As WebChartControl, ByVal TituloY As String, Optional ByVal Signo As String = "") As Boolean
        Dim _iMaxima As Integer = 100

        Select Case Opcion
            Case Is = 1
                _Ds = TEND.Retorna_Info_GraficaTxMon(Canal)
            Case Is = 2
                _Ds = TEND.Retorna_Info_GraficaCons(Canal)
            Case Is = 3
                _Ds = TEND.Retorna_Info_GraficaMon(Canal)
            Case Is = 4
                _Ds = TEND.Retorna_Info_GraficaCli(Canal)
        End Select

        Dim _iInc_Gr As Integer = 0

        If Me._Ds.Tables.Count > 0 Then
            If Me._Ds.Tables(0).Rows.Count > 0 Then


                '1) - *********************** TITULO DEL GRAFICO************************
                ' Create chart titles.
                Dim chartTitle1 As New ChartTitle()

                ' Define the text for the titles.
                chartTitle1.Text = Titulo

                chartTitle1.WordWrap = True
                chartTitle1.MaxLineCount = 1

                ' Define the alignment of the titles.
                chartTitle1.Alignment = Drawing.StringAlignment.Center

                ' Place the titles where it's required.
                chartTitle1.Dock = ChartTitleDockStyle.Top

                ' Customize a title's appearance.
                chartTitle1.Antialiasing = True
                chartTitle1.Font = New Drawing.Font("Tahoma", 10, Drawing.FontStyle.Bold)
                chartTitle1.TextColor = Drawing.Color.Black
                chartTitle1.Indent = 10

                ' Add the titles to the chart.
                WebChart.Titles.AddRange(New ChartTitle() {chartTitle1})
                ' *********************** FIN TITULO DEL GRAFICO************************


                WebChart.Series.Clear()

                WebChart.Legend.AlignmentVertical = LegendAlignmentVertical.BottomOutside
                WebChart.Legend.AlignmentHorizontal = LegendAlignmentHorizontal.Center
                WebChart.Legend.Antialiasing = True
                WebChart.Legend.Direction = LegendDirection.RightToLeft

                'Declaramos una variable del tipo Series
                Dim series1 As Series = New Series()
                Dim series2 As Series = New Series()
                Dim series3 As Series = New Series()
                Dim series4 As Series = New Series()

                'Agregamos la serie al componente
                WebChart.Series.Add(series1)
                WebChart.Series.Add(series2)
                WebChart.Series.Add(series3)
                WebChart.Series.Add(series4)

                'Cambiamos el tipo de grafico de la Serie al tipo Linea
                series1.ChangeView(ViewType.Line)
                series2.ChangeView(ViewType.Line)
                series3.ChangeView(ViewType.Line)
                series4.ChangeView(ViewType.Line)

                'Asignamos el nombre de la Serie
                'series1.Name = "Caudal"
                series1.LegendText = "2014"
                series2.LegendText = "2013"
                series3.LegendText = "2012"
                series4.LegendText = "2011"

                'Asignamos el nombre campo del argumento
                series1.ArgumentDataMember = "mes1"
                series2.ArgumentDataMember = "mes2"
                series3.ArgumentDataMember = "mes3"
                series4.ArgumentDataMember = "mes4"

                'Asignamos el tipo de valor del Argumento
                series1.ArgumentScaleType = ScaleType.Auto
                series2.ArgumentScaleType = ScaleType.Auto
                series3.ArgumentScaleType = ScaleType.Auto
                series4.ArgumentScaleType = ScaleType.Auto

                'Asignamos del nombre del campo de los datos a graficar
                series1.ValueDataMembers.AddRange("qtrans1")
                series2.ValueDataMembers.AddRange("qtrans2")
                series3.ValueDataMembers.AddRange("qtrans3")
                series4.ValueDataMembers.AddRange("qtrans4")

                'Asignamos el tipo de valor de los datos a graficar
                series1.ValueScaleType = ScaleType.Numerical

                'Lineas la serie
                series1.LabelsVisibility = DevExpress.Utils.DefaultBoolean.True
                series1.Label.LineVisible = True
                series1.SeriesPointsSorting = SortingMode.None

                series2.LabelsVisibility = DevExpress.Utils.DefaultBoolean.True
                series2.Label.LineVisible = True
                series2.SeriesPointsSorting = SortingMode.None
                'Cambiamos el color de la linea a Azul
                ' CType(series1.View, LineSeriesView).Color = Drawing.Color.Blue


                'Ocultamos los marcadores de la linea para que no se vea abultada
                CType(series1.View, LineSeriesView).LineMarkerOptions.BorderVisible = False
                CType(series1.View, LineSeriesView).LineMarkerOptions.Kind = MarkerKind.Square
                CType(series1.View, LineSeriesView).LineMarkerOptions.Size = 10

                CType(series2.View, LineSeriesView).LineMarkerOptions.BorderVisible = False
                CType(series2.View, LineSeriesView).LineMarkerOptions.Kind = MarkerKind.Triangle
                CType(series2.View, LineSeriesView).LineMarkerOptions.Size = 10

                CType(series3.View, LineSeriesView).LineMarkerOptions.BorderVisible = False
                CType(series3.View, LineSeriesView).LineMarkerOptions.Kind = MarkerKind.Pentagon
                CType(series3.View, LineSeriesView).LineMarkerOptions.Size = 10

                CType(series4.View, LineSeriesView).LineMarkerOptions.BorderVisible = False
                CType(series4.View, LineSeriesView).LineMarkerOptions.Kind = MarkerKind.Diamond
                CType(series4.View, LineSeriesView).LineMarkerOptions.Size = 10

                'Ponemos el grueso de la linea a 1
                CType(series1.View, LineSeriesView).LineStyle.Thickness = 2
                CType(series2.View, LineSeriesView).LineStyle.Thickness = 2
                CType(series3.View, LineSeriesView).LineStyle.Thickness = 2
                CType(series4.View, LineSeriesView).LineStyle.Thickness = 2

                '' '' ''Titulo de la serie BHorizontal 
                ' '' ''CType(series1.View, LineSeriesView).AxisX.GridSpacing = 5
                ' '' ''CType(series1.View, LineSeriesView).AxisX.Label.Font = New Drawing.Font("Tahoma", 8, Drawing.FontStyle.Regular)
                ' '' ''CType(series1.View, LineSeriesView).AxisX.Label.Angle = 0

                '' '' '' Customize the appearance of the Y-axis title.
                ' '' ''CType(series1.View, LineSeriesView).AxisY.Range.MaxValue = _iMaxima

                series1.Label.TextPattern = "{V:n0}"
                series2.Label.TextPattern = "{V:n0}"
                series3.Label.TextPattern = "{V:n0}"
                series4.Label.TextPattern = "{V:n0}"

                series1.CrosshairLabelPattern = "{S} : {V:n0}"
                series2.CrosshairLabelPattern = "{S} : {V:n0}"
                series3.CrosshairLabelPattern = "{S} : {V:n0}"
                series4.CrosshairLabelPattern = "{S} : {V:n0}"

                Dim diagram As XYDiagram = CType(WebChart.Diagram, XYDiagram)

                diagram.AxisY.Label.TextPattern = Signo & " {V:n0}"
                diagram.AxisY.Title.Text = TituloY
                diagram.AxisY.Title.Visibility = Utils.DefaultBoolean.True
                diagram.AxisY.Title.Font = New Drawing.Font("Tahoma", 10, Drawing.FontStyle.Regular)


                '' '' ''Espaciado entre la serie Vertical
                CType(series1.View, LineSeriesView).AxisY.GridSpacingAuto = True
                CType(series2.View, LineSeriesView).AxisY.GridSpacingAuto = True
                CType(series3.View, LineSeriesView).AxisY.GridSpacingAuto = True
                CType(series4.View, LineSeriesView).AxisY.GridSpacingAuto = True
                ' '' ''CType(series1.View, LineSeriesView).AxisY.GridSpacing = 10

                CType(WebChart.Diagram, DevExpress.XtraCharts.XYDiagram).Rotated = False
                CType(WebChart.Diagram, XYDiagram).EnableAxisXZooming = True

                'Asignamos los datos por medio de un DataSet a la Serie
                WebChart.DataSource = _Ds
                WebChart.DataBind()

            End If
        End If
        Return True
    End Function

End Class