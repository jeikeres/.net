<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="EstablecerRespuestasMenu.aspx.vb" Inherits="Web.EstablecerRespuestasMenu" %>

<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 18px;
        }
        .auto-style2 {
            height: 17px;
        }
        .auto-style3 {
        }
        .auto-style4 {
            height: 18px;
            width: 69px;
        }
        .auto-style5 {
            height: 17px;
            width: 69px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <dx:ASPxRoundPanel ID="rndpx_EstablecerRespuestasMenu" runat="server" 
            Theme="MetropolisBlue" Width="100%" 
            HeaderText="Establecer Preguntas y Respuestas de Seguridad">

            <HeaderStyle Font-Bold="False" />
            <PanelCollection>
<dx:PanelContent runat="server">
    <table style="width:50%;">
        <tr>
            <td colspan="3">
                <dx:ASPxLabel ID="lbl_titulo_politicas" runat="server" Font-Bold="False" 
                    ForeColor="#666666" Text="Antes de ingresar sus respuestas tenga en cuenta:" 
                    Theme="MetropolisBlue">
                </dx:ASPxLabel>
                <br />
                <dx:ASPxLabel ID="lbl_politica1" runat="server" 
                    Text="1. El sistema es sensible a mayúsculas y minúsculas." 
                    Theme="MetropolisBlue">
                </dx:ASPxLabel>
                <br />
                <dx:ASPxLabel ID="lbl_politica2" runat="server" 
                    Text="2. Debe recordar si ingresó espacios en blanco." Theme="MetropolisBlue">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
            <div>
                <table style="width:100%;">
                    <tr>
                        <td>
                            <dx:ASPxLabel ID="lbl_password" runat="server" Font-Bold="True" 
                                ForeColor="#666666" Text="Contraseña:" Theme="MetropolisBlue">
                            </dx:ASPxLabel>
                        </td>
                        <td>
                            <dx:ASPxTextBox ID="txt_Password" runat="server" Password="True" 
                                Theme="MetropolisBlue" Width="200px">
                                <ValidationSettings>
                                    <RequiredField ErrorText="Requerido" IsRequired="True" />
                                </ValidationSettings>
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                </table>
            </div>
                
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">
                <dx:ASPxLabel ID="lbl_Pregunta1" runat="server" Font-Bold="True" 
                    ForeColor="#666666" Text="Pregunta 1" Theme="MetropolisBlue">
                </dx:ASPxLabel>
            </td>
            <td class="auto-style4"></td>
            <td class="auto-style1">
                <dx:ASPxLabel ID="lbl_Respuesta1" runat="server" Font-Bold="True" 
                    ForeColor="#666666" Text="Respuesta 1" Theme="MetropolisBlue">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxComboBox ID="cbx_Pregunta1" runat="server" Width="250px" 
                    Theme="MetropolisBlue">
                    
                </dx:ASPxComboBox>
            </td>
            <td class="auto-style3">&nbsp;</td>
            <td>
                <dx:ASPxTextBox ID="txt_Respuesta1" runat="server" Width="200px" 
                    AutoCompleteType="Disabled" Theme="MetropolisBlue">
                    <validationsettings>
                        <requiredfield errortext="Requerido" isrequired="True" />
                    </validationsettings>
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lbl_Pregunta2" runat="server" Font-Bold="True" 
                    ForeColor="#666666" Text="Pregunta 2" Theme="MetropolisBlue">
                </dx:ASPxLabel>
            </td>
            <td class="auto-style3">&nbsp;</td>
            <td>
                <dx:ASPxLabel ID="lbl_Respuesta2" runat="server" Font-Bold="True" 
                    ForeColor="#666666" Text="Respuesta 2" Theme="MetropolisBlue">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxComboBox ID="cbx_Pregunta2" runat="server" Width="250px" 
                    Theme="MetropolisBlue">
                </dx:ASPxComboBox>
            </td>
            <td class="auto-style3">&nbsp;</td>
            <td>
                <dx:ASPxTextBox ID="txt_Respuesta2" runat="server" Width="200px" 
                    AutoCompleteType="Disabled" Theme="MetropolisBlue">
                    <validationsettings>
                        <requiredfield errortext="Requerido" isrequired="True" />
                    </validationsettings>
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2"></td>
            <td class="auto-style5"></td>
            <td class="auto-style2"></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>
                <dx:ASPxButton ID="btn_Aceptar_EstablecerRespuestasMenu" runat="server" 
                    Text="Aceptar" Theme="MetropolisBlue" Width="200px">
                </dx:ASPxButton>
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <dx:ASPxLabel ID="lbl_mensaje" runat="server" Theme="MetropolisBlue" 
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <dx:ASPxLabel ID="lbl_mensaje_respuestas" runat="server" Theme="MetropolisBlue" 
                    Font-Bold="True">
                </dx:ASPxLabel>
                &nbsp;<dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" 
                    Theme="MetropolisBlue" Font-Bold="True">
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
