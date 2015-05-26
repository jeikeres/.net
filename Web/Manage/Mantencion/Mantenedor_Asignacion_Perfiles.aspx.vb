Imports Negocio

Public Class Mantenedor_Asignacion_Perfiles
    Inherits System.Web.UI.Page

    Dim _Perfil As New cls_Perfil
    Dim _Ds As New DataSet

   
    Protected Sub cbbx_usuario_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cbbx_usuario.SelectedIndexChanged
        lbAvailable.DataBind()
        lbChoosen.Items.Clear()
        _Ds = _Perfil.ConsultaPerfilUsuario(cbbx_usuario.SelectedItem.Value)
        Try
            For i = 0 To _Ds.Tables(0).Rows.Count() - 1
                For x = 0 To lbAvailable.Items.Count() - 1
                    If _Ds.Tables(0).Rows(i)(0).ToString = lbAvailable.Items(x).Value Then
                        lbChoosen.Items.Add(_Ds.Tables(0).Rows(i)(1).ToString, _Ds.Tables(0).Rows(i)(0).ToString)
                        lbAvailable.Items.Remove(lbAvailable.Items(x))
                        Exit For
                    End If
                Next
            Next
        Catch ex As Exception

        End Try
        
    End Sub

    Protected Sub btnx_guardar_Click(sender As Object, e As EventArgs) Handles btnx_guardar.Click
        Dim Accion As String = "Eliminar"

        For x = 0 To lbChoosen.Items.Count() - 1
            _Ds = _Perfil.GuardarPerfilUsuario(cbbx_usuario.SelectedItem.Value, lbChoosen.Items(x).Value, Accion)
            Accion = ""
        Next


    End Sub
End Class