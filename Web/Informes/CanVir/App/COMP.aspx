<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="COMP.aspx.vb" Inherits="Web.COMP_APP" %>

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
    <script src="../../../App_Themes/Default/js/ddex.js"></script>
     <link href="../../../App_Themes/Default/css/StyleSheet.css" rel="Stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1
        {
            width: 894px;
            height: 33px;
        }
        .auto-style3
        {
            width: 254px;
            height: 33px;
        }
        .auto-style4
        {
            width: 25%;
            height: 33px;
        }
        .auto-style5
        {
            height: 33px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    

    

<dx:ASPxRoundPanel ID="rdpx_header" runat="server" HeaderText="APP - Composición" ShowCollapseButton="true" Theme="MetropolisBlue" Width="100%">
            <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxRoundPanel ID="rdpx_filtros" runat="server" HeaderText="Filtros" ShowCollapseButton="True" Theme="MetropolisBlue" View="GroupBox" Width="100%">
        <PanelCollection>
            <dx:PanelContent runat="server">
                <table style="width:100%;">
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <dx:ASPxLabel runat="server" Text="Periodo" Theme="MetropolisBlue" ID="lblx_periodo" Width="60px"></dx:ASPxLabel>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>&nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                             <dx:ASPxComboBox ID="cb_periodo" 
                                        runat="server" 
                                        CssClass="Textos_Top_Banner" 
                                        ForeColor="#000000" 
                                        Width="150px" 
                                        Theme="MetropolisBlue"
                                        NullText="Seleccione Período">
                            <ClientSideEvents SelectedIndexChanged="function(s, e) {banner_tab.PerformCallback();}" />
                        </dx:ASPxComboBox> 
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>
                            &nbsp;</td>
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
                        <td class="auto-style4">
                            </td>
                        <td class="auto-style5"></td>
                        <td class="auto-style4">
                            </td>
                        <td class="auto-style5">
                            </td>
                        <td class="auto-style3"></td>
                        <td class="auto-style1"></td>
                        <td class="auto-style5">
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
  <dx:ASPxCallbackPanel ID="cbpx_panel" 
                                                        runat="server" 
                                                        ClientInstanceName="banner_tab" 
                                                        Theme="Default">
                                                <PanelCollection>
                                                    <dx:PanelContent ID="PanelContenta" runat="server">

                                                <table cellpadding="0" cellspacing="4" width="100%">
                                                    <tr>
                                                        <td align="left" style=" width:49%;" valign="top">
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td align="right" valign="top">
                                                                                    <dxchartsui:WebChartControl ID="_Tab1_WebChar1" runat="server" 
                                                                                        CrosshairEnabled="True" Height="400px" SideBySideEqualBarWidth="True" 
                                                                                        Width="470px">
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
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                        </td>
                                                        <td style=" width:2%;">
                                                        &nbsp;
                                                        </td>
                                                        <td align="left" style=" width:49%;" valign="top">
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td align="left" valign="top">
                                                                                    <dxchartsui:WebChartControl ID="_Tab1_WebChar2" 
                                                                                                                runat="server" 
                                                                                                                CrosshairEnabled="True" 
                                                                                                                Height="400px" 
                                                                                                                SideBySideEqualBarWidth="True" 
                                                                                                                Width="470px">
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
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>

                                                        </dx:PanelContent>
                                                        </PanelCollection>
                                                        </dx:ASPxCallbackPanel>
            </td>
        </tr>
    </table>

                </dx:PanelContent>
</PanelCollection>
        </dx:ASPxRoundPanel>



    </div>
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
