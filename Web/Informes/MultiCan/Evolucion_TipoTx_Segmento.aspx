<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Evolucion_TipoTx_Segmento.aspx.vb" Inherits="Web.Evolucion_TipoTx_Segmento" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.XtraCharts.v14.2.Web, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register Assembly="DevExpress.XtraCharts.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../../App_Themes/Default/css/StyleSheet.css" rel="Stylesheet" type="text/css" />
    <script src="../../App_Themes/Default/js/ddex.js"></script>
    <style type="text/css">
        .auto-style8
        {
            width: 130px;
        }
        .auto-style9
        {
            height: 19px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>




            <dx:ASPxRoundPanel ID="rdpx_header" runat="server" HeaderText="MULTICANAL - Evolutivo Tipo Transacción y Segmento" ShowCollapseButton="true" Theme="MetropolisBlue" Width="100%">
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <dx:ASPxRoundPanel ID="rdpx_prefiltros" runat="server" HeaderText="Pre-Filtros" ShowCollapseButton="True" Theme="MetropolisBlue" View="GroupBox" Width="100%">
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td class="auto-style9" colspan="2">
                                                <div style="text-align:center;">
                                                    <dx:ASPxLabel ID="lblx_ano" runat="server" Text="AÑO" Theme="MetropolisBlue">
                                                    </dx:ASPxLabel>
                                                </div>
                                            </td>
                                            <td class="auto-style9" colspan="2">
                                                <div style="text-align:center;">
                                                    <dx:ASPxLabel ID="lblx_mes" runat="server" Text="MES" Theme="MetropolisBlue">
                                                    </dx:ASPxLabel>
                                                </div>
                                            </td>
                                            <td class="auto-style9" colspan="2">
                                                </td>
                                            <td class="auto-style9">
                                                </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style8">
                                                <dx:ASPxLabel ID="lblx_nperiodo" runat="server" Text="Desde:" Theme="MetropolisBlue">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td class="auto-style8">
                                                <dx:ASPxLabel ID="lblx_nperiodo0" runat="server" Text="Hasta:" Theme="MetropolisBlue">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td class="auto-style8">
                                                <dx:ASPxLabel ID="lblx_noficina" runat="server" Text="Desde:" Theme="MetropolisBlue">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td class="auto-style8">
                                                <dx:ASPxLabel ID="lblx_noficina0" runat="server" Text="Hasta:" Theme="MetropolisBlue">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td class="auto-style8">
                                                <dx:ASPxLabel ID="lblx_noficina1" runat="server" Text="Segmento" Theme="MetropolisBlue">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td class="auto-style8">
                                                <dx:ASPxLabel ID="lblx_noficina2" runat="server" Text="Tipo Transacción" Theme="MetropolisBlue">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style8">
                                                <dx:ASPxComboBox ID="cbbx_anoini" runat="server" Width="120px" Theme="MetropolisBlue">
                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) {
	                                                    GraficChart.PerformCallback();
                                                    }" />
                                                </dx:ASPxComboBox>
                                            </td>
                                            <td class="auto-style8">

                                                <dx:ASPxComboBox ID="cbbx_anofin" runat="server" Width="120px" Theme="MetropolisBlue">
                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) {
	                                                    GraficChart.PerformCallback();
                                                    }" />
                                                </dx:ASPxComboBox>
                                            </td>
                                            <td class="auto-style8">
                                                <dx:ASPxComboBox ID="cbbx_mesini" runat="server" Width="120px" Theme="MetropolisBlue">
                                                <ClientSideEvents SelectedIndexChanged="function(s, e) {
	                                                    GraficChart.PerformCallback();
                                                    }" />
                                                </dx:ASPxComboBox>
                                            </td>
                                            <td class="auto-style8">
                                                <dx:ASPxComboBox ID="cbbx_mesfin" runat="server" Width="120px" Theme="MetropolisBlue">
                                                <ClientSideEvents SelectedIndexChanged="function(s, e) {
	                                                    GraficChart.PerformCallback();
                                                    }" />
                                                </dx:ASPxComboBox>
                                            </td>
                                            <td class="auto-style8">
                                                <dx:ASPxDropDownEdit ID="dde_segmento" runat="server" ClientInstanceName="checkComboBox" NullText="Seleccione..." Theme="MetropolisBlue" Width="150px">
                                                    <DropDownWindowTemplate>
                                                        <dx:ASPxListBox ID="lstx_segmentos" runat="server" ClientInstanceName="checkListBox" DataSourceID="sds_segmento" Height="300px" SelectionMode="CheckColumn" TextField="NOMBRE" Theme="MetropolisBlue" ValueField="ID" Width="250px">
                                                            <Border BorderStyle="None" />
                                                            <BorderBottom BorderColor="#DCDCDC" BorderStyle="Solid" BorderWidth="1px" />
                                                            <ClientSideEvents SelectedIndexChanged="OnListBoxSelectionChanged" />
                                                        </dx:ASPxListBox>
                                                        <table style="width: 100%">
                                                            <tr>
                                                                <td style="padding: 4px">
                                                                    <dx:ASPxButton ID="ASPxButtonFH0" runat="server" AutoPostBack="False" style="float: right" Text="Aceptar" Theme="MetropolisBlue">
                                                                        <ClientSideEvents Click="function(s, e){ checkComboBox.HideDropDown(); GraficChart.PerformCallback();}" />
                                                                    </dx:ASPxButton>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </DropDownWindowTemplate>
                                                    <ClientSideEvents DropDown="SynchronizeListBoxValues" TextChanged="SynchronizeListBoxValues" />
                                                    <DropDownWindowStyle BackColor="#EDEDED">
                                                    </DropDownWindowStyle>
                                                </dx:ASPxDropDownEdit>
                                            </td>
                                            <td class="auto-style8">
                                                <dx:ASPxDropDownEdit ID="dde_transaccion" runat="server" ClientInstanceName="checkComboBoxGpo" NullText="Seleccione..." Theme="MetropolisBlue" Width="150px">
                                                    <DropDownWindowTemplate>
                                                        <dx:ASPxListBox ID="lstx_transaccion" runat="server" ClientInstanceName="checkListBoxGpo" DataSourceID="sds_transaccion" Height="300px" SelectionMode="CheckColumn" TextField="NOMBRE" Theme="MetropolisBlue" ValueField="ID" Width="250px">
                                                            <Border BorderStyle="None" />
                                                            <BorderBottom BorderColor="#DCDCDC" BorderStyle="Solid" BorderWidth="1px" />
                                                            <ClientSideEvents SelectedIndexChanged="OnListBoxSelectionChangedGpo" />
                                                        </dx:ASPxListBox>
                                                        <table style="width: 100%">
                                                            <tr>
                                                                <td style="padding: 4px">
                                                                    <dx:ASPxButton ID="ASPxButtonGR" runat="server" AutoPostBack="False" style="float: right" Text="Aceptar" Theme="MetropolisBlue">
                                                                        <ClientSideEvents Click="function(s, e){ checkComboBoxGpo.HideDropDown(); GraficChart.PerformCallback();}" />
                                                                    </dx:ASPxButton>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </DropDownWindowTemplate>
                                                    <ClientSideEvents DropDown="SynchronizeListBoxValuesGpo" TextChanged="SynchronizeListBoxValuesGpo" />
                                                    <DropDownWindowStyle BackColor="#EDEDED">
                                                    </DropDownWindowStyle>
                                                </dx:ASPxDropDownEdit>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                    <asp:SqlDataSource ID="sds_segmento" runat="server" ConnectionString="<%$ ConnectionStrings:GESTRAN_RESUMEN %>" SelectCommand="SP_CONSULTA_FILTROS" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="SEGMENTO" Name="FILTRO" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="sds_transaccion" runat="server" ConnectionString="<%$ ConnectionStrings:GESTRAN_RESUMEN %>" SelectCommand="SP_CONSULTA_FILTROS" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="TIPOTX" Name="FILTRO" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxRoundPanel>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxRoundPanel>




            <dx:ASPxRoundPanel ID="rdpx_grid" runat="server" ShowHeader="False" Theme="MetropolisBlue" Width="100%">
                <PanelCollection>
                    <dx:PanelContent runat="server">

                        <div style="text-align: center;">
                            <dx:ASPxCallbackPanel ID="cbpx_grafico" runat="server" Width="200px">

                                <PanelCollection>
<dx:PanelContent runat="server">
    <dxchartsui:WebChartControl ID="wchx_pie" ClientInstanceName="GraficChart" runat="server" CrosshairEnabled="True"  Height="430px" Width="940px">
    </dxchartsui:WebChartControl>
                                    </dx:PanelContent>
</PanelCollection>

                            </dx:ASPxCallbackPanel>
                        </div>

                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxRoundPanel>



        </div>
    </form>
</body>
</html>
