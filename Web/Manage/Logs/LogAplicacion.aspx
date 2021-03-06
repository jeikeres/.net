﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="LogAplicacion.aspx.vb" Inherits="Web.LogAplicacion" %>

<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Theme="MetropolisBlue" 
            Width="100%" HeaderText="Consulta Log de Aplicación">
            <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxButton ID="btn_Exportar" runat="server" Text="Excel" 
        Theme="MetropolisBlue">
        <Image Url="~/App_Themes/Img/save.png">
        </Image>
    </dx:ASPxButton>
    <br />
    <br />
    <dx:ASPxGridView ID="gdvx_LogAplicacion" runat="server" 
        AutoGenerateColumns="False" EnableTheming="True" Theme="MetropolisBlue" 
        Width="100%">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="Tipo Proceso" 
                ShowInCustomizationForm="True" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Módulo" ShowInCustomizationForm="True" 
                VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Función" ShowInCustomizationForm="True" 
                VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Proceso" ShowInCustomizationForm="True" 
                VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Fecha" ShowInCustomizationForm="True" 
                VisibleIndex="4" UnboundType="DateTime">
            </dx:GridViewDataTextColumn>
        </Columns>
        <Settings ShowGroupPanel="True" />
        <Styles>
            <AlternatingRow BackColor="#CCFFFF">
            </AlternatingRow>
        </Styles>
    </dx:ASPxGridView>
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" 
        GridViewID="gdvx_LogAplicacion">
    </dx:ASPxGridViewExporter>
                </dx:PanelContent>
</PanelCollection>
        </dx:ASPxRoundPanel>
    
    </div>
    </form>
</body>
</html>
