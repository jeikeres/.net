Imports Negocio

Public Class EstablecerRespuestasMenu
    Inherits System.Web.UI.Page

    Dim _Seguridad As New cls_Usuario
    Dim _LogSeguridad As New cls_LogSeguridad
    Dim _Ds As New DataSet

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Carga_Preguntas()
            Me.txt_Password.Focus()
            Me.cbx_Pregunta1.Text = "-- Seleccione una pregunta --"
            Me.cbx_Pregunta2.Text = "-- Seleccione una pregunta --"

            _LogSeguridad.WriteLogUser(Session("IDUsuario"), Me.ToString(), "Establecer Preguntas y Respuestas de Seguridad (Menu)", _Seguridad.GetIP.ToString)
        End If

       End Sub

    Public Sub Carga_Preguntas()
        Try
            _Ds = _Seguridad.Carga_Preguntas_Seguridad()
            If _Ds.Tables.Count Then
                For i As Integer = 0 To _Ds.Tables(0).Rows.Count - 1
                    'CARGAMOS COMBOBOX PREGUNTA1
                    Me.cbx_Pregunta1.Items.Add(_Ds.Tables(0).Rows(i)("PREGUNTA"))
                    Me.cbx_Pregunta1.Items(i).Value = CInt(_Ds.Tables(0).Rows(i)("CODIGO"))
                    'CARGAMOS COMBOBOX PREGUNTA2
                    Me.cbx_Pregunta2.Items.Add(_Ds.Tables(0).Rows(i)("PREGUNTA"))
                    Me.cbx_Pregunta2.Items(i).Value = CInt(_Ds.Tables(0).Rows(i)("CODIGO"))
                Next
            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub btn_Aceptar_EstablecerRespuestasMenu_Click(sender As Object, e As EventArgs) Handles btn_Aceptar_EstablecerRespuestasMenu.Click
        _Seguridad.Actualiza_Preguntas_Seguridad(Session("IDUsuario"), Me.txt_Password.Text, Me.cbx_Pregunta1.Value, Me.txt_Respuesta1.Text)
        _Seguridad.Actualiza_Preguntas_Seguridad(Session("IDUsuario"), Me.txt_Password.Text, Me.cbx_Pregunta2.Value, Me.txt_Respuesta2.Text)
        'OCULTAMOS LOS CONTROLES
        Me.lbl_titulo_politicas.Visible = False
        Me.lbl_politica1.Visible = False
        Me.lbl_politica2.Visible = False
        Me.lbl_password.Visible = False
        Me.txt_Password.Visible = False
        Me.cbx_Pregunta1.Visible = False
        Me.cbx_Pregunta2.Visible = False
        Me.txt_Respuesta1.Visible = False
        Me.txt_Respuesta2.Visible = False
        Me.lbl_Pregunta1.Visible = False
        Me.lbl_Pregunta2.Visible = False
        Me.lbl_Respuesta1.Visible = False
        Me.lbl_Respuesta2.Visible = False
        Me.btn_Aceptar_EstablecerRespuestasMenu.Visible = False

        _LogSeguridad.WriteLogUser(Session("IDUsuario"), Me.ToString(), "btn_Aceptar_EstablecerRespuestasMenu", _Seguridad.GetIP.ToString)

        Me.lbl_mensaje.ForeColor = Drawing.Color.Blue
        Me.lbl_mensaje.Text = "Preguntas y Respuestas de Seguridad guardadas exitosamente."
    End Sub
End Class