Imports Negocio
Imports System.Data
Imports DevExpress.Web
Imports System.IO
'Imports DevExpress.XtraGauges.Win
Imports DevExpress.Web.ASPxGauges.Gauges.State
Imports DevExpress.Web.ASPxGauges
Imports DevExpress.XtraGauges.Base
Imports DevExpress.XtraGauges.Core.Model
Imports DevExpress.Web.ASPxGauges.Gauges.Circular
Imports DevExpress.XtraGauges.Core.Drawing
Imports System.Drawing

Public Class MasterMenu
    Inherits System.Web.UI.MasterPage

    Dim Objetos As New Objetos
    Dim _Menu As New cls_Menu
    Dim _Ds As DataSet
    Dim _Ds_b As DataSet
    Dim _st As New System.Diagnostics.StackTrace()
    Dim _Ob_Name As String
    Dim _Flag As Boolean = False
    Dim _Paginas As New cls_CargaPagina
    Dim _Seguridad As New cls_Usuario
    Dim _LogSeguridad As New cls_LogSeguridad

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            CargaBasePagina(0)
        End If
    End Sub

    Private Sub CargaBasePagina(ByVal IDIdioma As Integer)
        lblx_titulo_sistema.Text = "Inteligencia Transaccional"
        lblx_bienvenido.Text = "Bienvenido(a): "
        lblx_nombre_usuario.Text = Session("NombreUsuario")
        lnk_cerrar.Text = "Cerrar Sesión"
        trvx_arbol = Objetos.CargaMenu(Me.trvx_arbol, _Paginas.CargarMenu(Me.ToString, IDIdioma, Session("IDUsuario")))
    End Sub

    Protected Sub cbp_menu_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.CallbackEventArgsBase) Handles cbp_menu.Callback
        Session("Languague_ID") = 0
        DevExpress.Web.ASPxWebControl.RedirectOnCallback("Principal.aspx")
    End Sub

    Protected Sub lnk_cerrar_Click(sender As Object, e As EventArgs) Handles lnk_cerrar.Click
        Session.RemoveAll()
        FormsAuthentication.SignOut()
        FormsAuthentication.RedirectToLoginPage()
        'Response.Write("<script>window.open('index.aspx','_top');<" & Chr(47) & "script>")
    End Sub

    Protected Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        Dim Mensaje As String = ""
        '_LogSeguridad.WriteLogApp(1, Me.ToString, "Timer1_Tick", "Revisa sesiones y duplicidad de usuarios")

        If _Seguridad.Timeout(Session("IDUsuario"), Session("IDSesion"), Mensaje) Then
            If Mensaje = "SESIONNOKINAC" Then

                _LogSeguridad.WriteLogUser(Session("IDUsuario"), Me.ToString(), "Cerrar sesion por inactividad de usuario", _Seguridad.GetIP.ToString)
                _LogSeguridad.WriteLogApp(1, Me.ToString, "Timer1_Tick", "Cierra sesion por inactividad de usuario")

                Response.Redirect("~/Close.aspx")
                Response.Redirect("~/index.aspx")

            ElseIf Mensaje = "SESIONNOKDUP" Then

                _LogSeguridad.WriteLogUser(Session("IDUsuario"), Me.ToString(), "Cerrar sesion por Duplicidad de usuario", _Seguridad.GetIP.ToString)
                _LogSeguridad.WriteLogApp(1, Me.ToString, "Timer1_Tick", "Cierra sesion por Duplicidad de usuario")

                Response.Redirect("~/index.aspx")
            End If
        End If
    End Sub

End Class