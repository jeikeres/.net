<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterSlide.Master" CodeBehind="RecuperarClaveIngresoUser.aspx.vb" Inherits="Web.RecuperarClaveIngresoUser" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            height: 17px;
        }
        .auto-style4 {
            height: 17px;
        }
        .auto-style7 {
            height: 17px;
            width: 289px;
        }
        .auto-style9 {
            width: 289px;
        }
        .auto-style10 {
            height: 17px;
            width: 105px;
        }
        .auto-style11 {
            width: 105px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="400px" 
        HeaderText="Recuperación de Contraseña" Theme="DevEx">
        <HeaderStyle Font-Bold="True" Font-Size="12px" />
        <PanelCollection>
<dx:PanelContent runat="server">
    <table style="width: 100%;">
        <tr>
            <td class="auto-style7">
                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Usuario:" Font-Bold="True" 
                    Theme="DevEx" ForeColor="#666666">
                </dx:ASPxLabel>
            </td>
            <td class="auto-style10">
                &nbsp;</td>
            <td class="auto-style4">
                <dx:ASPxTextBox ID="txt_usuario" runat="server" Theme="Default" 
                    Width="200px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style11">&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style11">&nbsp;</td>
            <td>
                <dx:ASPxButton ID="btn_Aceptar_IngresoUsuario" runat="server" Text="Aceptar" 
                    Theme="PlasticBlue" Width="200px">
                </dx:ASPxButton>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <dx:ASPxLabel ID="lbl_mensaje" runat="server" Font-Bold="True" Theme="DevEx" 
                    ForeColor="#990000">
                </dx:ASPxLabel>
            </td>
        </tr>
    </table>
            </dx:PanelContent>
</PanelCollection>
    </dx:ASPxRoundPanel>
</asp:Content>
