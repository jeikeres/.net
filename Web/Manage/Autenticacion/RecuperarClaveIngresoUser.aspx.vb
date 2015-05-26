Imports Negocio

Public Class RecuperarClaveIngresoUser
    Inherits System.Web.UI.Page
    Dim _Seguridad As New cls_Usuario
    Dim _LogSeguridad As New cls_LogSeguridad
    Dim _DS As DataSet

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        _LogSeguridad.WriteLogApp(1, Me.ToString, "cbp_inciosesion_Callback", "Inicia Validación de Login")
        Me.txt_usuario.Focus()
    End Sub

    Protected Sub btn_Aceptar_IngresoUsuario_Click(sender As Object, e As EventArgs) Handles btn_Aceptar_IngresoUsuario.Click
        Try
            If _Seguridad.ValidaUsuario(txt_usuario.Text) Then
                Session("IDUsuario") = txt_usuario.Text
                Response.Redirect("RecuperarClaveIngresoRespuestas.aspx")

                '_LogSeguridad.WriteLogUser(Session("IDUsuario"), Me.ToString(), "btn_Aceptar_IngresoUsuario", _Seguridad.GetIP.ToString)
                _LogSeguridad.WriteLogUser(Session("IDUsuario"), Me.ToString(), "Ingresar Usuario para Recuperar Contraseña", _Seguridad.GetIP.ToString)
            Else
                Me.lbl_mensaje.ForeColor = Drawing.Color.Red
                Me.lbl_mensaje.Text = "Usuario no registrado."
            End If
        Catch ex As Exception

        End Try
    End Sub
End Class