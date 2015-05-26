<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterSlide.Master" CodeBehind="ClaveNueva.aspx.vb" Inherits="Web.ClaveNueva" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 198px;
        }
        .auto-style2 {
            width: 267px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="480px" HeaderText="Establecer nueva contraseña" Theme="DevEx">
        <HeaderStyle Font-Bold="True" Font-Size="12px" />
        <PanelCollection>
<dx:PanelContent runat="server">
    <table style="width:100%;">
        <tr>
            <td colspan="3">
                <dx:ASPxLabel ID="lblx_politicas" runat="server" Font-Bold="True" ForeColor="#666666" Theme="DevEx">
                </dx:ASPxLabel>
                <br />
                <dx:ASPxLabel ID="lblx_largominimo" runat="server" Theme="DevEx">
                </dx:ASPxLabel>
                <br />
                <dx:ASPxLabel ID="lblx_numeros" runat="server" Theme="DevEx">
                </dx:ASPxLabel>
                <br />
                <dx:ASPxLabel ID="lblx_especial" runat="server" Theme="DevEx">
                </dx:ASPxLabel>
                <br />
                <dx:ASPxLabel ID="lblx_mayus" runat="server" Theme="DevEx">
                </dx:ASPxLabel>
                 <br />
                <dx:ASPxLabel ID="lblx_minus" runat="server" Theme="DevEx">
                </dx:ASPxLabel>
                <br />
                <dx:ASPxLabel ID="lblx_historial" runat="server" Theme="DevEx">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <dx:ASPxLabel ID="lbl_pass_nuevo" runat="server" Font-Bold="True" ForeColor="#666666" Text="Contraseña nueva:" Theme="DevEx">
                </dx:ASPxLabel>
            </td>
            <td colspan="2" style="text-align: right">
                <dx:ASPxTextBox ID="txt_pass_nuevo" runat="server" Password="True" 
                    style="margin-left: 0px" Theme="Default" Width="200px">
                    <ValidationSettings>
                        <RequiredField ErrorText="Requerido" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <dx:ASPxLabel ID="lbl_reingresar_pass" runat="server" Font-Bold="True" ForeColor="#666666" Text="Repetir Contraseña:" Theme="DevEx">
                </dx:ASPxLabel>
            </td>
            <td colspan="2" style="text-align: right">
                <dx:ASPxTextBox ID="txt_reingresar_pass" runat="server" Password="True" 
                    Theme="Default" Width="200px">
                    <ValidationSettings>
                        <RequiredField ErrorText="Requerido" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td colspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td colspan="2" style="text-align: right">
                <dx:ASPxButton ID="btn_Aceptar_ClaveNueva" runat="server" Text="Aceptar" 
                    Theme="PlasticBlue" Width="200px">
                </dx:ASPxButton>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center">
                <dx:ASPxLabel ID="lbl_mensaje_pass" runat="server" Font-Bold="True" Theme="DevEx">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center">
                <dx:ASPxLabel ID="lbl_mensaje_ingreso" runat="server" Theme="DevEx" Font-Bold="True">
                </dx:ASPxLabel>
                &nbsp;<dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" NavigateUrl="~/index.aspx" Theme="DevEx" Font-Bold="True">
                </dx:ASPxHyperLink>
            </td>
        </tr>
    </table>
            </dx:PanelContent>
</PanelCollection>
    </dx:ASPxRoundPanel>
</asp:Content>
