<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="a2.aspx.vb" Inherits="Web.a1_1" %><%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

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
        <h1>Stock de Garantías</h1>
        <h2>
        </h2>
        <dxchartsui:WebChartControl ID="WebChartControl1" runat="server" style="margin:auto;" CrosshairEnabled="True" DataSourceID="SqlDataSource2" Height="373px" Width="915px">
            <diagramserializable>
                <cc1:SimpleDiagram EqualPieSize="False">
                </cc1:SimpleDiagram>
            </diagramserializable>
            <seriesserializable>
                <cc1:Series ArgumentDataMember="nombre tipo" ArgumentScaleType="Qualitative" Name="Series 1" ValueDataMembersSerializable="Promedio UF x Grtia">
                    <viewserializable>
                        <cc1:PieSeriesView>
                        </cc1:PieSeriesView>
                    </viewserializable>
                    <labelserializable>
                        <cc1:PieSeriesLabel TextPattern="{A}
{V}
{VP:0%}">
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
                <cc1:ChartTitle Text="STOCK DE GARANTÍAS
(Valor de Garantías)" />
            </titles>
        </dxchartsui:WebChartControl>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RESUMENESConnection250 %>" SelectCommand="promedios_grafico" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <h2><dx:ASPxGridView ID="ASPxGridView1" style="margin:auto" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Theme="Metropolis">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="nombre tipo" ReadOnly="True" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Promedio $ x Grtia" ReadOnly="True" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Promedio UF x Grtia" ReadOnly="True" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
            </Columns>
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RESUMENESConnection250 %>" SelectCommand="promedios" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        </h2>
        <p>&nbsp;</p>

    </div>
    </form>
</body>
</html>
