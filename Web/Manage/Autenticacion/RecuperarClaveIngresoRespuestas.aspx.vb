Imports Negocio
Imports DevExpress.Web

Public Class RecuperarClaveIngresoRespuestas
    Inherits System.Web.UI.Page
    Dim _Seguridad As New cls_Usuario
    Dim _LogSeguridad As New cls_LogSeguridad
    Dim _Ds As DataSet

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LlenadoGV()
        End If
        _LogSeguridad.WriteLogUser(Session("IDUsuario"), Me.ToString(), "Recuperar Contraseña", _Seguridad.GetIP.ToString)
    End Sub

    Public Function LlenadoGV() As Boolean
        Try
            _Ds = _Seguridad.RecuperaPreguntas(Session("IDUsuario"))
            If _Seguridad.Estado_Query Then
                If _Ds.Tables.Count Then
                    gdvx_respuestas.DataSource = _Ds.Tables(1)
                    gdvx_respuestas.DataBind()
                End If
            End If
        Catch ex As Exception

        End Try
    End Function

    Protected Sub btn_Aceptar_RecuperarClaveIngresoRespuestas_Click(sender As Object, e As EventArgs) Handles btn_Aceptar_RecuperarClaveIngresoRespuestas.Click
        Dim Preguntas, Respuestas As New ArrayList
        Dim Start As Integer = Me.gdvx_respuestas.PageIndex * Me.gdvx_respuestas.SettingsPager.PageSize
        Dim [End] As Integer = (Me.gdvx_respuestas.PageIndex + 1) * Me.gdvx_respuestas.SettingsPager.PageSize
        Dim Columna1 As GridViewDataColumn = TryCast(gdvx_respuestas.Columns("ID"), GridViewDataColumn)
        Dim Columna2 As GridViewDataColumn = TryCast(gdvx_respuestas.Columns("RESPUESTA"), GridViewDataColumn)
        For I As Integer = Start To [End] - 1
            Dim lblPregunta_ID As String = ""

            lblPregunta_ID = Me.gdvx_respuestas.GetRowValues(I, gdvx_respuestas.KeyFieldName).ToString

            Dim txtRespuesta As String = CType(gdvx_respuestas.FindRowCellTemplateControl(I, Columna2, "txtRespuesta"), ASPxTextBox).Text
            If txtRespuesta = Nothing Then
                Continue For
            End If
            Preguntas.Add(lblPregunta_ID)
            Respuestas.Add(txtRespuesta)
        Next
        If _Seguridad.ValidaRespuesta(Preguntas, Respuestas, Session("IDUsuario")) Then

            _LogSeguridad.WriteLogUser(Session("IDUsuario"), Me.ToString(), "btn_Aceptar_RecuperarClaveIngresoRespuestas", _Seguridad.GetIP.ToString)

            Response.Redirect("ClaveNueva.aspx")
        Else
            Me.lbl_mensaje.ForeColor = Drawing.Color.Red
            Me.lbl_mensaje.Text = "Las respuestas son incorrectas, por favor intente nuevamente."
        End If
    End Sub
End Class