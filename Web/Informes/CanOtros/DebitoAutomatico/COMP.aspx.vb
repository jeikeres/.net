Imports System.Data.SqlClient
Imports DevExpress.XtraCharts
Imports DevExpress
Imports DevExpress.Web
Imports Negocio

Public Class COMP_DBAUTO
    Inherits System.Web.UI.Page

    Dim COMP As New cls_composiciones
    Dim _Ds As DataSet
    Dim Objetos As New Objetos
    Dim Pagina As New cls_CargaPagina
    Const Canal As Integer = 11

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Me._Tab1_WebChar1.Visible = False
            Pobla_periodo()
        End If
    End Sub

    Public Function Genera_Graficos(ByVal _sValor01 As String, ByVal _sValor02 As String) As Boolean
        Dim _iMaxima As Integer = 100


        Select Case _sValor01
            Case Is = 1
                '--------------------------------------------------------------------------
                '                       Participación por tipo de Transaccion
                '-------------------------------------------------------------------------
                _Ds = COMP.Retorna_Info_GraficaTipoTx(_sValor02, Canal)
                Dim _iInc_Gr As Integer = 0

                If Me._Ds.Tables.Count > 0 Then
                    If Me._Ds.Tables(0).Rows.Count > 0 Then

                        '1) - *********************** TITULO DEL GRAFICO************************
                        ' Create chart titles.
                        Dim chartTitle1 As New ChartTitle()

                        ' Define the text for the titles.
                        chartTitle1.Text = "Participación Por Tipo de Transacción"

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
                        _Tab1_WebChar1.Titles.AddRange(New ChartTitle() {chartTitle1})
                        ' *********************** FIN TITULO DEL GRAFICO************************


                        _Tab1_WebChar1.Series.Clear()
                        _Tab1_WebChar1.BorderOptions.Color = Drawing.Color.White

                        _Tab1_WebChar1.Legend.TextVisible = True

                        'Declaramos una variable del tipo Series
                        Dim series1 As Series = New Series()

                        'Agregamos la serie al componente
                        _Tab1_WebChar1.Series.Add(series1)

                        'Cambiamos el tipo de grafico de la Serie al tipo Linea
                        series1.ChangeView(ViewType.Pie3D)

                        'Asignamos el nombre de la Serie
                        series1.Name = "Caudal"
                        'series1.LegendText = "Servicios"

                        series1.Label.PointOptions.ValueNumericOptions.Format = NumericFormat.Percent
                        series1.Label.PointOptions.ValueNumericOptions.Precision = 1

                        'Asignamos el nombre campo del argumento
                        series1.ArgumentDataMember = "Indice"

                        'Asignamos del nombre del campo de los datos a graficar
                        series1.ValueDataMembers.AddRange("Cantidad")

                        ''Lineas la serie
                        series1.LabelsVisibility = DevExpress.Utils.DefaultBoolean.True

                        Dim ExplodedPoints As XtraCharts.ExplodedSeriesPointCollection = (CType(_Tab1_WebChar1.Series(0).View, XtraCharts.PieSeriesViewBase)).ExplodedPoints

                        CType(_Tab1_WebChar1.Series(0).View, XtraCharts.PieSeriesViewBase).ExplodedPoints.Clear()
                        CType(_Tab1_WebChar1.Series(0).View, XtraCharts.PieSeriesViewBase).ExplodeMode = PieExplodeMode.All
                        CType(_Tab1_WebChar1.Series(0).View, XtraCharts.PieSeriesViewBase).ExplodedDistancePercentage = 15

                        'Asignamos los datos por medio de un DataSet a la Serie
                        CType(series1.Label, PieSeriesLabel).Position = PieSeriesLabelPosition.TwoColumns
                        CType(series1.Label, PieSeriesLabel).ResolveOverlappingMode = ResolveOverlappingMode.Default

                        series1.LegendPointOptions.PointView = PointView.Argument

                        _Tab1_WebChar1.Legend.AlignmentVertical = LegendAlignmentVertical.BottomOutside
                        _Tab1_WebChar1.Legend.AlignmentHorizontal = LegendAlignmentHorizontal.Center
                        _Tab1_WebChar1.Legend.Antialiasing = True
                        _Tab1_WebChar1.Legend.Direction = LegendDirection.LeftToRight
                        _Tab1_WebChar1.DataSource = _Ds
                        _Tab1_WebChar1.DataBind()

                    End If
                End If
                Me._Tab1_WebChar1.Visible = True


        End Select
        Return True
    End Function

    Public Sub Pobla_periodo()
        Try
            Me.cb_periodo.Items.Clear()
            _Ds = COMP.Extrae_Periodo(Canal)

            If _Ds.Tables.Count Then
                For x As Integer = 0 To _Ds.Tables(0).Rows.Count - 1
                    Me.cb_periodo.Items.Add(_Ds.Tables(0).Rows(x)("GLOSA"))
                    Me.cb_periodo.Items(x).Value = CInt(_Ds.Tables(0).Rows(x)("CODIGO"))
                Next
            End If

            Me.cb_periodo.SelectedIndex = -1
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub cbpx_panel_Callback(sender As Object, e As CallbackEventArgsBase) Handles cbpx_panel.Callback

        If Me.cb_periodo.SelectedIndex <> -1 Then
            Dim _avalor As String = Me.cb_periodo.SelectedItem.Value

            Genera_Graficos(1, _avalor)
        End If
    End Sub
End Class