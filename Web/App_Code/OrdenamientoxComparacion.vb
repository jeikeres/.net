Imports DevExpress.Web.ASPxPivotGrid
Imports DevExpress.XtraPivotGrid.Data

Namespace OrdenamientoxComparacion

    Public Class MesesItemsComparer
        Implements IComparer
        Private Function IComparer_Compare(ByVal x As Object, ByVal y As Object) As Integer Implements IComparer.Compare
            If Not (TypeOf x Is PivotGridFilterItem) OrElse Not (TypeOf y Is PivotGridFilterItem) Then
                Return 0
            End If
            Dim item1 As PivotGridFilterItem = CType(x, PivotGridFilterItem)
            Dim item2 As PivotGridFilterItem = CType(y, PivotGridFilterItem)

            Dim itemPos1 As Integer = 0
            Dim itemPos2 As Integer = 0

            Dim Meses As String() = {"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"}
            itemPos1 = (Array.IndexOf(Meses, item1.ToString))
            itemPos2 = (Array.IndexOf(Meses, item2.ToString))

            If itemPos1 = itemPos2 Then
                Return 0
            End If
            If itemPos1 > itemPos2 Then
                Return 1
            End If
            Return -1
        End Function
    End Class
    Public Class DiasItemsComparer
        Implements IComparer
        Private Function IComparer_Compare(ByVal x As Object, ByVal y As Object) As Integer Implements IComparer.Compare
            If Not (TypeOf x Is PivotGridFilterItem) OrElse Not (TypeOf y Is PivotGridFilterItem) Then
                Return 0
            End If
            Dim item1 As PivotGridFilterItem = CType(x, PivotGridFilterItem)
            Dim item2 As PivotGridFilterItem = CType(y, PivotGridFilterItem)

            Dim itemPos1 As Integer = 0
            Dim itemPos2 As Integer = 0

            Dim Dias As String() = {"Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado", "Domingo"}
            itemPos1 = (Array.IndexOf(Dias, item1.ToString))
            itemPos2 = (Array.IndexOf(Dias, item2.ToString))

            If itemPos1 = itemPos2 Then
                Return 0
            End If
            If itemPos1 > itemPos2 Then
                Return 1
            End If
            Return -1
        End Function
    End Class
End Namespace

