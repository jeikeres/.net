<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="UsuarioEliminado.aspx.vb" Inherits="Web.UsuarioEliminado" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
        <script type="text/javascript">
            // <![CDATA[
            function ClearSelection() {
                TreeList.SetFocusedNodeKey("");
                UpdateControls(null, "");
            }
            function UpdateSelection() {
                //                var employeeName = "";
                //                var focusedNodeKey = TreeList.GetFocusedNodeKey();
                //                if (focusedNodeKey != "")
                //                    employeeName = TreeList.cpSucursal[focusedNodeKey];
                //                UpdateControls(focusedNodeKey, employeeName);
            }
            function UpdateControls(key, text) {
                checkComboBoxPer.SetText(text);
                checkComboBoxPer.SetKeyValue(key);
                checkComboBoxPer.HideDropDown();
                //                UpdateButtons();
            }
            //            function UpdateButtons() {
            //                clearButton.SetEnabled(checkComboBoxPer.GetText() != "");
            //                selectButton.SetEnabled(TreeList.GetFocusedNodeKey() != "");
            //            }
            function OnDropDown() {
                TreeList.SetFocusedNodeKey(checkComboBoxPer.GetKeyValue());
                TreeList.MakeNodeVisible(TreeList.GetFocusedNodeKey());
            }
            // ]]> 
        </script>
    <script src="../../App_Themes/Default/js/ddex.js"></script>
     <link href="../../App_Themes/Default/css/StyleSheet.css" rel="Stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1
        {
            width: 894px;
        }
        .auto-style3
        {
            width: 254px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    

    

<dx:ASPxRoundPanel ID="rdpx_header" runat="server" HeaderText="ADMINISTRACIÓN - Informe de Usuarios Eliminados" Theme="MetropolisBlue" Width="100%">
            <PanelCollection>
<dx:PanelContent runat="server">
                </dx:PanelContent>
</PanelCollection>
</dx:ASPxRoundPanel>




<dx:ASPxRoundPanel ID="rdpx_grid" runat="server" ShowHeader="False" Theme="MetropolisBlue" Width="100%">
            <PanelCollection>
<dx:PanelContent runat="server">
    <table style="width: 100%;">
        <tr>
            <td>
                <table style="width:100%;">
                    <tr>
                        <td style="width:25%">
                            &nbsp;</td>
                        <td>&nbsp;</td>
                        <td style="width:25%">
                            &nbsp;</td>
                        <td>
                            &nbsp;
                        </td>
                        <td class="auto-style3">&nbsp;</td>
                        <td class="auto-style1">&nbsp;</td>
                        <td>
                            <dx:ASPxButton ID="btnx_expxls" runat="server" Text="Excel" Theme="MetropolisBlue" Visible="False" Width="90px">
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
                <dx:ASPxGridView ID="gv_datos" runat="server" Theme="Aqua" Width="100%" EnableTheming="True" AutoGenerateColumns="False" DataSourceID="sds_datos">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="COD ELIMINADOR" ShowInCustomizationForm="True" VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="NOMBRE ELIMINADOR" ShowInCustomizationForm="True" VisibleIndex="1" ReadOnly="True">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="FECHA ELIMINADOR" ShowInCustomizationForm="True" VisibleIndex="2">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="IP ELIMINADOR" ShowInCustomizationForm="True" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ELIMINADO" ShowInCustomizationForm="True" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="NOMBRES" ShowInCustomizationForm="True" VisibleIndex="5">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="APELLIDOS" ShowInCustomizationForm="True" VisibleIndex="6">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PERFILES" ShowInCustomizationForm="True" VisibleIndex="7">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="TIPO IDENTIFICACION" ShowInCustomizationForm="True" VisibleIndex="8">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CARGO" ShowInCustomizationForm="True" VisibleIndex="9">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="DEPENDENCIA" ShowInCustomizationForm="True" VisibleIndex="10">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="FECHA INGRESO" ShowInCustomizationForm="True" VisibleIndex="11">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="CORREO" ShowInCustomizationForm="True" VisibleIndex="12">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:ASPxGridView>
            </td>
        </tr>
    </table>

                </dx:PanelContent>
</PanelCollection>
        </dx:ASPxRoundPanel>



    </div>
    &nbsp;&nbsp;&nbsp;

     <asp:sqldatasource ID="SqlDataFiltrosPerfil" runat="server"  ConnectionString="<%$ ConnectionStrings:GESTRAN_SISTEMA %>" SelectCommandType="Text" SelectCommand="SELECT '0' CODIGO, 'TODOS' GLOSA UNION ALL SELECT [COD_PERFIL] CODIGO, [GLOSA] FROM [GS_PERFIL]"> 
     </asp:sqldatasource>

     <asp:sqldatasource ID="sds_datos" runat="server"  ConnectionString="<%$ ConnectionStrings:GESTRAN_SISTEMA %>" SelectCommandType="StoredProcedure" SelectCommand="GS_SP_INF_USUARIOS_ELIM">
     </asp:sqldatasource>

        <dx:ASPxGridViewExporter ID="gvex_datos" runat="server" GridViewID="gv_datos">
        </dx:ASPxGridViewExporter>

    </form>
</body>
</html>
