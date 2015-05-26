Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Web
Imports DevExpress.Utils.Localization.Internal
Imports DevExpress.XtraPivotGrid.Localization
Imports DevExpress.Web.ASPxPivotGrid

Public Class CustomLocalizer
    Inherits ASPxPivotGridResLocalizer
    Public Shared Sub Activate()
        Dim localizer As New CustomLocalizer()
        Dim provider As New DefaultActiveLocalizerProvider(Of PivotGridStringId)(localizer)
        CustomLocalizer.SetActiveLocalizerProvider(provider)

    End Sub
    Public Overrides Function GetLocalizedString(ByVal id As PivotGridStringId) As String
        If id = PivotGridStringId.CustomizationFormCaption Then
            Return "Custom Filter Field List"
        End If
        If id = PivotGridStringId.GrandTotal Then
            Return "Total"
        End If
        Return MyBase.GetLocalizedString(id)
    End Function
End Class
