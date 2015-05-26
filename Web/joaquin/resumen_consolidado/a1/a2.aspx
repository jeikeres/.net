<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="a2.aspx.vb" Inherits="Web.a1_1" %><%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

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
        <h2>(Valor de Garantía)<dx:ASPxGridView ID="ASPxGridView1" style="margin:auto" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Theme="Metropolis">
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
