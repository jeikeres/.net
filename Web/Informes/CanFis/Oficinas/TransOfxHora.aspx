<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TransOfxHora.aspx.vb" Inherits="Web.Pantalla3" %>

<%@ Register Assembly="DevExpress.XtraCharts.v14.2.Web, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>


<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.XtraCharts.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>

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
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ShowCollapseButton="true" 
            Width="100%" Theme="MetropolisBlue" HeaderText="OFICINAS - Transaccional por Hora">
            <PanelCollection>
                <dx:PanelContent ID="PanelContent1" runat="server">
                    <table style="border-collapse: collapse; width: 100%">
                        <tr>
                            <td>
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 70%">
                                            <dx:ASPxRoundPanel ID="rp_Filros" runat="server" ShowCollapseButton="false" 
                                                Width="100%" View="GroupBox" Theme="Metropolis" HeaderText="Pre-Filtros">
                                                <PanelCollection>
                                                    <dx:PanelContent>
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <dx:ASPxLabel ID="lbl_Anio" runat="server" Text="Año" Theme="MetropolisBlue"></dx:ASPxLabel>
                                                                </td>
                                                                <td>
                                                                    <dx:ASPxLabel ID="lbl_Mes" runat="server" Text="Mes" Theme="MetropolisBlue"></dx:ASPxLabel>
                                                                </td>
                                                                <td>
                                                                    <dx:ASPxLabel ID="lbl_Dia" runat="server" Text="Día" Theme="MetropolisBlue"></dx:ASPxLabel>
                                                                </td>
                                                                <td>                                                                    
                                                                    <dx:ASPxLabel ID="lbl_Oficina" runat="server" Text="Oficina" Theme="MetropolisBlue"></dx:ASPxLabel>
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
                                                                    <dx:ASPxListBox ID="lbx_Anio" ClientInstanceName="lbx_Anio" runat="server" ValueType="System.String" 
                                                                        Theme="MetropolisBlue" Height="95px">
                                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {lbx_Mes.PerformCallback();callback.PerformCallback(); callbackHorario.PerformCallback();}" />
                                                                    </dx:ASPxListBox>
                                                                </td>
                                                                <td>
                                                                    <dx:ASPxListBox ID="lbx_Mes" ClientInstanceName="lbx_Mes" runat="server" ValueType="System.String" 
                                                                        Theme="MetropolisBlue" Height="95px" OnCallback="lbx_Mes_Callback">
                                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {lbx_Dia.PerformCallback();callback.PerformCallback(); callbackHorario.PerformCallback();}" />
                                                                    </dx:ASPxListBox>
                                                                </td>
                                                                <td>
                                                                    <dx:ASPxListBox ID="lbx_Dia" ClientInstanceName="lbx_Dia" runat="server" ValueType="System.String" 
                                                                        Theme="MetropolisBlue" Height="95px" OnCallback="lbx_Dia_Callback">
                                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {lbx_Oficina.PerformCallback();callback.PerformCallback(); callbackHorario.PerformCallback();}" />
                                                                    </dx:ASPxListBox>
                                                                </td>
                                                                <td>
                                                                    <dx:ASPxListBox ID="lbx_Oficina" runat="server" ValueType="System.String" Theme="MetropolisBlue" 
                                                                        Height="95px" ClientInstanceName="lbx_Oficina" OnCallback="lbx_Oficina_Callback">
                                                                         <ClientSideEvents SelectedIndexChanged="function(s, e) {callback.PerformCallback(); callbackHorario.PerformCallback();}" />
                                                                    </dx:ASPxListBox>
                                                                </td>
                                                                <td>
                                                                    &nbsp;
                                                                </td>
                                                                <td>
                                                                    <dx:ASPxButton ID="btnx_filtrar" runat="server" Text="Aplicar Pre-Filtros" 
                                                                        Theme="MetropolisBlue" Width="140px" Visible="false" AutoPostBack="false">
                                                                        <ClientSideEvents Click="function(s, e) {callback.PerformCallback(); callbackHorario.PerformCallback();}" />
                                                                    </dx:ASPxButton>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </dx:PanelContent>
                                                </PanelCollection>
                                            </dx:ASPxRoundPanel>
                                        </td>
                                        <td valign="bottom">
                                            <dx:ASPxCallbackPanel ID="ASPxCallbackPanel2" runat="server" ClientInstanceName="callbackHorario" 
                                                OnCallback="ASPxCallbackPanel2_Callback">
                                                <PanelCollection>
                                                    <dx:PanelContent>
                                                        <table style="border-collapse: collapse; border: 1px solid #d3d3d3; width: 600px; height: 148px">
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
                                                    </dx:PanelContent>
                                                </PanelCollection>
                                            </dx:ASPxCallbackPanel>                                                                                                                              
                                        </td>
                                    </tr>
                                </table>                       
                            </td>
                        </tr>                                   
                    </table>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>
        <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" ClientInstanceName="callback" 
            OnCallback="ASPxCallbackPanel1_Callback">                                            
            <PanelCollection>
                <dx:PanelContent>
                    <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" ShowCollapseButton="false" 
                        Width="100%" ShowHeader="false" Theme="MetropolisBlue">
                        <PanelCollection>
                            <dx:PanelContent ID="PanelContent2" runat="server">
                                <table style="width: 100%; border-collapse: collapse">
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
                                            <dxchartsui:WebChartControl ID="wb_Grafico" runat="server" Width="1320px" Height="340px" Theme="MetropolisBlue"></dxchartsui:WebChartControl> 
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
    </form>
</body>
</html>
