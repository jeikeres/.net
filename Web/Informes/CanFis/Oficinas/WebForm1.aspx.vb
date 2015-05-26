Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web.ASPxPivotGrid

Public Class WebForm1
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

    End Sub



    Protected Sub ASPxPivotGrid1_CustomFieldValueCells(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxPivotGrid.PivotCustomFieldValueCellsEventArgs)

    End Sub

    Protected Sub ASPxPivotGrid2_FieldValueDisplayText(sender As Object, e As PivotFieldDisplayTextEventArgs) Handles ASPxPivotGrid2.FieldValueDisplayText
        Try
            If e.Field.FieldName = "MES fin de semana" Then
                e.DisplayText = Right(e.DisplayText, e.DisplayText.Count - 2)
            End If

            Dim Mes As PivotGridField = ASPxPivotGrid2.Fields.Item("MES fin de semana")
            Mes.Options.AllowDrag = DevExpress.Utils.DefaultBoolean.False
            Mes.Options.AllowExpand = DevExpress.Utils.DefaultBoolean.False
            Mes.Options.AllowSort = DevExpress.Utils.DefaultBoolean.False
            Mes.Caption = "MES FIN DE SEMANA"

            Dim Glosa As PivotGridField = ASPxPivotGrid2.Fields.Item("GLOSA_GRUPO")
            Glosa.Options.AllowDrag = DevExpress.Utils.DefaultBoolean.False
            Glosa.Options.AllowExpand = DevExpress.Utils.DefaultBoolean.False
            Glosa.Options.AllowSort = DevExpress.Utils.DefaultBoolean.False
            Glosa.AreaIndex = 0


            Dim Horario As PivotGridField = ASPxPivotGrid2.Fields.Item("HORARIO")
            Horario.Options.AllowDrag = DevExpress.Utils.DefaultBoolean.False
            Horario.Options.AllowExpand = DevExpress.Utils.DefaultBoolean.False
            Horario.Options.AllowSort = DevExpress.Utils.DefaultBoolean.False
            Horario.AreaIndex = 1

            Dim QTrans As PivotGridField = ASPxPivotGrid2.Fields.Item("QTRANS")
            QTrans.Options.AllowDrag = DevExpress.Utils.DefaultBoolean.False
            QTrans.Options.AllowExpand = DevExpress.Utils.DefaultBoolean.False
            QTrans.Options.AllowSort = DevExpress.Utils.DefaultBoolean.False
            QTrans.CellFormat.FormatType = DevExpress.Utils.FormatType.Numeric
            QTrans.CellFormat.FormatString = "N0"


        Catch ex As Exception
            Return
        End Try
    End Sub

    Protected Sub ASPxPivotGrid1_FieldValueDisplayText(sender As Object, e As PivotFieldDisplayTextEventArgs) Handles ASPxPivotGrid1.FieldValueDisplayText
        Try
            If e.Field.FieldName = "MES" Then
                e.DisplayText = Right(e.DisplayText, e.DisplayText.Count - 2)
            End If
        Catch ex As Exception
            Return
        End Try
    End Sub

End Class