<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Composicion_Segmento_TipoTx.aspx.vb" Inherits="Web.Composicion_Segmento_TipoTx" %>

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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxRoundPanel ID="rdpx_header" runat="server" HeaderText="MULTICANAL - Composición por Segmento y Tipo Transacción" ShowCollapseButton="true" Theme="MetropolisBlue" Width="100%">
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <dx:ASPxRoundPanel ID="rdpx_prefiltros" runat="server" HeaderText="Pre-Filtros" ShowCollapseButton="True" Theme="MetropolisBlue" View="GroupBox" Width="100%">
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td class="auto-style" colspan="2">
                                                <div style="text-align:center;">
                                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="AÑO" Theme="MetropolisBlue">
                                                    </dx:ASPxLabel>
                                                </div>
                                            </td>
                                            <td class="auto-style" colspan="2">
                                                <div style="text-align:center;">

                                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="MES" Theme="MetropolisBlue">
                                                    </dx:ASPxLabel>

                                                </div>                                            
                                            </td>
                                            <td class="auto-style">
                                                &nbsp;</td>
                                            <td class="auto-style">
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
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
                                                <dx:ASPxLabel ID="lblx_noficina0" runat="server" Text="Hasta" Theme="MetropolisBlue">
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
                                                <dx:ASPxRadioButtonList ID="rdbx_valor" runat="server" AutoPostBack="False" SelectedIndex="0" Theme="MetropolisBlue">
                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) {
	GraficChart.PerformCallback();
                                                
}" />
                                                    <Items>
                                                        <dx:ListEditItem Selected="True" Text="TX" Value="Cantidad" />
                                                        <dx:ListEditItem Text="Monto" Value="Valor" />
                                                    </Items>
                                                </dx:ASPxRadioButtonList>
                                            </td>
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
    <dxchartsui:WebChartControl ID="wchx_pie" runat="server" ClientInstanceName="GraficChart" CrosshairEnabled="True" Height="429px" Width="940px" AppearanceNameSerializable="Light" SideBySideEqualBarWidth="True" PaletteName="Concourse">
        <FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

<SeriesTemplate><ViewSerializable>
<cc1:SideBySideBarSeriesView></cc1:SideBySideBarSeriesView>
</ViewSerializable>
<LabelSerializable>
<cc1:SideBySideBarSeriesLabel LineVisible="True">
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>
<PointOptionsSerializable>
<cc1:PointOptions></cc1:PointOptions>
</PointOptionsSerializable>
</cc1:SideBySideBarSeriesLabel>
</LabelSerializable>
<LegendPointOptionsSerializable>
<cc1:PointOptions></cc1:PointOptions>
</LegendPointOptionsSerializable>
</SeriesTemplate>

<CrosshairOptions><CommonLabelPositionSerializable>
<cc1:CrosshairMousePosition></cc1:CrosshairMousePosition>
</CommonLabelPositionSerializable>
</CrosshairOptions>

<ToolTipOptions><ToolTipPositionSerializable>
<cc1:ToolTipMousePosition></cc1:ToolTipMousePosition>
</ToolTipPositionSerializable>
</ToolTipOptions>
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
