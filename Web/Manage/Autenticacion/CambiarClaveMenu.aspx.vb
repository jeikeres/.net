Imports Negocio

Public Class CambiarClaveMenu
    Inherits System.Web.UI.Page
    Dim _Seguridad As New cls_Usuario
    Dim _LogSeguridad As New cls_LogSeguridad

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            CargaInfoClaveRobusta()
            _LogSeguridad.WriteLogUser(Session("IDUsuario"), Me.ToString(), "Cambiar Contraseña (Menu)", _Seguridad.GetIP.ToString)
            Me.txt_pass_actual.Focus()
        End If
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
    Protected Sub btn_Aceptar_CambiarClaveMenu_Click(sender As Object, e As EventArgs) Handles btn_Aceptar_CambiarClaveMenu.Click
        Dim Mensaje As String = ""
        Try
            If Len(Trim(Me.txt_pass_nuevo.Text)) <> 0 And Len(Trim(Me.txt_reingresa_pass.Text)) <> 0 Then
                If txt_pass_nuevo.Text <> txt_reingresa_pass.Text Then
                    Me.lbl_mensaje.ForeColor = Drawing.Color.Red
                    Me.lbl_mensaje.Text = "Las contraseñas no coinciden, por favor intente nuevamente."
                    Me.txt_pass_nuevo.Text = Nothing
                    Me.txt_reingresa_pass.Text = Nothing
                    Me.txt_pass_nuevo.Focus()
                Else
                    If _Seguridad.ClaveRobusta(Me.txt_pass_nuevo.Text) Then
                        If _Seguridad.Actualiza_Clave(Session("IDUsuario"), txt_pass_actual.Text, txt_pass_nuevo.Text, Mensaje) Then
                            If Mensaje = "COK" Then
                                'OCULTAR CONTROLES
                                lblx_politicas.Visible = False
                                lblx_largominimo.Visible = False
                                lblx_numeros.Visible = False
                                lblx_especial.Visible = False
                                lblx_mayus.Visible = False
                                lblx_minus.Visible = False
                                lblx_historial.Visible = False

                                Me.lbl_pass_actual.Visible = False
                                Me.lbl_pass_nuevo.Visible = False
                                Me.lbl_reingresa_pass.Visible = False
                                Me.txt_pass_actual.Visible = False
                                Me.txt_pass_nuevo.Visible = False
                                Me.txt_reingresa_pass.Visible = False
                                Me.btn_Aceptar_CambiarClaveMenu.Visible = False

                                Me.lbl_mensaje.ForeColor = Drawing.Color.Blue
                                Me.lbl_mensaje.Text = "Contraseña actualizada correctamente."
                                'Me.lbl_mensaje_redirect.Text = "Ingrese con su nueva contraseña "
                                'Me.hypx_redirect.Text = "aquí"

                                _LogSeguridad.WriteLogUser(Session("IDUsuario"), Me.ToString(), "btn_Aceptar_CambiarClaveMenu", _Seguridad.GetIP.ToString)
                                Session.RemoveAll()
                            End If
                        Else
                            Me.lbl_mensaje.ForeColor = Drawing.Color.Red
                            Me.lbl_mensaje.Text = "La nueva contraseña no puede estar dentro de las últimas 5 usadas, por favor intente de nuevo."
                        End If
                    Else
                        Me.lbl_mensaje.ForeColor = Drawing.Color.Red
                        Me.lbl_mensaje.Text = "La nueva contraseña no cumple con las políticas de seguridad, por favor intente nuevamente."
                        Me.txt_pass_nuevo.Text = Nothing
                        Me.txt_reingresa_pass.Text = Nothing
                        Me.txt_pass_nuevo.Focus()
                    End If
                End If
            End If
        Catch ex As Exception

        End Try
    End Sub
End Class