<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="UsuarioPerfil.aspx.vb" Inherits="Web.UsuarioPerfil" %>

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
        .auto-style4
        {
            width: 4px;
        }
        .auto-style5
        {
            width: 528px;
        }
        .auto-style6
        {
            width: 109px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    

    

<dx:ASPxRoundPanel ID="rdpx_header" runat="server" HeaderText="ADMINISTRACIÓN - Informe de Usuarios por Perfil" ShowCollapseButton="true" Theme="MetropolisBlue" Width="100%">
            <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxRoundPanel ID="rdpx_prefiltros" runat="server" HeaderText="Pre-Filtros" ShowCollapseButton="True" Theme="MetropolisBlue" View="GroupBox" Width="100%">
        <PanelCollection>
            <dx:PanelContent runat="server">
                <table style="width:100%;">
                    <tr>
                        <td class="auto-style4">
                            &nbsp;</td>
                        <td>
                            <dx:ASPxLabel ID="lblx_nfranja" runat="server" Text="Perfiles de Usuario" Theme="MetropolisBlue">
                            </dx:ASPxLabel>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td class="auto-style6">
                            &nbsp;</td>
                        <td class="auto-style5">&nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style4">
                        </td>
                        <td>
                            
                        <dx:ASPxDropDownEdit ID="dde_perfil" ClientInstanceName="checkComboBox" runat="server" Width="150px" Theme="MetropolisBlue" NullText="Seleccione Perfil...">
                            <DropDownWindowStyle BackColor="#EDEDED" />
                                <DropDownWindowTemplate>
                                    <dx:ASPxListBox Width="250px" Height="300px" DataSourceID="SqlDataFiltrosPerfil" ValueField = "CODIGO" TextField = "GLOSA"
                                                    ID="lstx_perfil" Theme="MetropolisBlue" ClientInstanceName="checkListBox" SelectionMode="CheckColumn" runat="server">
                                        <Border BorderStyle="None" />
                                        <BorderBottom BorderStyle="Solid" BorderWidth="1px" BorderColor="#DCDCDC" />
                                        <ClientSideEvents SelectedIndexChanged="OnListBoxSelectionChanged" />
                                    </dx:ASPxListBox>
                                    <table style="width: 100%">
                                    <tr>
                                        <td style="padding: 4px">
                                            <dx:ASPxButton ID="ASPxButtonFH" Theme="MetropolisBlue" AutoPostBack="False" runat="server" Text="Aceptar" style="float: right">
                                                <ClientSideEvents Click="function(s, e){ checkComboBox.HideDropDown(); }" />
                                            </dx:ASPxButton>
                                        </td>
                                    </tr>
                                    </table>
                            </DropDownWindowTemplate>   
                            <ClientSideEvents TextChanged="SynchronizeListBoxValues" DropDown="SynchronizeListBoxValues" />  
                        </dx:ASPxDropDownEdit>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td class="auto-style6">&nbsp;</td>
                        <td class="auto-style5">&nbsp;</td>
                        <td>
                            <dx:ASPxButton ID="btnx_filtrar" runat="server" Text="Aplicar Pre-Filtros" Theme="MetropolisBlue" Width="140px">
                            </dx:ASPxButton>
                        </td>
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
                <dx:ASPxGridView ID="gv_datos" runat="server" Theme="Aqua" Width="100%" EnableTheming="True" AutoGenerateColumns="False" DataSourceID="sds_datos" KeyFieldName="COD_USUARIO">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="COD_USUARIO" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="NOMBRES" ShowInCustomizationForm="True" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="APELLIDOS" ShowInCustomizationForm="True" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PERFILES" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="TIPO IDENTIFICACION" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="IDENTIFICACION" ShowInCustomizationForm="True" VisibleIndex="5">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CARGO" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="6">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="DEPENDENCIA" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="7">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="FECHA INGRESO" ShowInCustomizationForm="True" VisibleIndex="8">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="CORREO" ShowInCustomizationForm="True" VisibleIndex="9">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataCheckColumn FieldName="IND VIGENCIA" ShowInCustomizationForm="True" VisibleIndex="10">
                        </dx:GridViewDataCheckColumn>
                        <dx:GridViewDataCheckColumn FieldName="IND BLOQUEO" ShowInCustomizationForm="True" VisibleIndex="11">
                        </dx:GridViewDataCheckColumn>
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

     <asp:sqldatasource ID="sds_datos" runat="server"  ConnectionString="<%$ ConnectionStrings:GESTRAN_SISTEMA %>" SelectCommandType="StoredProcedure" SelectCommand="GS_SP_INF_USR_PERFIL">
         <SelectParameters>
             <asp:SessionParameter DefaultValue="|-|" Name="PERFIL" SessionField="COD_PERFIL_INF" Type="String" />
         </SelectParameters>
     </asp:sqldatasource>

        <dx:ASPxGridViewExporter ID="gvex_datos" runat="server" GridViewID="gv_datos">
        </dx:ASPxGridViewExporter>

        <dx:ASPxPopupControl 
    ID="ASPxPopupControl2" 
    runat="server" 
    RenderMode="Lightweight" 
    HeaderText="Mensaje de Sistema" 
    Modal="True" 
    ShowCloseButton="false"
    CloseAction="OuterMouseClick"
    Width="300px" 
    PopupHorizontalAlign="WindowCenter" 
    PopupVerticalAlign="WindowCenter" 
    PopupAnimationType="Auto"
    Border-BorderStyle="Outset" 
    BackColor="White"
    ClientInstanceName="Msge_Error" 
    Font-Bold="True" 
    Font-Names="Arial,Helvetica,sans-serif;" 
    Font-Size="Medium" 
    ForeColor="White"
    ShowShadow="true" >
    <HeaderStyle BackColor="Red" HorizontalAlign="Left" ForeColor="White"></HeaderStyle>
                      
            <ContentCollection>
            <dx:PopupControlContentControl 
                            ID="PopupControlContentControl12" 
                            runat="server" 
                            SupportsDisabledAttribute="True">
                                <table border="0" cellpadding="0" cellspacing="0" style=" width:100%; height:100%">
                                <tr>
                                    <td>
                                    <table border="0" cellpadding="0" cellspacing="0" style=" width:100%; height:100%">
            <tr>
                <td>
                    <div class="popup_error">
                                                                                            
                    </div>
                </td>
                <td>&nbsp;&nbsp;</td>
                <td style=" width:100%; vertical-align: top; text-align:left;"> 
                        <table border="0" cellpadding="0" cellspacing="0" style=" width:100%; height:100%">
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="lblx_mensaje_titulo" runat="server" Font-Bold="True" ForeColor="Black" Text="Alerta:" Theme="MetropolisBlue">
                                </dx:ASPxLabel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="lblx_mensaje_error" runat="server" Theme="MetropolisBlue" ForeColor="Black">
                                </dx:ASPxLabel>
                            </td>
                        </tr>
                                                                                                
                        </table>
                </td>
            </tr>
        </table>
                    </td>
                    </tr>
                    <tr>
                    <td style=" height:5px; width:100%;"></td>
                    </tr>
                    <tr>
                    <td class="_index_login_error_td" style=" height:5px; width:100%;"></td>
                    </tr>
                    <tr>
                        <td align="center" valign="top" style=" width:100%;" >
            <dx:ASPxButton ID="ASPxButton3" runat="server" Text="OK" Width="80px" AutoPostBack="false" Theme="MetropolisBlue">
            <ClientSideEvents Click="function(s, e) 
                                                {
	                                            Msge_Error.Hide();
                                                }" />
                    </dx:ASPxButton>
                    </td>
                    </tr>

                </table>
                </dx:PopupControlContentControl>
            </ContentCollection>

            <Border BorderStyle="Solid" BorderColor="Red"></Border>
        </dx:ASPxPopupControl>
    </form>
</body>
</html>
