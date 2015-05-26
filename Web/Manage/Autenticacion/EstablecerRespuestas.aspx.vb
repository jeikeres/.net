Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Web.UI
Imports DevExpress.Web
Imports Negocio

Public Class EstablecerRespuestas
    Inherits System.Web.UI.Page
    Dim _Seguridad As New cls_Usuario
    Dim _LogSeguridad As New cls_LogSeguridad
    Dim _Ds As New DataSet

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Carga_Preguntas()
            Me.cbx_Pregunta1.Focus()
            Me.cbx_Pregunta1.Text = "-- Seleccione una pregunta --"
            Me.cbx_Pregunta2.Text = "-- Seleccione una pregunta --"

            _LogSeguridad.WriteLogUser(Session("IDUsuario"), Me.ToString(), "Establece Preguntas y Respuestas de Seguridad", _Seguridad.GetIP.ToString)
        End If
        

    End Sub

    Public Sub Carga_Preguntas()
        Try
            _Ds = _Seguridad.Carga_Preguntas_Seguridad()
            If _Ds.Tables.Count Then
                For i As Integer = 0 To _Ds.Tables(0).Rows.Count - 1
                    'CARGAMOS COMBOBOX PREGUNTA1
                    Me.cbx_Pregunta1.Items.Add(_Ds.Tables(0).Rows(i)("GLOSA_PREGUNTA"))
                    Me.cbx_Pregunta1.Items(i).Value = CInt(_Ds.Tables(0).Rows(i)("ID_PREGUNTA"))
                    'CARGAMOS COMBOBOX PREGUNTA2
                    Me.cbx_Pregunta2.Items.Add(_Ds.Tables(0).Rows(i)("GLOSA_PREGUNTA"))
                    Me.cbx_Pregunta2.Items(i).Value = CInt(_Ds.Tables(0).Rows(i)("ID_PREGUNTA"))
                Next
            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub btn_Aceptar_EstablecerRespuestas_Click(sender As Object, e As EventArgs) Handles btn_Aceptar_EstablecerRespuestas.Click
        _Seguridad.Guarda_Respuestas_Seguridad(Me.cbx_Pregunta1.Value, Session("IDUsuario"), Me.txt_Respuesta1.Text)
        _Seguridad.Guarda_Respuestas_Seguridad(Me.cbx_Pregunta2.Value, Session("IDUsuario"), Me.txt_Respuesta2.Text)
        'OCULTAMOS LOS CONTROLES
        Me.lbl_titulo_politicas.Visible = False
        Me.lbl_politica1.Visible = False
        Me.lbl_politica2.Visible = False
        Me.cbx_Pregunta1.Visible = False
        Me.cbx_Pregunta2.Visible = False
        Me.txt_Respuesta1.Visible = False
        Me.txt_Respuesta2.Visible = False
        Me.lbl_Pregunta1.Visible = False
        Me.lbl_Pregunta2.Visible = False
        Me.lbl_Respuesta1.Visible = False
        Me.lbl_Respuesta2.Visible = False
        Me.btn_Aceptar_EstablecerRespuestas.Visible = False

        _LogSeguridad.WriteLogUser(Session("IDUsuario"), Me.ToString(), "btn_Aceptar_EstablecerRespuestas", _Seguridad.GetIP.ToString)

        Me.lbl_mensaje.ForeColor = Drawing.Color.Blue
        Me.lbl_mensaje.Text = "Preguntas y Respuestas de Seguridad guardadas exitosamente."
        Me.lbl_mensaje_respuestas.Text = "Puede ingresar al sistema "
        Me.hypx_respuestas.Text = "aquí"

        Session.RemoveAll()
    End Sub

    Protected Sub cbx_Pregunta1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cbx_Pregunta1.SelectedIndexChanged
        Try
            Dim SelItem As Integer = cbx_Pregunta1.SelectedIndex
            cbx_Pregunta1.ClientEnabled = False
            cbx_Pregunta2.Items.RemoveAt(SelItem)
        Catch ex As Exception

        End Try
    End Sub
End Class