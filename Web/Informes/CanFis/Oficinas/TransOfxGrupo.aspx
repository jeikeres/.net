﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TransOfxGrupo.aspx.vb" Inherits="Web.TransxGrupo_OFI" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1
        {
            width: 894px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxCallbackPanel ID="cbp_Grillas" runat="server" ClientInstanceName="callback" 
        OnCallback="cbp_Grillas_Callback">
            <PanelCollection>
                <dx:PanelContent>                              
                                <dx:ASPxRoundPanel ID="rdpx_header" runat="server" ShowCollapseButton="true" 
                                    Width="100%" Theme="MetropolisBlue" HeaderText="OFICINAS - Transaccional Grupo de Transacción">
                                    <PanelCollection>
                                        <dx:PanelContent ID="PanelContent1" runat="server">
                                            <table style="border-collapse: collapse; width: 100%">
                                                <tr>
                                                    <td style="width: 50%">
                                                        <dx:ASPxRoundPanel ID="rp_Seleccion" runat="server" ShowCollapseButton="false" View="GroupBox" 
                                                            HeaderText="Pre-Filtros" Theme="Metropolis" Width="100%">                           
                                                            <PanelCollection>
                                                                <dx:PanelContent ID="PanelContent2" runat="server">
                                                                    <table style="border-collapse: collapse">
                                                                        <tr>
                                                                            <td>
                                                                                <dx:ASPxLabel ID="lbl_Anio" runat="server" Text="Año" Theme="MetropolisBlue"></dx:ASPxLabel>
                                                                            </td>                                                              
                                                                            <td>
                                                                                &nbsp;
                                                                            </td>
                                                                            <td>
                                                                                <dx:ASPxLabel ID="lbl_NombreOficina" runat="server" Text="Oficina" Theme="MetropolisBlue"></dx:ASPxLabel>                                                                               
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;
                                                                            </td>                                                             
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <dx:ASPxComboBox ID="cb_Anio" runat="server" ValueType="System.String" Theme="MetropolisBlue">
                                                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) {cbOficina.PerformCallback();}" />
                                                                                </dx:ASPxComboBox>
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;
                                                                            </td>
                                                                            <td>
                                                                                <dx:ASPxComboBox ID="cb_Oficina" runat="server" ValueType="System.String" Theme="MetropolisBlue" 
                                                                                    ClientInstanceName="cbOficina" OnCallback="cb_Oficina_Callback"></dx:ASPxComboBox>                                                                                
                                                                            </td>
                                                                            <td>
                                                                                &nbsp;
                                                                            </td>
                                                                            <td>
                                                                                <dx:ASPxButton ID="btnx_filtrar" runat="server" Text="Aplicar Pre-Filtros" Theme="MetropolisBlue" Width="140px" AutoPostBack="false">
                                                                                    <ClientSideEvents Click="function(s, e) {callback.PerformCallback();}" />
                                                                                </dx:ASPxButton>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </dx:PanelContent>
                                                            </PanelCollection>
                                                        </dx:ASPxRoundPanel>
                                                    </td>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td valign="bottom">
                                                        <table style="border-collapse: collapse; border: 1px solid #d3d3d3; width: 600px; height:74px">
                                                            <tr>                           
                                                                <td colspan="2" align="center" style="border: 1px solid #d3d3d3;">
                                                                    &nbsp;</td>
                                                                <td align="center" style="border: 1px solid #d3d3d3;">
                                                                    <dx:ASPxLabel ID="lbl_LunesViernes" runat="server" Text="Días - Hora" Theme="MetropolisBlue"></dx:ASPxLabel>
                                                                </td>
                                                                <td align="center" style="border: 1px solid #d3d3d3;">
                                                                    <dx:ASPxLabel ID="lbl_Sabado" runat="server" Text="Sabado" Theme="MetropolisBlue"></dx:ASPxLabel>
                                                                </td>
                                                                <td align="center" style="border: 1px solid #d3d3d3;">
                                                                    <dx:ASPxLabel ID="lbl_Festivos" runat="server" Text="Festivos" Theme="MetropolisBlue"></dx:ASPxLabel>
                                                                </td>
                                                            </tr>
                                                            <tr>                           
                                                                <td rowspan="2" align="center" style="border: 1px solid #d3d3d3;">
                                                                    <dx:ASPxLabel ID="lbl_Hora" runat="server" Text="Hora:" Theme="MetropolisBlue"></dx:ASPxLabel>
                                                                </td>
                                                                <td align="center" style="border: 1px solid #d3d3d3;">
                                                                    <dx:ASPxLabel ID="lbl_Normal" runat="server" Text="Normal" Theme="MetropolisBlue"></dx:ASPxLabel>
                                                                </td>
                                                                <td align="center" style="border: 1px solid #d3d3d3;">
                                                                    <dx:ASPxLabel ID="lbl_HorarioNormal" runat="server" Theme="MetropolisBlue"></dx:ASPxLabel>
                                                                </td>
                                                                <td rowspan="2" align="center" style="border: 1px solid #d3d3d3;">
                                                                    <dx:ASPxLabel ID="lbl_HoraNorSab" runat="server" Theme="MetropolisBlue"></dx:ASPxLabel>
                                                                </td>
                                                                <td rowspan="2" align="center" style="border: 1px solid #d3d3d3;">
                                                                    <dx:ASPxLabel ID="lbl_HoraNorFest" runat="server" Theme="MetropolisBlue"></dx:ASPxLabel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center" style="border: 1px solid #d3d3d3;">
                                                                    <dx:ASPxLabel ID="lbl_Adicional" runat="server" Text="Adicional" Theme="MetropolisBlue"></dx:ASPxLabel>
                                                                </td>
                                                                <td align="center" style="border: 1px solid #d3d3d3;">
                                                                    <dx:ASPxLabel ID="lbl_HorarioAdicional" runat="server" Theme="MetropolisBlue"></dx:ASPxLabel>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>      
                                        </dx:PanelContent>
                                    </PanelCollection>
                                </dx:ASPxRoundPanel>
                                <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" ShowCollapseButton="false" 
                                    Width="100%" ShowHeader="false" Theme="MetropolisBlue">
                                    <PanelCollection>
                                        <dx:PanelContent>
                                            <table style="width: 100%">
                                                <tr>
                                                    <td>
                                                        <table style="width:100%;">
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                                <td class="auto-style1">&nbsp;</td>
                                                                <td>
                                                                    <dx:ASPxButton ID="btnx_expxls" runat="server" Text="Excel" Theme="MetropolisBlue" Visible="false" Width="90px">
                                                                        <Image Url="~/App_Themes/Default/img/page/save.png">
                                                                        </Image>
                                                                    </dx:ASPxButton>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>                                                      
                                                        <dx:ASPxPivotGrid ID="pvt_Pivote1" runat="server" Theme="MetropolisBlue" 
                                                            OnFieldValueDisplayText="pvt_Pivote1_FieldValueDisplayText">
                                                             <OptionsView HorizontalScrollBarMode="Auto" />
                                                             <OptionsPager ColumnsPerPage="15">
                                                             </OptionsPager>
        <OptionsFilter NativeCheckBoxes="False" />
                                                        </dx:ASPxPivotGrid>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxPivotGrid ID="pvt_Pivote2" runat="server" Theme="MetropolisBlue" 
                                                            OnFieldValueDisplayText="pvt_Pivote2_FieldValueDisplayText">

                                                            <OptionsPager ColumnsPerPage="15">
                                                            </OptionsPager>

                                                        </dx:ASPxPivotGrid>
                                                    </td>
                                                </tr>
                                            </table>
                                        </dx:PanelContent>
                                    </PanelCollection>
                                </dx:ASPxRoundPanel>                                                                                                                                                                                                               
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>  
    </div>
        <dx:ASPxPivotGridExporter ID="pvex_datos" runat="server" ASPxPivotGridID="pvt_Pivote1">
        </dx:ASPxPivotGridExporter>
        <dx:ASPxPivotGridExporter ID="pvex_datos0" runat="server" ASPxPivotGridID="pvt_Pivote2">
        </dx:ASPxPivotGridExporter>
    </form>
</body>
</html>