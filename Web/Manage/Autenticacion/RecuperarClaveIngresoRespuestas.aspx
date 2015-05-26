<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterSlide.Master" CodeBehind="RecuperarClaveIngresoRespuestas.aspx.vb" Inherits="Web.RecuperarClaveIngresoRespuestas" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 238px;
        }
        .auto-style3 {
            height: 17px;
        }
        .auto-style4 {
            height: 17px;
        }
        .auto-style6 {
            width: 77px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="450px" 
        HeaderText="Recuperación de Contraseña" Theme="DevEx">
        <HeaderStyle Font-Bold="True" Font-Size="12px" />
        <PanelCollection>
<dx:PanelContent runat="server">
    <table style="width: 100%;">
        <tr>
            <td colspan="3">
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Font-Bold="False" 
                    Text="A continuación escriba las respuestas a sus preguntas de seguridad." 
                    Theme="DevEx">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="auto-style3" colspan="3"></td>
        </tr>
        <tr>
            <td class="auto-style3" colspan="3">
                <dx:ASPxGridView ID="gdvx_respuestas" KeyFieldName="ID" runat="server" 
                    AutoGenerateColumns="False" EnableTheming="True" Theme="MetropolisBlue" 
                    Width="100%">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="ID" ShowInCustomizationForm="True" Visible="false" VisibleIndex="1">
                            <Settings AllowSort="False" />
                            <HeaderStyle Font-Bold="True" Font-Size="12px" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PREGUNTA"  ShowInCustomizationForm="True" VisibleIndex="2">
                            <Settings AllowSort="False" />
                            <HeaderStyle Font-Bold="True" Font-Size="12px" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="RESPUESTA" ShowInCustomizationForm="True" VisibleIndex="3">
                            <Settings AllowSort="False" />
                            <DataItemTemplate>
                                <dx:ASPxTextBox ID="txtRespuesta" runat="server" AutoComplete="off" Width="170px">
                                     <ValidationSettings>
                                            <RequiredField IsRequired="True" ErrorText="Requerido"/>
                                      </ValidationSettings>
                                </dx:ASPxTextBox>
                        </DataItemTemplate>
                            <HeaderStyle Font-Bold="True" Font-Size="12px" />
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsPager PageSize="2" Visible="False">
                    </SettingsPager>
                    <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                </dx:ASPxGridView>
            </td>
        </tr>
        <tr>
            <td class="auto-style3"></td>
            <td class="auto-style3"></td>
            <td class="auto-style3"></td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
            <td>
                <dx:ASPxButton ID="btn_Aceptar_RecuperarClaveIngresoRespuestas" runat="server" 
                    Text="Aceptar" Theme="PlasticBlue" Width="200px">
                </dx:ASPxButton>
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center">
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
