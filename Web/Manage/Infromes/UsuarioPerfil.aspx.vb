﻿Imports System.Data.SqlClient
Imports DevExpress.Web.ASPxTreeList
Imports DevExpress.Web
Imports Negocio
Imports DevExpress.Web.ASPxPivotGrid
Imports DevExpress.XtraPivotGrid.Data
Imports Web.OrdenamientoxComparacion
Imports System.Globalization
Imports DevExpress.XtraPrinting
Imports System.Drawing
Imports DevExpress.XtraPrintingLinks
Imports System.IO

Public Class UsuarioPerfil
    Inherits System.Web.UI.Page

    Dim TD As New cls_tabladinamica
    Dim _Ds As DataSet
    Dim Objetos As New Objetos
    Dim Pagina As New cls_CargaPagina

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            _Ds = Pagina.CargaPermisosPagina(Session("IDUsuario"), System.IO.Path.GetFileName(Request.ServerVariables("SCRIPT_NAME")))
            btnx_expxls.Visible = CType(Objetos.ActivaButtonsPermiso(_Ds, "EXPXLSX"), Boolean)
        End If
    End Sub

    Protected Sub btnx_expxls_Click(sender As Object, e As EventArgs) Handles btnx_expxls.Click

        Dim ps As New PrintingSystem()
        Dim link1 As New PrintableComponentLink()
        link1.Component = gvex_datos
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


    'Public Sub retornaSegmento_Seleccionadas(ByRef SEGMENTO_ID As String)
    '    Dim lBoxSuc As ASPxListBox = dde_segmento.FindControl("lstx_segmento")
    '    SEGMENTO_ID = ""

    '    For i = 0 To lBoxSuc.Items.Count - 1
    '        If Trim(lBoxSuc.Items(i).Value) > 0 Then
    '            If lBoxSuc.Items(i).Selected = True And i > 0 Then
    '                SEGMENTO_ID &= lBoxSuc.Items(i).Value & ","
    '            End If
    '        End If
    '    Next

    '    If Len(Trim(SEGMENTO_ID)) > 1 Then
    '        SEGMENTO_ID = Left(SEGMENTO_ID, Len(SEGMENTO_ID) - 1)
    '    End If

    'End Sub

    Public Sub RetornaSeleccionadas(ByRef GRUPO_ID As String)
        Dim lBoxSuc As ASPxListBox = dde_perfil.FindControl("lstx_perfil")
        GRUPO_ID = ""

        For i = 0 To lBoxSuc.Items.Count - 1
            If Trim(lBoxSuc.Items(i).Text) <> "Todos" Then
                If lBoxSuc.Items(i).Selected = True And Trim(lBoxSuc.Items(i).Text) <> "Todos" Then
                    GRUPO_ID &= "|" & Trim(lBoxSuc.Items(i).Text) & "|,"
                End If
            End If
        Next

        If Len(Trim(GRUPO_ID)) > 1 Then
            GRUPO_ID = Left(GRUPO_ID, Len(GRUPO_ID) - 1)
        End If

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

    Protected Sub btnx_filtrar_Click(sender As Object, e As EventArgs) Handles btnx_filtrar.Click

        Dim IDs As String = ""

        RetornaSeleccionadas(IDs)

        If Len(Trim(IDs)) < 1 Then
            IDs = Trim("|-|")
        End If

        Session("COD_PERFIL_INF") = IDs
    End Sub
End Class