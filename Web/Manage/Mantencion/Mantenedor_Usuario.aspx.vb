Imports Negocio
Imports DevExpress.Web

Public Class Mantenedor_Usuario
    Inherits System.Web.UI.Page

    Dim _User As New cls_Mantenedor_Usuario
    Dim _varretorno As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim _Ds As New DataSet
        If Not IsPostBack Then
            _Ds = _User.CargaUsuarioSegunEvento(1)
            Me.gvUsuario.DataSource = _Ds
            Me.gvUsuario.DataBind()
        Else
            RecargaGrid()
        End If

    End Sub

    Protected Sub confirmButton_Click(ByVal sender As Object, ByVal e As EventArgs)
        Session("Password") = cnpsw.Text
        Session("IDPassword") = gvUsuario.EditingRowVisibleIndex

        ASPxPopupControl1.ShowOnPageLoad = False
    End Sub

    Protected Sub gvUsuario_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs) Handles gvUsuario.RowInserting

        Try
            _User = New cls_Mantenedor_Usuario

            _User.COD_USUARIO = e.NewValues.Item(0)
            _User.NOMBRES = e.NewValues.Item(1)
            _User.APELLIDOS = e.NewValues.Item(2)
            _User.IDENTIFICACION = e.NewValues.Item(3)
            _User.TIPO_IDENTIFICACION = e.NewValues.Item(4)
            _User.COD_CARGO = e.NewValues.Item(5)
            _User.COD_DEPENDENCIA = e.NewValues.Item(6)
            _User.MAIL = e.NewValues.Item(7)
            _User.VIGENCIA = e.NewValues.Item(8)
            _User.BLOQUEO = e.NewValues.Item(9)
            _User.PASSWORD = e.NewValues.Item(10).ToString

            If _User.InsertarUsuario() Then

                RecargaGrid()
                'Cancela la actualización automática de la GridView
                e.Cancel = True
                'Regresa a la GridView a modo navegación
                CType(sender, ASPxGridView).CancelEdit()

            End If
        Catch ex As Exception

        End Try
        
    End Sub



    Protected Sub gvUsuario_RowUpdating(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs) Handles gvUsuario.RowUpdating

        _User = New cls_Mantenedor_Usuario
        If Session("IDPassword") = gvUsuario.EditingRowVisibleIndex And Session("Password") <> "" Then
            _User.PASSWORD = Session("Password")
        End If

        _User.COD_USUARIO = e.NewValues.Item(0)
        _User.NOMBRES = e.NewValues.Item(1)
        _User.APELLIDOS = e.NewValues.Item(2)
        _User.IDENTIFICACION = e.NewValues.Item(3)
        _User.TIPO_IDENTIFICACION = e.NewValues.Item(4)
        _User.COD_CARGO = e.NewValues.Item(5)
        _User.COD_DEPENDENCIA = e.NewValues.Item(6)
        _User.MAIL = e.NewValues.Item(7)
        _User.VIGENCIA = e.NewValues.Item(8)
        _User.BLOQUEO = e.NewValues.Item(9)

        If _User.ActualizarUsuario() Then
            RecargaGrid()
            'Cancela la actualización automática de la GridView
            e.Cancel = True
            'Regresa a la GridView a modo navegación
            CType(sender, ASPxGridView).CancelEdit()

        End If

    End Sub

    Protected Sub RecargaGrid()
        Dim _Ds As DataSet = _User.CargaUsuarioSegunEvento(1)
        Me.gvUsuario.DataSource = _Ds
        Me.gvUsuario.DataBind()
    End Sub

    Protected Sub gvUsuario_RowDeleting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataDeletingEventArgs) Handles gvUsuario.RowDeleting

        Dim grid As ASPxGridView = TryCast(sender, ASPxGridView)
        Dim Ip As String = System.Net.Dns.GetHostAddresses(System.Net.Dns.GetHostName()).GetValue(0).ToString()


        Dim ID As String = gvUsuario.GetRowValues(gvUsuario.FindVisibleIndexByKeyValue(e.Keys(gvUsuario.KeyFieldName)), "COD_USUARIO")

        _User = New cls_Mantenedor_Usuario
        _User.COD_USUARIO = ID

        'Session("IDUsuario")

        If _User.EliminarUsuario(ID, Session("IDUsuario"), Ip) Then
            RecargaGrid()
        End If


        e.Cancel = True
    End Sub

End Class
