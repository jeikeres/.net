<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Mantenedor_Asignacion_Opciones.aspx.vb" Inherits="Web.Mantenedor_Asignacion_Opciones" %>

<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    <style type="text/css">
        .auto-style4
        {
            width: 166px;
            height: 27px;
        }
        .auto-style5
        {
            width: 202px;
            height: 27px;
        }
        .auto-style6
        {
            height: 27px;
        }
        .auto-style8
        {
            width: 166px;
        }
        .auto-style9
        {
            width: 202px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div>

        <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" HeaderText="Mantención de Asignación de Perfiles" Theme="MetropolisBlue" Width="100%">
            <PanelCollection>
                    <dx:PanelContent ID="PanelContent1" runat="server">
                <table style="width: 100%;">
                    <tr>
                        <td class="auto-style8">
                            <dx:ASPxLabel ID="lblx_perfil" runat="server" Text="Seleccione Perfil">
                            </dx:ASPxLabel>
                        </td>
                        <td class="auto-style9">
                            <dx:ASPxComboBox ID="cbbx_perfil" runat="server" DataSourceID="sds_perfil" AutoPostBack="True" TextField="GLOSA" ValueField="COD_PERFIL">
                            </dx:ASPxComboBox>
                            <asp:SqlDataSource ID="sds_perfil" runat="server" ConnectionString="<%$ ConnectionStrings:GESTRAN_SISTEMA %>" SelectCommand="SELECT [COD_PERFIL], [GLOSA], [ABREV], [IND_ACTIVO] FROM [GS_PERFIL]">
                            </asp:SqlDataSource>
                        </td>
                        <td>
                            &nbsp;
                            <dx:ASPxButton ID="btnx_guardar" runat="server" Text="Guardar Asignación" Theme="MetropolisBlue" Enabled="False">
                            </dx:ASPxButton>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">
                            &nbsp;</td>
                        <td class="auto-style5">
                            &nbsp;</td>
                        <td class="auto-style6">

                            &nbsp;</td>
                    </tr>
                </table>
                        </dx:PanelContent>
    </PanelCollection>
        </dx:ASPxRoundPanel>
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="" Theme="MetropolisBlue" Width="100%" ShowHeader="False">
            <PanelCollection>
    <dx:PanelContent runat="server">
    <br />
    <dx:ASPxGridView ID="gdvx_perfil" runat="server" EnableTheming="True" Theme="MetropolisBlue" EnableCallBacks="False">
        <SettingsPager Mode="ShowAllRecords">
        </SettingsPager>
    </dx:ASPxGridView>
    
                </dx:PanelContent>
    </PanelCollection>
        </dx:ASPxRoundPanel>


    </div>
    </form>
</body>
</html>
