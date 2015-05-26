Imports Negocio
Imports System.Data
Imports System.Web.Security

Public Class index
    Inherits System.Web.UI.Page
    Dim _Paginas As New cls_CargaPagina
    Dim _Usuario As New cls_Usuario
    Dim _Ds As DataSet
    Dim Objetos As New Objetos

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

        End If
    End Sub

    Protected Sub cbpx_login_Callback(ByVal sender As Object, ByVal e As DevExpress.Web.CallbackEventArgsBase) Handles cbpx_login.Callback
        Dim Mensaje As String = ""
        Try
            If Len(Trim(Me.txt_in_user_sesion.Text)) <> 0 And Len(Trim(Me.txt_in_pass_sesion.Text)) <> 0 Then
                If _Usuario.Valida_Usuario(Me.txt_in_user_sesion.Text, Me.txt_in_pass_sesion.Text, 0, Mensaje) Then
                    Session("IDUsuario") = _Usuario.Usuario
                    Session("NombreUsuario") = _Usuario.Nombre & " " & _Usuario.Apellido
                    If Session("IDUsuario") = Nothing Then Session("IDUsuario") = txt_in_user_sesion.Text
                    Session("IDSesion") = _Usuario.IDSesion
                    FormsAuthentication.RedirectFromLoginPage(txt_in_user_sesion.Text, False)
                    DevExpress.Web.ASPxWebControl.RedirectOnCallback(_Usuario.URLRedirect)
                Else
                    Me.lbl_inf_problems_inicio.Text = _Usuario.MsgeStatusUsr
                    Me.txt_in_user_sesion.Text = Nothing
                    Me.txt_in_pass_sesion.Text = Nothing
                End If
            End If
        Catch ex As Exception
            '_Acceso.WriteLog(Me.txt_in_user_sesion.Text, Nothing, cls_variables.Id_Tipo_Log.Error_Cp_Web, Me.Form.Name)
        End Try
    End Sub


    Protected Sub btnx_login0_Click(sender As Object, e As EventArgs) Handles btnx_login0.Click
        Dim Mensaje As String = ""
        Try
            If Len(Trim(Me.txt_in_user_sesion.Text)) <> 0 And Len(Trim(Me.txt_in_pass_sesion.Text)) <> 0 Then
                If _Usuario.Valida_Usuario(Me.txt_in_user_sesion.Text, Me.txt_in_pass_sesion.Text, 0, Mensaje) Then
                    Session("IDUsuario") = _Usuario.Usuario
                    Session("NombreUsuario") = _Usuario.Nombre & " " & _Usuario.Apellido
                    If Session("IDUsuario") = Nothing Then Session("IDUsuario") = txt_in_user_sesion.Text
                    Session("IDSesion") = _Usuario.IDSesion
                    FormsAuthentication.RedirectFromLoginPage(txt_in_user_sesion.Text, False)
                    'DevExpress.Web.ASPxWebControl.RedirectOnCallback(_Usuario.URLRedirect)
                    Response.Redirect(_Usuario.URLRedirect)
                Else
                    Me.lbl_inf_problems_inicio.Text = _Usuario.MsgeStatusUsr
                    Me.txt_in_user_sesion.Text = Nothing
                    Me.txt_in_pass_sesion.Text = Nothing
                End If
            End If
        Catch ex As Exception
            '_Acceso.WriteLog(Me.txt_in_user_sesion.Text, Nothing, cls_variables.Id_Tipo_Log.Error_Cp_Web, Me.Form.Name)
        End Try
    End Sub
End Class