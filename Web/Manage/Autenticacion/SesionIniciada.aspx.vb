Imports Negocio
Imports System.Data
Imports System.Net

Public Class SesionIniciada
    Inherits System.Web.UI.Page
    Dim _Seguridad As New cls_Usuario
    Dim _LogSeguridad As New cls_LogSeguridad

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim myCookie As HttpCookie
            myCookie = New HttpCookie("IDUser_R3Ta1l")
            myCookie.Expires = DateTime.Now.AddDays(-1D)
            Response.Cookies.Add(myCookie)
        End If
    End Sub

    Protected Sub btn_CancelarSesionIniciada_Click(sender As Object, e As EventArgs) Handles btn_CancelarSesionIniciada.Click
        Response.Redirect("~/index.aspx")
    End Sub

    Protected Sub btn_AceptarSesionIniciada_Click(sender As Object, e As EventArgs) Handles btn_AceptarSesionIniciada.Click
        Dim Mensaje As String = ""

        _LogSeguridad.WriteLogUser(Session("IDUsuario"), Me.ToString(), "Cerrar sesion", _Seguridad.GetIP.ToString)
        _LogSeguridad.WriteLogApp(1, Me.ToString, "btn_AceptarSesionIniciada_Click", "Carga cierre de sesión por duplicidad")

        If (Not Request.Cookies("IDUser_R3Ta1l") Is Nothing) Then
            Dim myCookie As HttpCookie
            myCookie = New HttpCookie("IDUser_R3Ta1l")
            myCookie.Expires = DateTime.Now.AddDays(-1D)
            Response.Cookies.Add(myCookie)
        End If

        If _Seguridad.Cerrar_Sesion(Session("IDUsuario"), Session("USR_ID_SESION"), Mensaje) = "SESION_CERRADA" Then

            Dim aCookie As New HttpCookie("IDUser_R3Ta1l")
            aCookie.Value = Session("IDUsuario")
            aCookie.Expires = DateTime.Now.AddDays(1)
            Response.Cookies.Add(aCookie)

            Dim aCookie_b As New HttpCookie("DatosUser_R3Ta1l")
            aCookie_b.Value = Session("USR_NOMBRE") & " " & Session("USR_APELLIDO")
            aCookie_b.Expires = DateTime.Now.AddDays(1)
            Response.Cookies.Add(aCookie_b)

            Dim aCookie_Idioma As New HttpCookie("Idioma_R3Ta1l")
            aCookie_Idioma.Value = Session("LANGUAGE")
            aCookie_Idioma.Expires = DateTime.Now.AddDays(1)
            Response.Cookies.Add(aCookie_Idioma)

            _LogSeguridad.WriteLogUser(Session("IDUsuario"), Me.ToString(), "Abrir nueva sesion", _Seguridad.GetIP.ToString)
            _LogSeguridad.WriteLogApp(1, Me.ToString, "btn_AceptarSesionIniciada_Click", "Carga página principal nueva sesión")
            Response.Redirect("~/Principal.aspx?Lng=" & Session("Language"))
        End If
    End Sub
End Class