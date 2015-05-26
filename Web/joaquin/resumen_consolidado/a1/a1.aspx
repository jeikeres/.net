<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="a1.aspx.vb" Inherits="Web.a1" %>

<%@ Register assembly="DevExpress.XtraCharts.v14.2.Web, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1></h1>
        <dxchartsui:WebChartControl ID="WebChartControl1" runat="server" CrosshairEnabled="True" DataSourceID="SqlDataSource1" Height="435px" Width="1045px">
            <diagramserializable>
                <cc1:SimpleDiagram EqualPieSize="False">
                </cc1:SimpleDiagram>
            </diagramserializable>
            <seriesserializable>
                <cc1:Series ArgumentDataMember="Nombre" ArgumentScaleType="Qualitative" Name="Series 1" ValueDataMembersSerializable="cantidad">
                    <viewserializable>
                        <cc1:PieSeriesView>
                        </cc1:PieSeriesView>
                    </viewserializable>
                    <labelserializable>
                        <cc1:PieSeriesLabel TextPattern="{A}
{V:#.#}
{VP:0.00%}
">
                        </cc1:PieSeriesLabel>
                    </labelserializable>
                </cc1:Series>
            </seriesserializable>
            <seriestemplate>
                <viewserializable>
                    <cc1:PieSeriesView>
                    </cc1:PieSeriesView>
                </viewserializable>
            </seriestemplate>
            <titles>
                <cc1:ChartTitle Text="STOCK DE GARANTÍAS" />
            </titles>
        </dxchartsui:WebChartControl>
&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GARANTIA_DICIEMBRE2014ConnectionString %>" SelectCommand="total" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
