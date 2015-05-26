<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Mantenedor_Configuraciones_seguridad.aspx.vb" Inherits="Web.Mantenedor_Configuraciones_seguridad" %>

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
    
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Configuraciones de Seguridad" Theme="MetropolisBlue" Width="100%">
            <PanelCollection>
<dx:PanelContent runat="server"></dx:PanelContent>
</PanelCollection>
        </dx:ASPxRoundPanel>
        <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" ShowHeader="False" Theme="MetropolisBlue" Width="100%">
            <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sds_config" EnableTheming="True" KeyFieldName="CODIGO" Theme="MetropolisBlue">
        <Columns>
            <dx:GridViewCommandColumn ShowDeleteButton="True" ButtonType="Image" ShowEditButton="True" ShowInCustomizationForm="True" ShowNewButtonInHeader="True" VisibleIndex="0" ShowClearFilterButton="True"/>
            <dx:GridViewDataTextColumn FieldName="COD_TABLA" ReadOnly="true" ShowInCustomizationForm="True" VisibleIndex="0">
                <EditFormSettings Caption="(*) Código Tabla" />
                <EditFormCaptionStyle Font-Bold="true"></EditFormCaptionStyle>
                <PropertiesTextEdit>
                    <ClientSideEvents Init="function(s,e){s.Validate();}" />
                    <ValidationSettings ErrorDisplayMode="Text">
                    <RequiredField IsRequired="True" ErrorText="*">
                    </RequiredField>
                        <ErrorFrameStyle Font-Bold="true" Font-Size="Large"></ErrorFrameStyle>
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CODIGO" ReadOnly="true" ShowInCustomizationForm="True" VisibleIndex="1">
                <EditFormSettings Caption="(*) Código" />
                <EditFormCaptionStyle Font-Bold="true"></EditFormCaptionStyle>
                <PropertiesTextEdit>
                    <ClientSideEvents Init="function(s,e){s.Validate();}" />
                    <ValidationSettings ErrorDisplayMode="Text">
                    <RequiredField IsRequired="True" ErrorText="*">
                    </RequiredField>
                        <ErrorFrameStyle Font-Bold="true" Font-Size="Large"></ErrorFrameStyle>
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="GLOSA" ReadOnly="true" ShowInCustomizationForm="True" VisibleIndex="2">
                <EditFormSettings Caption="(*) Glosa" />
                <EditFormCaptionStyle Font-Bold="true"></EditFormCaptionStyle>
                <PropertiesTextEdit>
                    <ClientSideEvents Init="function(s,e){s.Validate();}" />
                    <ValidationSettings ErrorDisplayMode="Text">
                    <RequiredField IsRequired="True" ErrorText="*">
                    </RequiredField>
                        <ErrorFrameStyle Font-Bold="true" Font-Size="Large"></ErrorFrameStyle>
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ABREV" ReadOnly="true" ShowInCustomizationForm="True" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="VALOR" ShowInCustomizationForm="True" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="IND_VIGENCIA" ShowInCustomizationForm="True" VisibleIndex="5">
                <EditFormSettings Caption="(*) Vigencia" />
                <EditFormCaptionStyle Font-Bold="true"></EditFormCaptionStyle>
                <PropertiesCheckEdit>
                    <ClientSideEvents Init="function(s,e){s.Validate();}" />
                    <ValidationSettings ErrorDisplayMode="Text">
                    <RequiredField IsRequired="True"  ErrorText="*">
                    </RequiredField>
                        <ErrorFrameStyle Font-Bold="true" Font-Size="Large"></ErrorFrameStyle>
                    </ValidationSettings>
                </PropertiesCheckEdit>
            </dx:GridViewDataCheckColumn>
        </Columns>
            <SettingsBehavior ConfirmDelete="True" />
            <SettingsPager Mode="ShowAllRecords">
        </SettingsPager>
            <Settings ShowFilterRow="True" />
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
        <asp:SqlDataSource ID="sds_config" runat="server" ConnectionString="<%$ ConnectionStrings:GESTRAN_SISTEMA %>" 
            DeleteCommand="DELETE FROM [GS_CODIGOS] WHERE [CODIGO] = @CODIGO" 
            InsertCommand="INSERT INTO [GS_CODIGOS] ([COD_TABLA], [CODIGO], [GLOSA], [ABREV], [VALOR], [IND_VIGENCIA]) VALUES (@COD_TABLA, @CODIGO, @GLOSA, @ABREV, @VALOR, @IND_VIGENCIA)" 
            SelectCommand="SELECT [COD_TABLA], [CODIGO], [GLOSA], [ABREV], [VALOR], [IND_VIGENCIA] FROM [GS_CODIGOS]" 
            UpdateCommand="UPDATE [GS_CODIGOS] SET [GLOSA] = @GLOSA, [ABREV] = @ABREV, [VALOR] = @VALOR, [IND_VIGENCIA] = @IND_VIGENCIA WHERE [CODIGO] = @CODIGO">
            <DeleteParameters>
                <asp:Parameter Name="COD_TABLA" Type="String" />
                <asp:Parameter Name="CODIGO" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="COD_TABLA" Type="String" />
                <asp:Parameter Name="CODIGO" Type="String" />
                <asp:Parameter Name="GLOSA" Type="String" />
                <asp:Parameter Name="ABREV" Type="String" />
                <asp:Parameter Name="VALOR" Type="String" />
                <asp:Parameter Name="IND_VIGENCIA" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="GLOSA" Type="String" />
                <asp:Parameter Name="ABREV" Type="String" />
                <asp:Parameter Name="VALOR" Type="String" />
                <asp:Parameter Name="IND_VIGENCIA" Type="Boolean" />
                <asp:Parameter Name="COD_TABLA" Type="String" />
                <asp:Parameter Name="CODIGO" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
