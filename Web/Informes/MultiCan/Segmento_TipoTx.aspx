<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Segmento_TipoTx.aspx.vb" Inherits="Web.Segmento_TipoTx" %>

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
    <script src="../../App_Themes/Default/js/ddex.js"></script>
    <style type="text/css">
        .auto-style1
        {
        }
        .auto-style2
        {
            width: 140px;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
    <div>
    

    

<dx:ASPxRoundPanel ID="rdpx_header" runat="server" HeaderText="MULTICANAL - Segmento y Tipo Transacción" ShowCollapseButton="true" Theme="MetropolisBlue" Width="100%">
            <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxRoundPanel ID="rdpx_prefiltros" runat="server" HeaderText="Pre-Filtros" ShowCollapseButton="True" Theme="MetropolisBlue" View="GroupBox" Width="100%">
        <PanelCollection>
            <dx:PanelContent runat="server">
               <table style="width: 100%;">
                                        <tr>
                                            <td class="auto-style1" colspan="2">
                                                <div style="text-align:center;">

                                                    <dx:ASPxLabel ID="lblx_ano" runat="server" Text="AÑO" Theme="MetropolisBlue">
                                                </dx:ASPxLabel>

                                                </div>
                                            </td>
                                            <td class="auto-style1" colspan="2">
                                                <div style="text-align:center;">

                                                    <dx:ASPxLabel ID="lblx_mes" runat="server" Text="MES" Theme="MetropolisBlue">
                                                </dx:ASPxLabel>

                                                </div>                                            
                                            </td>
                                            <td class="auto-style1">
                                                &nbsp;</td>
                                            <td class="auto-style8">
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style2">
                                                <dx:ASPxLabel ID="lblx_nperiodo" runat="server" Text="Desde:" Theme="MetropolisBlue">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td class="auto-style2">
                                                <dx:ASPxLabel ID="lblx_nperiodo0" runat="server" Text="Hasta:" Theme="MetropolisBlue">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td class="auto-style2">
                                                <dx:ASPxLabel ID="lblx_noficina" runat="server" Text="Desde:" Theme="MetropolisBlue">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td class="auto-style2">
                                                <dx:ASPxLabel ID="lblx_noficina0" runat="server" Text="Hasta:" Theme="MetropolisBlue">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td class="auto-style2">
                                                <dx:ASPxLabel ID="lblx_noficina1" runat="server" Text="Segmento" Theme="MetropolisBlue">
                                                </dx:ASPxLabel>
                                            </td>
                                            <td class="auto-style8">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style2">
                                                <dx:ASPxComboBox ID="cbbx_anoini" runat="server" Width="120px" Theme="MetropolisBlue">
                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) {
	                                                    GraficChart.PerformCallback();
                                                    }" />
                                                </dx:ASPxComboBox>
                                            </td>
                                            <td class="auto-style1">

                                                <dx:ASPxComboBox ID="cbbx_anofin" runat="server" Width="120px" Theme="MetropolisBlue">
                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) {
	                                                    GraficChart.PerformCallback();
                                                    }" />
                                                </dx:ASPxComboBox>
                                            </td>
                                            <td class="auto-style1">
                                                <dx:ASPxComboBox ID="cbbx_mesini" runat="server" Width="120px" Theme="MetropolisBlue">
                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) {
	                                                    GraficChart.PerformCallback();
                                                    }" />
                                                </dx:ASPxComboBox>
                                            </td>
                                            <td class="auto-style1">
                                                <dx:ASPxComboBox ID="cbbx_mesfin" runat="server" Width="120px" Theme="MetropolisBlue">
                                                <ClientSideEvents SelectedIndexChanged="function(s, e) {
	                                                    GraficChart.PerformCallback();
                                                    }" />
                                                </dx:ASPxComboBox>
                                            </td>
                                            <td class="auto-style1">
                                                <dx:ASPxDropDownEdit ID="dde_segmento" runat="server" ClientInstanceName="checkComboBox" NullText="Seleccione Segmento..." Theme="MetropolisBlue" Width="150px">
                                                    <DropDownWindowTemplate>
                                                        <dx:ASPxListBox ID="lstx_segmentos" runat="server" ClientInstanceName="checkListBox" DataSourceID="sds_segmento" Height="300px" 
                                                            SelectionMode="CheckColumn" TextField="NOMBRE" Theme="MetropolisBlue" 
                                                            ValueField="ID" Width="250px">
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
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
        <asp:SqlDataSource ID="sds_segmento" runat="server" ConnectionString="<%$ ConnectionStrings:GESTRAN_RESUMEN %>" SelectCommand="SP_CONSULTA_FILTROS" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="SEGMENTO" Name="FILTRO" Type="String" />
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
    
    <div style="text-align:center;">
    <dxchartsui:WebChartControl ID="wchx_barras" runat="server" ClientInstanceName="GraficChart" CrosshairEnabled="True" Height="429px" Width="940px">
        <emptycharttext text=" " />
        <smallcharttext text=" " />
        <diagramserializable>
            <cc1:XYDiagram3D PerspectiveAngle="20" PlaneDepthFixed="5" RotationAngleX="0" RotationAngleY="0" RotationOrder="XYZ" RotationType="UseAngles" SeriesDistance="0" SeriesIndentFixed="1" ZoomPercent="200">
                <axisx>
                    <numericscaleoptions aggregatefunction="Sum" scalemode="Automatic" />
                </axisx>
                <fillstyle fillmode="Solid">
                </fillstyle>
            </cc1:XYDiagram3D>
        </diagramserializable>
        <legend alignmenthorizontal="Right" maxverticalpercentage="50"></legend>
        <seriesserializable>
            <cc1:Series Name="Series 1">
                <viewserializable>
                    <cc1:SideBySideBar3DSeriesView>
                    </cc1:SideBySideBar3DSeriesView>
                </viewserializable>
            </cc1:Series>
            <cc1:Series Name="Series 2">
                <viewserializable>
                    <cc1:SideBySideBar3DSeriesView>
                    </cc1:SideBySideBar3DSeriesView>
                </viewserializable>
            </cc1:Series>
        </seriesserializable>
        <seriestemplate>
            <viewserializable>
                <cc1:SideBySideBar3DSeriesView>
                </cc1:SideBySideBar3DSeriesView>
            </viewserializable>
        </seriestemplate>
    </dxchartsui:WebChartControl>

    </div>

                </dx:PanelContent>
</PanelCollection>
        </dx:ASPxRoundPanel>



    </div>
    </form>
</body>
</html>
