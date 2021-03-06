﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Mantenedor_Funcion_Opcion.aspx.vb" Inherits="Web.Mantenedor_Funcion_Opcion" %>

<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Mantención de Opciones de Funciones" Theme="MetropolisBlue" Width="100%">
        </dx:ASPxRoundPanel>
        <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" ShowHeader="False" Theme="MetropolisBlue" Width="100%">
            <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sds_opciones" EnableTheming="True" KeyFieldName="COD_FUNCION" Theme="MetropolisBlue">
        <Columns>
            <dx:GridViewCommandColumn ShowDeleteButton="True" ButtonType="Image"  ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0"/>
            <dx:GridViewDataTextColumn FieldName="COD_OPCION" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="GLOSA" ShowInCustomizationForm="True" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ABREV" ShowInCustomizationForm="True" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="IND_ACTIVO" ShowInCustomizationForm="True" VisibleIndex="4">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataComboBoxColumn FieldName="COD_FUNCION" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                <PropertiesComboBox DataSourceID="sds_funciones" TextField="GLOSA" ValueField="COD_FUNCION">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
            <SettingsBehavior ConfirmDelete="True" />
            <SettingsPager Mode="ShowAllRecords">
        </SettingsPager>
            <SettingsText ConfirmDelete="Está seguro que desea continuar.?" />
         <SettingsCommandButton>
             <NewButton>
                 <Image ToolTip="Nuevo" Url="../../App_Themes/Default/img/grid/add_black.png"></Image>
             </NewButton>
             <DeleteButton>
                 <Image ToolTip="Eliminar" Url="../../App_Themes/Default/img/grid/cancel_black.png"></Image>
             </DeleteButton>
             <EditButton>
                 <Image ToolTip="Editar" Url="../../App_Themes/Default/img/grid/edit_black.png"></Image>
             </EditButton>
             <UpdateButton>
                 <Image Width="29px" Height="29px" ToolTip="Actualizar" Url="../../App_Themes/Default/img/grid/guardar_black.png"></Image>
             </UpdateButton>
             <CancelButton>
                 <Image Width="24px" Height="24px" ToolTip="Cancelar" Url="../../App_Themes/Default/img/grid/delete_black.png"></Image>
             </CancelButton>
         </SettingsCommandButton>
    </dx:ASPxGridView>
                </dx:PanelContent>
</PanelCollection>
        </dx:ASPxRoundPanel>
    
    </div>
        <asp:SqlDataSource ID="sds_opciones" runat="server" ConnectionString="<%$ ConnectionStrings:GESTRAN_SISTEMA %>" DeleteCommand="DELETE FROM [GS_FUNCION_OPCION] WHERE [COD_FUNCION] = @COD_FUNCION AND [COD_OPCION] = @COD_OPCION" InsertCommand="INSERT INTO [GS_FUNCION_OPCION] ([COD_FUNCION], [COD_OPCION], [GLOSA], [ABREV], [IND_ACTIVO]) VALUES (@COD_FUNCION, @COD_OPCION, @GLOSA, @ABREV, @IND_ACTIVO)" SelectCommand="SELECT [COD_FUNCION], [COD_OPCION], [GLOSA], [ABREV], [IND_ACTIVO] FROM [GS_FUNCION_OPCION]" UpdateCommand="UPDATE [GS_FUNCION_OPCION] SET [GLOSA] = @GLOSA, [ABREV] = @ABREV, [IND_ACTIVO] = @IND_ACTIVO WHERE [COD_FUNCION] = @COD_FUNCION AND [COD_OPCION] = @COD_OPCION">
            <DeleteParameters>
                <asp:Parameter Name="COD_FUNCION" Type="String" />
                <asp:Parameter Name="COD_OPCION" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="COD_FUNCION" Type="String" />
                <asp:Parameter Name="COD_OPCION" Type="String" />
                <asp:Parameter Name="GLOSA" Type="String" />
                <asp:Parameter Name="ABREV" Type="String" />
                <asp:Parameter Name="IND_ACTIVO" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="GLOSA" Type="String" />
                <asp:Parameter Name="ABREV" Type="String" />
                <asp:Parameter Name="IND_ACTIVO" Type="Boolean" />
                <asp:Parameter Name="COD_FUNCION" Type="String" />
                <asp:Parameter Name="COD_OPCION" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sds_funciones" runat="server" ConnectionString="<%$ ConnectionStrings:GESTRAN_SISTEMA %>" SelectCommand="SELECT [COD_FUNCION], [GLOSA] FROM [GS_FUNCION_MENU] ORDER BY [ORDEN]"></asp:SqlDataSource>
    </form>
</body>
</html>
