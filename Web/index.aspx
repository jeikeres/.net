<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterSlide.Master" CodeBehind="index.aspx.vb" Inherits="Web.index" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1
    {
        width: 298px;
    }
    .auto-style2
    {
        width: 277px;
    }
    .auto-style3
    {
        width: 56px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <dx:ASPxCallbackPanel ID="cbpx_login" ClientInstanceName="CPLogin" runat="server" Width="500px">
<PanelCollection>
    <dx:PanelContent runat="server">
        <dx:ASPxRoundPanel ID="rdpx_login"  HeaderText="Ingreso de Usuarios Registrados" runat="server" Width="500px">
            <HeaderStyle Font-Bold="True" Font-Size="12px" />
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <table style="width:100%;">
                        <tr>
                            <td class="auto-style2">
                                <dx:ASPxLabel ID="lblx_usuario" runat="server" Theme="DevEx" 
                        Font-Bold="True" ForeColor="#666666" Text="Usuario">
                                </dx:ASPxLabel>
                            </td>
                            <td class="auto-style3">
                                &nbsp;</td>
                            <td>
                                <dx:ASPxLabel ID="lblx_contrasena"  runat="server" Font-Bold="True" ForeColor="#666666" Text="Contraseña" Theme="DevEx">
                                </dx:ASPxLabel>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                <dx:ASPxTextBox ID="txt_in_user_sesion" runat="server" Width="200px">
                            <ValidationSettings EnableCustomValidation="True" 
                            ErrorDisplayMode="ImageWithTooltip" ErrorText="Usuario Inválido" 
                            SetFocusOnError="True">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td class="auto-style3">
                                &nbsp;</td>
                            <td>
                                <dx:ASPxTextBox ID="txt_in_pass_sesion" Password="true" runat="server" Width="200px">
                                    <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="ImageWithTooltip" ErrorText="Clave Inválida" SetFocusOnError="True">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style3">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <dx:ASPxLabel ID="lbl_inf_problems_inicio" runat="server" Font-Bold="True" ForeColor="#990000">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxButton ID="btnx_login0" runat="server" AutoPostBack="False" Height="16px" Text="Ingresar" Width="200px">
                                </dx:ASPxButton>
                                <dx:ASPxButton ID="btnx_login" runat="server" AutoPostBack="False"  Height="16px"  Width="200px" Text="Ingresar" Visible="False">
                                         <ClientSideEvents Click="function(s, e) {
                                                           CPLogin.PerformCallback();
                                                    }" />
                                </dx:ASPxButton>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                <dx:ASPxHyperLink ID="hplx_recuperar" runat="server" NavigateUrl="~/Manage/Autenticacion/RecuperarClaveIngresoUser.aspx" Theme="DevEx" Text="Recuperar contraseña">
                                                <ClientSideEvents Click="function(s, e) {
                                                           hyp.PerformCallback();
                                                    }" />
                                </dx:ASPxHyperLink>
                            </td>
                            <td class="auto-style3">&nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>
    </dx:PanelContent>
</PanelCollection>
</dx:ASPxCallbackPanel>
</asp:Content>
