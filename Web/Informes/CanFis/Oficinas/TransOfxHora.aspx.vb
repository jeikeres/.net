Imports DevExpress.Web
Imports DevExpress.Web.ASPxListBox
Imports DevExpress.XtraCharts
Imports DevExpress.XtraCharts.Web
Imports Negocio
Imports System.Data

Public Class Pantalla3
    Inherits System.Web.UI.Page

    Dim DsOficina As DataSet
    Dim DsAnio As DataSet
    Dim DsMeses As DataSet
    Dim DsDias As DataSet
    Dim DsGrafico As DataSet
    Dim DsLabels As DataSet
    'Dim TD As New cls_tabladinamica
    'Dim _Ds As DataSet
    'Dim Objetos As New Objetos
    'Dim Pagina As New cls_CargaPagina
    Dim Datos As New cls_TransOfxHora

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'EditaHorarios()
            LlenaListAnios()

            If lbx_Anio.Items.Count <> 0 Then
                lbx_Anio.Items(0).Selected = True
            End If

            LlenaListMeses()

            'lbx_Mes.Items(DateTime.Now.Month - 1).Selected = True

            LlenaListDias()


            'lbx_Dia.Items(DateTime.Now.Day - 1).Selected = True

            LlenaListOficinas()

            If lbx_Oficina.Items.Count <> 0 Then
                lbx_Oficina.Items(0).Selected = True
            End If

            LlenaGrafico()

            '_Ds = Pagina.CargaPermisosPagina(Session("IDUsuario"), System.IO.Path.GetFileName(Request.ServerVariables("SCRIPT_NAME")))
            'btnx_expxls.Visible = CType(Objetos.ActivaButtonsPermiso(_Ds, "EXPXLSX"), Boolean)
        End If
    End Sub

    Public Sub EditaHorarios()
        DsLabels = Datos.DatosHorario(lbx_Anio.Value, lbx_Mes.Value, lbx_Dia.Value, lbx_Oficina.Value)


        If DsLabels.Tables.Count > 0 Then
            lbl_HorarioNormal.Text = DsLabels.Tables(0).Rows(0)(1)
            lbl_HorarioAdicional.Text = DsLabels.Tables(0).Rows(0)(2)
            lbl_HoraNorSab.Text = DsLabels.Tables(0).Rows(0)(3)
            lbl_HoraNorFest.Text = DsLabels.Tables(0).Rows(0)(4)
        End If
    End Sub

    Public Sub LlenaListOficinas()
        DsOficina = Datos.DatosOficinas(lbx_Anio.Value, lbx_Mes.Value, lbx_Dia.Value)
        lbx_Oficina.Items.Clear()

        If DsOficina.Tables.Count > 0 Then
            For Each fila As DataRow In DsOficina.Tables(0).Rows
                lbx_Oficina.Items.Add("Oficina" & fila(0), fila(0))
            Next
        End If
    End Sub


    Public Sub LlenaListAnios()
        DsAnio = Datos.DatosAnio()

        For Each fila As DataRow In DsAnio.Tables(0).Rows
            lbx_Anio.Items.Add(fila(0))
        Next
    End Sub

    Public Sub LlenaListMeses()
        'Dim Dt As DataTable = DatosMeses()

        DsMeses = Datos.DatosMes(lbx_Anio.Value)

        lbx_Mes.Items.Clear()

        If DsMeses.Tables.Count > 0 Then
            Dim AnioActual As Integer = DateTime.Now.Year
            Dim MesActual As Integer = DateTime.Now.Month

            For Each fila As DataRow In DsMeses.Tables(0).Rows
                Dim Value As String = Left(fila(0), 2)
                Dim Text As String = Right(fila(0), fila(0).ToString.Length - 2)
                lbx_Mes.Items.Add(Text, Value)
            Next

            If lbx_Mes.Items.Count <> 0 Then
                If AnioActual = Convert.ToInt32(lbx_Anio.Value) Then
                    lbx_Mes.Items(lbx_Mes.Items.Count - 1).Selected = True
                Else
                    lbx_Mes.Items(0).Selected = True
                End If
            End If
        End If
    End Sub

    Public Sub LlenaListDias()
        'Dim Dt As DataTable = DatosDias(lbx_Anio.Value, lbx_Mes.Value)

        DsDias = Datos.DatosDia(lbx_Anio.Value, lbx_Mes.Value)

        lbx_Dia.Items.Clear()
        If DsDias.Tables.Count > 0 Then
            For Each fila As DataRow In DsDias.Tables(0).Rows
                lbx_Dia.Items.Add(fila(0))
            Next

            If lbx_Dia.Items.Count <> 0 Then
                If lbx_Anio.Value = CStr(DateTime.Now.Year) And lbx_Mes.Value = Right("00" & CStr(DateTime.Now.Month), 2) Then
                    lbx_Dia.Items(lbx_Dia.Items.Count - 1).Selected = True
                Else
                    lbx_Dia.Items(0).Selected = True
                End If
            End If
        End If
    End Sub

    Public Sub LlenaGrafico()

        Try

            DsGrafico = Datos.DatosFH(lbx_Anio.Value, lbx_Mes.Value, lbx_Dia.Value, lbx_Oficina.Value)

            If DsGrafico.Tables.Count > 0 Then

                Dim Grafico As WebChartControl = CType(wb_Grafico, WebChartControl)

                Grafico.DataSource = DsGrafico

                Grafico.Series.Clear()

                Grafico.Series.Add(New Series(DsGrafico.Tables(0).Columns(0).ColumnName.ToString(), ViewType.Line))
                Grafico.Series(DsGrafico.Tables(0).Columns(0).ColumnName.ToString()).ArgumentDataMember = DsGrafico.Tables(0).Columns(0).ColumnName.ToString()
                Grafico.Series(DsGrafico.Tables(0).Columns(0).ColumnName.ToString()).ValueDataMembers.AddRange(New String() {DsGrafico.Tables(0).Columns(1).ColumnName.ToString()})
                Grafico.Series(DsGrafico.Tables(0).Columns(0).ColumnName.ToString()).LegendTextPattern = "{A}: {V}"
                Grafico.Series(DsGrafico.Tables(0).Columns(0).ColumnName.ToString()).Label.TextPattern = "{V:n0}"
                Grafico.Series(DsGrafico.Tables(0).Columns(0).ColumnName.ToString()).CrosshairLabelPattern = "{S} : {V:n0}"

                Dim diagram As XYDiagram = CType(Grafico.Diagram, XYDiagram)
                diagram.AxisY.Label.TextPattern = "{V:n0}"

                Grafico.DataBind()
                EditaHorarios()
            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub ASPxCallbackPanel1_Callback(sender As Object, e As CallbackEventArgsBase)
        LlenaGrafico()
    End Sub

    Protected Sub lbx_Mes_Callback(sender As Object, e As CallbackEventArgsBase)
        LlenaListMeses()
    End Sub

    Protected Sub lbx_Dia_Callback(sender As Object, e As CallbackEventArgsBase)
        LlenaListDias()
    End Sub

    Protected Sub ASPxCallbackPanel2_Callback(sender As Object, e As CallbackEventArgsBase)
        EditaHorarios()
    End Sub

    Protected Sub lbx_Oficina_Callback(sender As Object, e As CallbackEventArgsBase)
        LlenaListOficinas()

        If lbx_Oficina.Items.Count <> 0 Then
            lbx_Oficina.Items(0).Selected = True
        End If
    End Sub
End Class