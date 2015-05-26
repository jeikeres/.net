Imports Negocio

Public Class ClaveNueva
    Inherits System.Web.UI.Page
    Dim _Seguridad As New cls_Usuario
    Dim _LogSeguridad As New cls_LogSeguridad

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Cookies.Remove("aCookie")
        Response.Cookies.Remove("aCookie_b")
        Response.Cookies.Remove("aCookie_Idioma")
        Me.txt_pass_nuevo.Focus()
        CargaInfoClaveRobusta()
        _LogSeguridad.WriteLogUser(Session("IDUsuario"), Me.ToString(), "Cambiar Contraseña", _Seguridad.GetIP.ToString)
    End Sub
    Protected Sub CargaInfoClaveRobusta()

        _Seguridad.ConfigClaveRobusta()

        lblx_politicas.Text = _Seguridad.CR_Titulo
        lblx_largominimo.Text = _Seguridad.CR_LargoMinimo
        lblx_numeros.Text = _Seguridad.CR_NNumeros
        lblx_especial.Text = _Seguridad.CR_NEspeciales
        lblx_mayus.Text = _Seguridad.CR_NMayus
        lblx_minus.Text = _Seguridad.CR_NMinus
        lblx_historial.Text = _Seguridad.CR_NHistorial

    End Sub
    Private Sub btn_Aceptar_ClaveNueva_Click(sender As Object, e As EventArgs) Handles btn_Aceptar_ClaveNueva.Click
        'Dim Usuario As String = ""
        Dim Mensaje As String = ""
        Dim Preguntas As Integer = 0
        'Dim URL As String
        'URL = Right(HttpContext.Current.Request.Url.AbsoluteUri, 104)
        'Usuario = URL
        Try
            If Len(Trim(Me.txt_pass_nuevo.Text)) <> 0 And Len(Trim(Me.txt_reingresar_pass.Text)) <> 0 Then
                If txt_pass_nuevo.Text <> txt_reingresar_pass.Text Then
                    Me.lbl_mensaje_pass.ForeColor = Drawing.Color.Red
                    Me.lbl_mensaje_pass.Text = "Las contraseñas no coinciden, por favor intente nuevamente."
                    Me.txt_pass_nuevo.Text = Nothing
                    Me.txt_reingresar_pass.Text = Nothing
                    Me.txt_pass_nuevo.Focus()
                Else
                    If _Seguridad.ClaveRobusta(txt_pass_nuevo.Text) = True Then
                        If _Seguridad.Clave_Nueva(Session("IDUsuario"), txt_pass_nuevo.Text, Mensaje, Preguntas) Then
                            If Mensaje = "COK" Then
                                'OCULTAR CONTROLES
                                Me.txt_pass_nuevo.Visible = False
                                Me.txt_reingresar_pass.Visible = False
                                Me.lbl_pass_nuevo.Visible = False
                                Me.lbl_reingresar_pass.Visible = False
                                Me.btn_Aceptar_ClaveNueva.Visible = False

                                Me.lbl_mensaje_pass.ForeColor = Drawing.Color.Blue
                                Me.lbl_mensaje_pass.Text = "Contraseña actualizada correctamente."

                                If Preguntas < 2 Then
                                    Me.lbl_mensaje_ingreso.Text = "A continuación debe establecer sus preguntas y respuestas de seguridad "
                                    Me.ASPxHyperLink1.Text = "aquí"
                                    Me.ASPxHyperLink1.NavigateUrl = "EstablecerRespuestas.aspx"
                                Else
                                    Me.lbl_mensaje_ingreso.Text = "Ingrese al sistema "
                                    Me.ASPxHyperLink1.Text = "aquí"
                                    Me.ASPxHyperLink1.NavigateUrl = "../../index.aspx"
                                End If
                                _LogSeguridad.WriteLogUser(Session("IDUsuario"), Me.ToString(), "btn_Aceptar_ClaveNueva", _Seguridad.GetIP.ToString)
                                'Session.RemoveAll()
                            End If
                            If Mensaje = "CNOK" Then
                                Me.lbl_mensaje_pass.ForeColor = Drawing.Color.Red
                                Me.lbl_mensaje_pass.Text = "La contraseña no puede estar dentro de las últimas 5 usadas, por favor intente de nuevo."
                            End If
                        End If
                    Else
                        Me.lbl_mensaje_pass.ForeColor = Drawing.Color.Red
                        Me.lbl_mensaje_pass.Text = "La contraseña no cumple con las políticas de seguridad, por favor intente nuevamente."
                        Me.txt_pass_nuevo.Text = Nothing
                        Me.txt_reingresar_pass.Text = Nothing
                        Me.txt_pass_nuevo.Focus()
                    End If
                End If
            End If
        Catch ex As Exception

        End Try
    End Sub
End Class