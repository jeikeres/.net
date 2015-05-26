<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm1.aspx.vb" Inherits="Web.WebForm1" %>
<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dxwpg" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
	<form id="form1" runat="server">
	<div>

	    <table style="width:100%;">
            <tr>
                <td>
	<dxwpg:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" 
		DataSourceID="SqlDataSource1" Width=100% 
		oncustomfieldvaluecells="ASPxPivotGrid1_CustomFieldValueCells" ClientIDMode="AutoID">
		<Fields>
			<dxwpg:PivotGridField ID="fieldMES" Area="RowArea" AreaIndex="0" 
				FieldName="MES" >
			</dxwpg:PivotGridField>
			<dxwpg:PivotGridField ID="fieldQTRANS" Area="DataArea" AreaIndex="0" 
				FieldName="QTRANS" >
			</dxwpg:PivotGridField>
			<dxwpg:PivotGridField ID="fieldGLOSAGRUPO" Area="ColumnArea" AreaIndex="0" 
				FieldName="GLOSA_GRUPO" >
			</dxwpg:PivotGridField>            
			<dxwpg:PivotGridField ID="fieldHORARIO" Area="ColumnArea" AreaIndex="1" 
				FieldName="HORARIO">
			</dxwpg:PivotGridField>
		</Fields>
		<OptionsView DataHeadersDisplayMode="Popup" DataHeadersPopupMinCount="3" ShowHorizontalScrollBar="true" ShowColumnGrandTotalHeader="False" ShowColumnHeaders="False" ShowColumnTotals="False" ShowDataHeaders="False" ShowFilterHeaders="False" ShowFilterSeparatorBar="False" ShowGrandTotalsForSingleValues="True" ShowRowGrandTotalHeader="False" ShowRowGrandTotals="False" ShowTotalsForSingleValues="True"  />
	    <OptionsPager RowsPerPage="15">
        </OptionsPager>
	</dxwpg:ASPxPivotGrid>
	            </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
	<dxwpg:ASPxPivotGrid ID="ASPxPivotGrid2" runat="server" 
		DataSourceID="SqlDataSource2" Width=100% 
		oncustomfieldvaluecells="ASPxPivotGrid1_CustomFieldValueCells" ClientIDMode="AutoID">
		<Fields>
			<dxwpg:PivotGridField ID="fieldMES0" Area="RowArea" AreaIndex="0" 
				FieldName="MES fin de semana" >
			</dxwpg:PivotGridField>
			<dxwpg:PivotGridField ID="fieldQTRANS0" Area="DataArea" AreaIndex="0" 
				FieldName="QTRANS" >
			</dxwpg:PivotGridField>
			<dxwpg:PivotGridField ID="fieldGLOSAGRUPO0" Area="ColumnArea" AreaIndex="0" 
				FieldName="GLOSA_GRUPO" >
			</dxwpg:PivotGridField>            
			<dxwpg:PivotGridField ID="fieldHORARIO0" Area="ColumnArea" AreaIndex="1" 
				FieldName="HORARIO">
			</dxwpg:PivotGridField>
		</Fields>
		<OptionsView DataHeadersDisplayMode="Popup" DataHeadersPopupMinCount="3" ShowHorizontalScrollBar="true" ShowColumnGrandTotalHeader="False" ShowColumnHeaders="False" ShowColumnTotals="False" ShowDataHeaders="False" ShowFilterHeaders="False" ShowFilterSeparatorBar="False" ShowGrandTotalsForSingleValues="True" ShowRowGrandTotalHeader="False" ShowRowGrandTotals="False" ShowTotalsForSingleValues="True"  />
	   <OptionsPager RowsPerPage="15">
        </OptionsPager>
	</dxwpg:ASPxPivotGrid>
	            </td>
            </tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:infopanelConnectionString %>" SelectCommand="SIS_WEB_OFICINAS_GRUPOTX" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="TX_OFC_HNA" Name="OPC" Type="String" />
                            <asp:Parameter DefaultValue="2013" Name="AÑO" Type="String" />
                            <asp:Parameter DefaultValue="843" Name="NUM_OFICINA" Type="Int16" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:infopanelConnectionString %>" SelectCommand="SIS_WEB_OFICINAS_GRUPOTX" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="TX_OFC_FSF" Name="OPC" Type="String" />
                            <asp:Parameter DefaultValue="2013" Name="AÑO" Type="String" />
                            <asp:Parameter DefaultValue="843" Name="NUM_OFICINA" Type="Int16" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>

	</div>
	</form>
</body>
</html>