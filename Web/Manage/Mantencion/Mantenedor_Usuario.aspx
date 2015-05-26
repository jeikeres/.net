<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Mantenedor_Usuario.aspx.vb" Inherits="Web.Mantenedor_Usuario" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../App_Themes/Default/Css/Styles.css" rel="stylesheet" type="text/css" />
    <link href="../App_Themes/Default/Css/css.css" rel="Stylesheet" type="text/css" />
    <style type="text/css">


#phonebar .phonebar_l {
     background: url('../App_Themes/Default/Img/phonebar_left.png');
     float: left;
     height: 40px;
     width: 9px;
}

#phonebar .phonebar_m {
     background: url('../App_Themes/Default/Img/phonebar_bg.png') no-repeat center;
     color: #FFFFFF;
     float: left;
     font-family: Arial,Helvetica,sans-serif;
     font-size: 12px;
     height: 40px;
     width: 970px;
}

#phonebar .tel_venta {
     float: left;
     padding: 11px 15px 0px 0px;
}

#phonebar .phonebar_r {
     background: url('../App_Themes/Default/Img/phonebar_right.png');
     float: left;
     height: 40px;
     width: 6px;
}

        .style1
        {
            width: 354px;
        }
        .style2
        {
            width: 286px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server"
        Width="100%" HeaderText="Mantenedor de Usuarios" Theme="MetropolisBlue">
        <HeaderStyle HorizontalAlign="Justify" />
        <PanelCollection>
<dx:PanelContent runat="server">
    <table style="width:100%;">
        <tr>
            <td colspan="3">
                <center>
                    <dx:ASPxGridView ID="gvUsuario" runat="server" AutoGenerateColumns="False" 
                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                        KeyFieldName="COD_USUARIO" Theme="MetropolisBlue" Width="100%">
                        <Columns>
                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" ShowNewButtonInHeader="True"  ButtonType="Image" VisibleIndex="0">
                                <EditButton Visible="True">
                                </EditButton>
                                <DeleteButton Visible="True">
                                </DeleteButton>
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn Caption="Usuario" FieldName="COD_USUARIO" 
                                ShowInCustomizationForm="True" VisibleIndex="1">
                                <EditFormSettings Caption="(*) Usuario" />
                                <EditFormCaptionStyle Font-Bold="true"></EditFormCaptionStyle>
                                <PropertiesTextEdit>
                                    <ClientSideEvents Init="function(s,e){s.Validate();}" />
                                    <ValidationSettings ErrorDisplayMode="Text">
                                    <RequiredField IsRequired="True"  ErrorText="*">
                                    </RequiredField>
                                        <ErrorFrameStyle Font-Bold="true" Font-Size="Large"></ErrorFrameStyle>
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Nombres" FieldName="NOMBRES" 
                                ShowInCustomizationForm="True" VisibleIndex="2">
                                <EditFormSettings Caption="(*) Nombres" />
                                <EditFormCaptionStyle Font-Bold="true"></EditFormCaptionStyle>
                                <PropertiesTextEdit>
                                    <ClientSideEvents Init="function(s,e){s.Validate();}" />
                                    <ValidationSettings ErrorDisplayMode="Text">
                                    <RequiredField IsRequired="True"  ErrorText="*">
                                    </RequiredField>
                                        <ErrorFrameStyle Font-Bold="true" Font-Size="Large"></ErrorFrameStyle>
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Contraseña" FieldName="PASSWORD" ShowInCustomizationForm="True" VisibleIndex="6">
                                <EditFormSettings Caption="(*) Contraseña" />
                                <EditFormCaptionStyle Font-Bold="true"></EditFormCaptionStyle>
                                <PropertiesTextEdit ClientInstanceName="psweditot" Password="True">
                                </PropertiesTextEdit>
                                <EditItemTemplate>
                                    <dx:ASPxTextBox ID="pswtextbox" runat="server" Password="true" 
                                        Text='<%#Bind("PASSWORD")%>' Visible="<%#gvUsuario.IsNewRowEditing%>">
                                        <ClientSideEvents Init="function(s,e){s.Validate();}" Validation="function(s,e){}" />
                                            <ValidationSettings ErrorDisplayMode="Text">
                                                <RequiredField IsRequired="True"  ErrorText="*"></RequiredField>
                                                <ErrorFrameStyle Font-Bold="true" Font-Size="14px"></ErrorFrameStyle>
                                            </ValidationSettings>
                                    </dx:ASPxTextBox>
                                    <asp:LinkButton ID="Lnk_Pass" runat="server" 
                                        OnClientClick="popup.ShowAtElement(this); return false;" 
                                        Visible="<%#Not gvUsuario.IsNewRowEditing %>">Editar Contraseña</asp:LinkButton>
                                </EditItemTemplate>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataComboBoxColumn Caption="Cargo" FieldName="COD_CARGO" 
                                ShowInCustomizationForm="True" VisibleIndex="7">
                                <EditFormSettings Caption="(*) Cargo" />
                                <EditFormCaptionStyle Font-Bold="true"></EditFormCaptionStyle>
                                <PropertiesComboBox DataSourceID="sds_cargo" TextField="GLOSA" 
                                    ValueField="CODIGO" ValueType="System.Int32">
                                    <ClientSideEvents Init="function(s,e){s.Validate();}" />
                                        <ValidationSettings ErrorDisplayMode="Text">
                                        <RequiredField IsRequired="True"  ErrorText="*">
                                        </RequiredField>
                                            <ErrorFrameStyle Font-Bold="true" Font-Size="Large"></ErrorFrameStyle>
                                    </ValidationSettings>
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataTextColumn Caption="Apellidos" FieldName="APELLIDOS" 
                                ShowInCustomizationForm="True" VisibleIndex="3">
                                <EditFormSettings Caption="(*) Apellidos" />
                                <EditFormCaptionStyle Font-Bold="true"></EditFormCaptionStyle>
                                <PropertiesTextEdit>
                                    <ClientSideEvents Init="function(s,e){s.Validate();}" />
                                    <ValidationSettings ErrorDisplayMode="Text">
                                    <RequiredField IsRequired="True"  ErrorText="*">
                                    </RequiredField>
                                        <ErrorFrameStyle Font-Bold="true" Font-Size="Large"></ErrorFrameStyle>
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataComboBoxColumn Caption="Dependencia" FieldName="COD_DEPENDENCIA" 
                                ShowInCustomizationForm="True" VisibleIndex="8">
                                <EditFormSettings Caption="(*) Dependencia" />
                                <EditFormCaptionStyle Font-Bold="true"></EditFormCaptionStyle>
                                   <PropertiesComboBox DataSourceID="sds_dependencia" TextField="GLOSA" 
                                    ValueField="CODIGO" ValueType="System.Int32">
                                    <ClientSideEvents Init="function(s,e){s.Validate();}" />
                                        <ValidationSettings ErrorDisplayMode="Text">
                                        <RequiredField IsRequired="True"  ErrorText="*">
                                        </RequiredField>
                                            <ErrorFrameStyle Font-Bold="true" Font-Size="Large"></ErrorFrameStyle>
                                    </ValidationSettings>
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataCheckColumn Caption="Nuevo" FieldName="IND_NUEVO" 
                                ShowInCustomizationForm="True" VisibleIndex="11">
                                 <EditFormSettings Visible ="False" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataDateColumn Caption="Fecha Creación" FieldName="FECHA_INGRESO" 
                                ShowInCustomizationForm="True" VisibleIndex="10">
                                <PropertiesDateEdit DisplayFormatString="">
                                </PropertiesDateEdit>
                                 <EditFormSettings Visible ="False" />
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn Caption="Identificación" FieldName="IDENTIFICACION" ShowInCustomizationForm="True" VisibleIndex="4">
                                <EditFormSettings Caption="(*) Identificación" />
                                <EditFormCaptionStyle Font-Bold="true"></EditFormCaptionStyle>
                                <PropertiesTextEdit>
                                    <ClientSideEvents Init="function(s,e){s.Validate();}" />
                                    <ValidationSettings ErrorDisplayMode="Text">
                                    <RequiredField IsRequired="True"  ErrorText="*">
                                    </RequiredField>
                                        <ErrorFrameStyle Font-Bold="true" Font-Size="Large"></ErrorFrameStyle>
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataComboBoxColumn Caption="Tipo Identificación" FieldName="COD_TIPO_IDENTIFICACION" ShowInCustomizationForm="True" VisibleIndex="5">
                                <EditFormSettings Caption="(*) Tipo Identificación" />
                                <EditFormCaptionStyle Font-Bold="true"></EditFormCaptionStyle>
                                <PropertiesComboBox DataSourceID="sds_tipo_identificacion" TextField="GLOSA" 
                                    ValueField="CODIGO" ValueType="System.Int32">
                                    <ClientSideEvents Init="function(s,e){s.Validate();}" />
                                    <ValidationSettings ErrorDisplayMode="Text">
                                        <RequiredField IsRequired="True" ErrorText="*"></RequiredField>
                                        <ErrorFrameStyle Font-Bold="true" Font-Size="Large"></ErrorFrameStyle>
                                    </ValidationSettings>
                                </PropertiesComboBox>                            
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataTextColumn Caption="Mail" FieldName="CORREO" ShowInCustomizationForm="True" VisibleIndex="9">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataCheckColumn Caption="Vigencia" FieldName="IND_VIGENCIA" ShowInCustomizationForm="True" VisibleIndex="12">
                                <EditFormSettings Caption="(*) Vigencia" />
                                <EditFormCaptionStyle Font-Bold="true"></EditFormCaptionStyle>
                                <PropertiesCheckEdit>
                                    <ClientSideEvents Init="function(s,e){s.Validate();}" />
                                    <ValidationSettings ErrorDisplayMode="Text">
                                        <RequiredField IsRequired="True" ErrorText="*"></RequiredField>
                                        <ErrorFrameStyle Font-Bold="true" Font-Size="Large"></ErrorFrameStyle>
                                    </ValidationSettings>
                                </PropertiesCheckEdit>
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Bloqueado" FieldName="IND_BLOQUEO" ShowInCustomizationForm="True" VisibleIndex="13">
                                <EditFormSettings Caption="(*) Bloqueado" />
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
                        <SettingsLoadingPanel ImagePosition="Top" Text="Cargando&amp;hellip;" />
                        <Images SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                        </Images>
                        <ImagesEditors>
                            <DropDownEditDropDown>
                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" 
                                    PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                            </DropDownEditDropDown>
                            <SpinEditIncrement>
                                <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditIncrementImageHover_Aqua" 
                                    PressedCssClass="dxEditors_edtSpinEditIncrementImagePressed_Aqua" />
                            </SpinEditIncrement>
                            <SpinEditDecrement>
                                <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditDecrementImageHover_Aqua" 
                                    PressedCssClass="dxEditors_edtSpinEditDecrementImagePressed_Aqua" />
                            </SpinEditDecrement>
                            <SpinEditLargeIncrement>
                                <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditLargeIncImageHover_Aqua" 
                                    PressedCssClass="dxEditors_edtSpinEditLargeIncImagePressed_Aqua" />
                            </SpinEditLargeIncrement>
                            <SpinEditLargeDecrement>
                                <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditLargeDecImageHover_Aqua" 
                                    PressedCssClass="dxEditors_edtSpinEditLargeDecImagePressed_Aqua" />
                            </SpinEditLargeDecrement>
                        </ImagesEditors>
                        <ImagesFilterControl>
                            <LoadingPanel Url="~/App_Themes/Aqua/Editors/Loading.gif">
                            </LoadingPanel>
                        </ImagesFilterControl>
                        <Styles CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua">
                            <LoadingPanel ImageSpacing="8px">
                            </LoadingPanel>
                            <AlternatingRow BackColor="#F2F2F2">
                            </AlternatingRow>
                        </Styles>
                        <StylesEditors>
                            <CalendarHeader Spacing="1px">
                            </CalendarHeader>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                    </dx:ASPxGridView>
                </center>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:SqlDataSource ID="sds_tipo_identificacion" runat="server" ConnectionString="<%$ ConnectionStrings:GESTRAN_SISTEMA %>" SelectCommand="GS_SP_EXTRAECODIGOS" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="IDENTIFICACION" Name="COD_TABLA" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sds_cargo" runat="server" ConnectionString="<%$ ConnectionStrings:GESTRAN_SISTEMA %>" SelectCommand="GS_SP_EXTRAECODIGOS" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="CARGO" Name="COD_TABLA" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sds_dependencia" runat="server" ConnectionString="<%$ ConnectionStrings:GESTRAN_SISTEMA %>" SelectCommand="GS_SP_EXTRAECODIGOS" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="DEPENDENCIA" Name="COD_TABLA" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" 
                    ClientInstanceName="popup" HeaderText="Editar Clave" Theme="MetropolisBlue" 
                    Width="307px">
                    <ContentCollection>
                        <dx:PopupControlContentControl runat="server">
                            <table>
                                <tr>
                                    <td>
                                        Ingrese Nueva Clave:</td>
                                    <td>
                                        <dx:ASPxTextBox ID="npsw" runat="server" ClientInstanceName="npsw" 
                                            Password="True">
                                            <ClientSideEvents Validation="function(s, e) {e.isValid = (s.GetText().length&gt;5)}" />
                                            <ValidationSettings ErrorDisplayMode="ImageWithTooltip" 
                                                ErrorText="La Clave debe Tener un largo mínimo de 6 Caracteres">
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Confirme Nueva Clave:</td>
                                    <td>
                                        <dx:ASPxTextBox ID="cnpsw" runat="server" ClientInstanceName="cnpsw" 
                                            Password="True">
                                            <ClientSideEvents Validation="function(s, e) {e.isValid = (s.GetText() == npsw.GetText());}" />
                                            <ValidationSettings ErrorDisplayMode="ImageWithTooltip" 
                                                ErrorText="La clave es incorrecta">
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                            </table>
                            <dx:ASPxButton ID="confirmButton" runat="server" AutoPostBack="False" 
                                OnClick="confirmButton_Click" Text="Aceptar" Theme="PlasticBlue" 
                                Width="150px">
                            </dx:ASPxButton>
                        </dx:PopupControlContentControl>
                    </ContentCollection>
                </dx:ASPxPopupControl>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
            </dx:PanelContent>
</PanelCollection>
    </dx:ASPxRoundPanel>
    </form>
</body>
</html>
