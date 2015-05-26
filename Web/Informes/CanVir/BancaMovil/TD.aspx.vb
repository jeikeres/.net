Imports System.Data.SqlClient
Imports DevExpress.Web.ASPxTreeList
Imports DevExpress.Web
Imports Negocio
Imports DevExpress.XtraPivotGrid.Data
Imports Web.OrdenamientoxComparacion
Imports DevExpress.Web.ASPxPivotGrid
Imports System.Globalization
Imports DevExpress.XtraPrinting
Imports System.Drawing
Imports DevExpress.XtraPrintingLinks
Imports System.IO


Public Class TD_BM
    Inherits System.Web.UI.Page

    Dim TD As New cls_tabladinamica
    Dim _Ds As DataSet
    Dim Objetos As New Objetos
    Dim Pagina As New cls_CargaPagina
    Const Canal As Integer = 12

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            _Ds = Pagina.CargaPermisosPagina(Session("IDUsuario"), System.IO.Path.GetFileName(Request.ServerVariables("SCRIPT_NAME")))
            btnx_expxls.Visible = CType(Objetos.ActivaButtonsPermiso(_Ds, "EXPXLSX"), Boolean)
            Maximos("Pivot") = Objetos.EstableceMaximos(_Ds, "VOL MAX PVT ")
            lblx_volumenTxConfig.Text = Maximos("Pivot")
        End If
    End Sub

    Protected Sub pvgx_datos_CustomCellDisplayText(sender As Object, e As PivotCellDisplayTextEventArgs) Handles pvgx_datos.CustomCellDisplayText
        If Object.ReferenceEquals(e.DataField, pvgx_datos.Fields("PorcentajeCantidad")) Then

            Dim fieldCantidad As PivotGridField = pvgx_datos.Fields("fieldCantidad")
            Dim cantidad As Object = e.GetCellValue(fieldCantidad)

            If cantidad Is Nothing Then
                Return
            End If
            Dim grandTotalCantidad As Decimal = CDec(e.GetRowGrandTotal(fieldCantidad))

            If grandTotalCantidad = 0 Then
                Return
            End If
            Dim perc As Decimal = CDec(cantidad) / grandTotalCantidad
            e.DisplayText = String.Format("{0:p}", perc)
        End If

        If Object.ReferenceEquals(e.DataField, pvgx_datos.Fields("PorcentajeDeuda")) Then

            Dim fieldDeuda As PivotGridField = pvgx_datos.Fields("fieldDeuda")
            Dim Deuda As Object = e.GetCellValue(fieldDeuda)

            If Deuda Is Nothing Then
                Return
            End If
            Dim grandTotalDeuda As Decimal = CDec(e.GetRowGrandTotal(fieldDeuda))

            If grandTotalDeuda = 0 Then
                Return
            End If
            Dim perc As Decimal = CDec(Deuda) / grandTotalDeuda
            e.DisplayText = String.Format("{0:p}", perc)
        End If

        If Object.ReferenceEquals(e.DataField, pvgx_datos.Fields("PorcentajeValor")) Then

            Dim fieldValor As PivotGridField = pvgx_datos.Fields("fieldValor")
            Dim Valor As Object = e.GetCellValue(fieldValor)

            If Valor Is Nothing Then
                Return
            End If
            Dim grandTotalValor As Decimal = CDec(e.GetRowGrandTotal(fieldValor))

            If grandTotalValor = 0 Then
                Return
            End If
            Dim perc As Decimal = CDec(Valor) / grandTotalValor
            e.DisplayText = String.Format("{0:p}", perc)
        End If
    End Sub

    Protected Sub pvgx_datos_FieldValueDisplayText(sender As Object, e As DevExpress.Web.ASPxPivotGrid.PivotFieldDisplayTextEventArgs) Handles pvgx_datos.FieldValueDisplayText
        Dim Valor As Integer
        If Not e.Field Is Nothing AndAlso e.Field.FieldName = "MES" Then
            e.DisplayText = CultureInfo.CurrentUICulture.DateTimeFormat.MonthNames(CInt(Fix(e.Value - 1)))
        End If

        If Not e.Field Is Nothing AndAlso e.Field.FieldName = "DIASEMANA" Then
            Select Case e.DisplayText
                Case 7
                    Valor = 0
                Case Else
                    Valor = e.DisplayText
            End Select
            e.DisplayText = CultureInfo.CurrentUICulture.DateTimeFormat.DayNames(CInt(Fix(Valor)))
        End If


        '------------------- DEUDA ------------------------
        fieldCantidad.GrandTotalCellFormat.FormatType = DevExpress.Utils.FormatType.Numeric
        fieldCantidad.GrandTotalCellFormat.FormatString = "n0" ' "##,###,###,##0"

        fieldCantidad.CellFormat.FormatType = DevExpress.Utils.FormatType.Numeric
        fieldCantidad.CellFormat.FormatString = "n0" '"##,###,###,##0"

        '------------------- DEUDA ------------------------
        fieldDeuda.GrandTotalCellFormat.FormatType = DevExpress.Utils.FormatType.Numeric
        fieldDeuda.GrandTotalCellFormat.FormatString = "n0"

        fieldDeuda.CellFormat.FormatType = DevExpress.Utils.FormatType.Numeric
        fieldDeuda.CellFormat.FormatString = "n0"

        '------------------- VALOR ------------------------
        fieldValor.GrandTotalCellFormat.FormatType = DevExpress.Utils.FormatType.Numeric
        fieldValor.GrandTotalCellFormat.FormatString = "n0" ' "##,###,###,##0"

        fieldValor.CellFormat.FormatType = DevExpress.Utils.FormatType.Numeric
        fieldValor.CellFormat.FormatString = "n0" ' "##,###,###,##0"

    End Sub

    Public Sub retornaOficina_Seleccionadas(ByRef OFICINA_ID As String)
        Dim lBoxSuc As ASPxListBox = dde_oficina.FindControl("lstx_oficina")
        OFICINA_ID = ""

        For i = 0 To lBoxSuc.Items.Count - 1
            If Trim(lBoxSuc.Items(i).Value) > 0 Then
                If lBoxSuc.Items(i).Selected = True And i > 0 Then
                    OFICINA_ID &= lBoxSuc.Items(i).Value & ","
                End If
            End If
        Next

        If Len(Trim(OFICINA_ID)) > 1 Then
            OFICINA_ID = Left(OFICINA_ID, Len(OFICINA_ID) - 1)
        End If

    End Sub

    Public Sub retornaGrupo_Seleccionadas(ByRef GRUPO_ID As String)
        Dim lBoxSuc As ASPxListBox = dde_grupo.FindControl("lstx_grupo")
        GRUPO_ID = ""

        For i = 0 To lBoxSuc.Items.Count - 1
            If Trim(lBoxSuc.Items(i).Value) > 0 Then
                If lBoxSuc.Items(i).Selected = True And i > 0 Then
                    GRUPO_ID &= lBoxSuc.Items(i).Value & ","
                End If
            End If
        Next

        If Len(Trim(GRUPO_ID)) > 1 Then
            GRUPO_ID = Left(GRUPO_ID, Len(GRUPO_ID) - 1)
        End If

    End Sub

    Public Sub retornaSegmento_Seleccionadas(ByRef SEGMENTO_ID As String)
        Dim lBoxSuc As ASPxListBox = dde_segmento.FindControl("lstx_segmento")
        SEGMENTO_ID = ""

        For i = 0 To lBoxSuc.Items.Count - 1
            If Trim(lBoxSuc.Items(i).Value) > 0 Then
                If lBoxSuc.Items(i).Selected = True And i > 0 Then
                    SEGMENTO_ID &= lBoxSuc.Items(i).Value & ","
                End If
            End If
        Next

        If Len(Trim(SEGMENTO_ID)) > 1 Then
            SEGMENTO_ID = Left(SEGMENTO_ID, Len(SEGMENTO_ID) - 1)
        End If

    End Sub

    Public Sub retornaFranja_Seleccionadas(ByRef FRANJA_ID As String)
        Dim lBoxSuc As ASPxListBox = dde_franja.FindControl("lstx_franja")
        FRANJA_ID = ""

        For i = 0 To lBoxSuc.Items.Count - 1 Step 1
            If Trim(lBoxSuc.Items(i).Value) >= 0 Then
                If lBoxSuc.Items(i).Selected = True And i > 0 Then
                    FRANJA_ID &= lBoxSuc.Items(i).Value & ","
                End If
            End If
        Next

        If Len(Trim(FRANJA_ID)) > 1 Then
            FRANJA_ID = Left(FRANJA_ID, Len(FRANJA_ID) - 1)
        End If

    End Sub

    Public Sub retornaAños_Seleccionadas(ByRef AÑO_ID As String)
        Dim flag As Boolean = False
        Dim treeList As ASPxTreeList = dde_periodo.FindControl("treeList")
        AÑO_ID = ""
        For Each node As TreeListNode In treeList.GetSelectedNodes 'GetVisibleNodes
            If InStr(node.Key, "201") = 0 Then
                AÑO_ID &= "20" & Trim(node.Key) & ","
                flag = True
            End If
        Next node

        If Len(Trim(AÑO_ID)) > 4 Then
            AÑO_ID = Left(AÑO_ID, Len(AÑO_ID) - 1)
        End If

        If flag = False Then
            AÑO_ID = Nothing
        End If
    End Sub

    Protected Sub btnx_filtrar_Click(sender As Object, e As EventArgs) Handles btnx_filtrar.Click

        Dim AÑO_ID As String = Nothing
        Dim FRANJA_ID As String = Nothing
        Dim SEGMENTO_ID As String = Nothing
        Dim GRUPO_ID As String = Nothing
        Dim OFICINA_ID As String = Nothing

        Me.retornaAños_Seleccionadas(AÑO_ID)
        Me.retornaFranja_Seleccionadas(FRANJA_ID)
        Me.retornaSegmento_Seleccionadas(SEGMENTO_ID)
        Me.retornaGrupo_Seleccionadas(GRUPO_ID)
        Me.retornaOficina_Seleccionadas(OFICINA_ID)

        If Len(Trim(AÑO_ID)) < 4 Then
            AÑO_ID = Trim("1900")
        End If

        If Len(Trim(FRANJA_ID)) < 1 Then
            FRANJA_ID = Trim("-")
        End If

        If Len(Trim(SEGMENTO_ID)) < 1 Then
            SEGMENTO_ID = Trim("-")
        End If

        If Len(Trim(GRUPO_ID)) < 1 Then
            GRUPO_ID = Trim("-")
        End If

        If Len(Trim(OFICINA_ID)) < 1 Then
            OFICINA_ID = Trim("-")
        End If

        '----------------------------------
        Dim _IQrows As Long
        Try
            _Ds = TD.VolumenTrx(Canal, Trim(AÑO_ID), FRANJA_ID, SEGMENTO_ID, GRUPO_ID, OFICINA_ID)
            _IQrows = _Ds.Tables(0).Rows.Count()
            lblx_volumenTx.Text = _IQrows.ToString

            If _Ds.Tables.Count = 0 Then
            Else
                If _Ds.Tables(0).Rows.Count = 0 Then
                Else
                    _IQrows = _Ds.Tables(0).Rows.Count
                End If
            End If

            If _IQrows >= CLng(Maximos("Pivot")) Then
                Me.ASPxPopupControl2.ShowOnPageLoad = True
                lblx_mensaje_error.Text = "No es posible mostrar el volumen de registros"
                Exit Sub
            End If
        Catch ex As Exception

        End Try

        'pvgx_datos.DataSource = _Ds

        '-------------------------------------
        SqlDataGridView.SelectParameters("Anho").DefaultValue = Trim(AÑO_ID)
        SqlDataGridView.SelectParameters("Franja").DefaultValue = Trim(FRANJA_ID)
        SqlDataGridView.SelectParameters("Segmento").DefaultValue = Trim(SEGMENTO_ID)
        SqlDataGridView.SelectParameters("SubGrupo").DefaultValue = Trim(GRUPO_ID)
        SqlDataGridView.SelectParameters("Oficina").DefaultValue = Trim(OFICINA_ID)
        SqlDataGridView.SelectParameters("Canal").DefaultValue = Trim(Canal)

        pvgx_datos.DataBind()
    End Sub

    Protected Sub pvgx_datos_CustomFilterPopupItems(sender As Object, e As PivotCustomFilterPopupItemsEventArgs) Handles pvgx_datos.CustomFilterPopupItems

        If e.Field.ID = "fieldDiaSemana" Then
            ArrayList.Adapter(CType(e.Items, IList)).Sort(New OrdenamientoxComparacion.DiasItemsComparer())
        End If

        If e.Field.ID = "fieldMes" Then
            ArrayList.Adapter(CType(e.Items, IList)).Sort(New OrdenamientoxComparacion.MesesItemsComparer())
        End If
    End Sub
    Protected Sub btnx_expxls_Click(sender As Object, e As EventArgs) Handles btnx_expxls.Click

        Try
            If lblx_volumenTx.Text = "" Then
                Return
            End If
        Catch ex As Exception

        End Try

        Dim ps As New PrintingSystem()
        Dim link1 As New PrintableComponentLink()
        link1.Component = pvex_datos
        link1.PrintingSystem = ps

        Dim link2 As New Link()
        AddHandler link2.CreateDetailArea, AddressOf link2_CreateDetailArea
        link2.PrintingSystem = ps

        Dim compositeLink As New CompositeLink()
        compositeLink.Links.AddRange(New Object() {link2, link1})
        compositeLink.PrintingSystem = ps

        compositeLink.CreateDocument()
        compositeLink.PrintingSystem.ExportOptions.Pdf.DocumentOptions.Author = "Gestran S.A."

        Using stream As New MemoryStream()
            compositeLink.PrintingSystem.ExportToXlsx(stream)
            Response.Clear()
            Response.Buffer = False
            Response.AppendHeader("Content-Type", "application/xlsx")
            Response.AppendHeader("Content-Transfer-Encoding", "binary")
            Response.AppendHeader("Content-Disposition", "attachment; filename=" & rdpx_header.HeaderText & ".xlsx")
            Response.BinaryWrite(stream.ToArray())
            Response.End()
        End Using
        ps.Dispose()

    End Sub

    Private Sub link2_CreateDetailArea(ByVal sender As Object, ByVal e As CreateAreaEventArgs)
        Dim l As Link = TryCast(sender, Link)
        Dim tb As New TextBrick()
        tb.Text = rdpx_header.HeaderText
        tb.StringFormat = New BrickStringFormat(StringAlignment.Center)
        tb.Rect = New RectangleF(0, 0, l.PrintingSystem.Graph.ClientPageSize.Width, 30)
        tb.Sides = BorderSide.None
        e.Graph.DrawBrick(tb)
    End Sub



    Public Sub SeleccionaTxt()
        Dim TreeList As ASPxTreeList = dde_periodo.FindControl("TreeList")
        Dim Text As String = ""
        Dim iterator As TreeListNodeIterator = TreeList.CreateNodeIterator()

        For Each node As TreeListNode In TreeList.GetVisibleNodes()
            If node.Selected Then
                Text &= node("NOMBRE_INTERNO").ToString & ";"
            End If
        Next node
        dde_periodo.Text = Text
    End Sub

    Protected Sub cpx_td_Callback(sender As Object, e As CallbackEventArgsBase) Handles cpx_td.Callback
        SeleccionaTxt()
    End Sub
End Class