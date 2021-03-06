﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CambiarClaveMenu.aspx.vb" Inherits="Web.CambiarClaveMenu" %>

<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 289px;
        }
        .auto-style3 {
            height: 23px;
        }
        .auto-style5 {
            height: 17px;
        }
        .auto-style6 {
            width: 289px;
            height: 17px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="100%" 
            HeaderText="Establecer Nueva Contraseña" Theme="MetropolisBlue">
            <HeaderStyle Font-Bold="False" />
            <PanelCollection>
<dx:PanelContent runat="server">
    <table style="width:40%;">
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
            <td>&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style3">
                <dx:ASPxLabel ID="lbl_pass_actual" runat="server" Font-Bold="True" ForeColor="#666666" Text="Contraseña actual:" Theme="DevEx">
                </dx:ASPxLabel>

            </td>
            <td class="auto-style3">
                <dx:ASPxTextBox ID="txt_pass_actual" runat="server" Password="True" 
                    Width="200px" Theme="Default">
                    <ValidationSettings>
                        <RequiredField ErrorText="Requerido" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <dx:ASPxLabel ID="lbl_pass_nuevo" runat="server" Font-Bold="True" ForeColor="#666666" Text="Contraseña nueva:" Theme="DevEx">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txt_pass_nuevo" MaxLength="20" runat="server" Width="200px" 
                    Password="True" Theme="Default">
                    <ValidationSettings>
                        <RequiredField ErrorText="Requerido" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <dx:ASPxLabel ID="lbl_reingresa_pass" runat="server" Font-Bold="True" ForeColor="#666666" Text="Repetir Contraseña:" Theme="DevEx">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txt_reingresa_pass" MaxLength="20" runat="server" Width="200px" 
                    Password="True" Theme="Default">
                    <ValidationSettings>
                        <RequiredField ErrorText="Requerido" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5"></td>
            <td class="auto-style6"></td>
            <td class="auto-style5"></td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
            <td>
                <dx:ASPxButton ID="btn_Aceptar_CambiarClaveMenu" runat="server" Text="Aceptar" 
                    Theme="MetropolisBlue" Width="200px">
                </dx:ASPxButton>
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <dx:ASPxLabel ID="lbl_mensaje" runat="server" Font-Bold="True" Theme="DevEx">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <dx:ASPxLabel ID="lbl_mensaje_redirect" runat="server" Theme="DevEx" Font-Bold="True">
                </dx:ASPxLabel>
                &nbsp;<dx:ASPxHyperLink ID="hypx_redirect" runat="server" NavigateUrl="~/index.aspx" Theme="DevEx" Font-Bold="True">
                </dx:ASPxHyperLink>
            </td>
        </tr>
    </table>
                </dx:PanelContent>
</PanelCollection>
        </dx:ASPxRoundPanel>
    
    </div>
    </form>
</body>
</html>
