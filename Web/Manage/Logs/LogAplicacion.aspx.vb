Imports Negocio

Public Class LogAplicacion
    Inherits System.Web.UI.Page
    Dim _Seguridad As New cls_Usuario
    Dim _LogSeguridad As New cls_LogSeguridad
    Dim _Ds As New DataSet

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Llena_Grid()

            _LogSeguridad.WriteLogUser(Session("IDUsuario"), Me.ToString(), "Consulta Log de Aplicación", _Seguridad.GetIP.ToString)
            _LogSeguridad.WriteLogApp(1, Me.ToString, "Page_Load", "Consulta Log de Aplicación")
        Else
            Me.gdvx_LogAplicacion.DataSource = Session("Dts_")
        End If
    End Sub

    Function Llena_Grid() As DataSet
        Try
            _Ds = _LogSeguridad.Reporte_Log_Aplicacion()
            If _Seguridad.Estado_Query Then
                If _Ds.Tables.Count Then
                    Me.gdvx_LogAplicacion.DataSource = _Ds
                    Me.gdvx_LogAplicacion.DataBind()
                    Session("Dts_") = _Ds
                End If
            End If
        Catch ex As Exception

        End Try
    End Function

    Protected Sub btn_Exportar_Click(sender As Object, e As EventArgs) Handles btn_Exportar.Click
        _LogSeguridad.WriteLogUser(Session("IDUsuario"), Me.ToString(), "Exporta Log de Aplicación", _Seguridad.GetIP.ToString)
        _LogSeguridad.WriteLogApp(1, Me.ToString, "Page_Load", "Exporta Log de Aplicación")

        ASPxGridViewExporter1.FileName = "Consulta_Log_Aplicacion"
        ASPxGridViewExporter1.PageHeader.Font.Name = "Arial"
        ASPxGridViewExporter1.WriteXlsToResponse()
    End Sub
End Class