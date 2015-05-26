Imports Negocio

Public Class ReporteUsuariosGeneral
    Inherits System.Web.UI.Page
    Dim _Seguridad As New cls_Usuario
    Dim _LogSeguridad As New cls_LogSeguridad
    Dim _Ds As New DataSet

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LlenarGV()

            _LogSeguridad.WriteLogUser(Session("IDUsuario"), Me.ToString(), "Reporte General de Usuarios", _Seguridad.GetIP.ToString)
            _LogSeguridad.WriteLogApp(1, Me.ToString, "Page_Load", "Reporte General de Usuarios")
        Else
            Me.gdvx_ReporteUsuariosGeneral.DataSource = Session("Dts_")
        End If
    End Sub

    Function LlenarGV()
        Try
            _Ds = _Seguridad.Reporte_Usuarios_General()
            If _Seguridad.Estado_Query Then
                If _Ds.Tables.Count Then
                    Me.gdvx_ReporteUsuariosGeneral.DataSource = _Ds.Tables(2)
                    Me.gdvx_ReporteUsuariosGeneral.DataBind()
                    Session("Dts_") = _Ds.Tables(2)
                End If
            End If
        Catch ex As Exception

        End Try
    End Function

    Protected Sub ASPxButton1_Click(sender As Object, e As EventArgs) Handles ASPxButton1.Click
        _LogSeguridad.WriteLogUser(Session("IDUsuario"), Me.ToString(), "Exporta Reporte General de Usuarios", _Seguridad.GetIP.ToString)
        _LogSeguridad.WriteLogApp(1, Me.ToString, "Page_Load", "Exporta Reporte General de Usuarios")

        ASPxGridViewExporter1.FileName = "Reporte_Usuarios"
        ASPxGridViewExporter1.PageHeader.Font.Name = "Arial"
        ASPxGridViewExporter1.WriteXlsToResponse()
    End Sub
End Class