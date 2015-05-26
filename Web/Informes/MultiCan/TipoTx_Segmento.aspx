<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TipoTx_Segmento.aspx.vb" Inherits="Web.TipoTx_Segmento" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>

<%@ Register assembly="DevExpress.XtraCharts.v14.2.Web, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <link href="../../App_Themes/Default/css/StyleSheet.css" rel="Stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style8
        {
            width: 130px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    

    

<dx:ASPxRoundPanel ID="rdpx_header" runat="server" HeaderText="MULTICANAL - Tipo Transacción y Segmento" ShowCollapseButton="true" Theme="MetropolisBlue" Width="100%">
            <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxRoundPanel ID="rdpx_prefiltros" runat="server" HeaderText="Pre-Filtros" ShowCollapseButton="True" Theme="MetropolisBlue" View="GroupBox" Width="100%">
        <PanelCollection>
            <dx:PanelContent runat="server">
                <table style="width: 100%;">
                    <tr>
                        <td class="auto-style8">
                            <dx:ASPxLabel ID="lblx_nperiodo" runat="server" Text="Año Inicio" Theme="MetropolisBlue">
                            </dx:ASPxLabel>
                        </td>
                        <td class="auto-style8">
                            <dx:ASPxLabel ID="lblx_noficina" runat="server" Text="Mes Inicio" Theme="MetropolisBlue">
                            </dx:ASPxLabel>
                        </td>
                        <td class="auto-style8">
                            <dx:ASPxLabel ID="lblx_nperiodo0" runat="server" Text="Año Fin" Theme="MetropolisBlue">
                            </dx:ASPxLabel>
                        </td>
                        <td class="auto-style8">
                            <dx:ASPxLabel ID="lblx_noficina0" runat="server" Text="Mes Fin" Theme="MetropolisBlue">
                            </dx:ASPxLabel>
                        </td>
                        <td class="auto-style8">
                            <dx:ASPxLabel ID="lblx_noficina2" runat="server" Text="Tipo Transacción" Theme="MetropolisBlue">
                            </dx:ASPxLabel>
                        </td>
                        <td class="auto-style8">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style8">
                            <dx:ASPxComboBox ID="cbbx_anoini" runat="server" Width="120px">
                                <ClientSideEvents SelectedIndexChanged="function(s, e) {
	                                                    GraficChart.PerformCallback();
                                                    }" />
                            </dx:ASPxComboBox>
                        </td>
                        <td class="auto-style8">
                            <dx:ASPxComboBox ID="cbbx_mesini" runat="server" Width="120px">
                                <ClientSideEvents SelectedIndexChanged="function(s, e) {
	                                                    GraficChart.PerformCallback();
                                                    }" />
                            </dx:ASPxComboBox>
                        </td>
                        <td class="auto-style8">
                            <dx:ASPxComboBox ID="cbbx_anofin" runat="server" Width="120px">
                                <ClientSideEvents SelectedIndexChanged="function(s, e) {
	                                                    GraficChart.PerformCallback();
                                                    }" />
                            </dx:ASPxComboBox>
                        </td>
                        <td class="auto-style8">
                            <dx:ASPxComboBox ID="cbbx_mesfin" runat="server" Width="120px">
                                <ClientSideEvents SelectedIndexChanged="function(s, e) {
	                                                    GraficChart.PerformCallback();
                                                    }" />
                            </dx:ASPxComboBox>
                        </td>
                        <td class="auto-style8">
                            <dx:ASPxComboBox ID="cbbx_tipotx" runat="server" Width="120px">
                                <ClientSideEvents SelectedIndexChanged="function(s, e) {
	                                                    GraficChart.PerformCallback();
                                                    }" />
                            </dx:ASPxComboBox>
                        </td>
                        <td class="auto-style8">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
                </dx:PanelContent>
</PanelCollection>
</dx:ASPxRoundPanel>




<dx:ASPxRoundPanel ID="rdpx_grid" runat="server" ShowHeader="False" Theme="MetropolisBlue" Width="100%">
            <PanelCollection>
<dx:PanelContent runat="server">
    
    <div style="text-align:center;">
    <dxchartsui:WebChartControl ID="wchx_barras" runat="server" ClientInstanceName="GraficChart" CrosshairEnabled="True" Height="429px" Width="940px">
    </dxchartsui:WebChartControl>
    </div>

                </dx:PanelContent>
</PanelCollection>
        </dx:ASPxRoundPanel>



    </div>
    </form>
</body>
</html>
