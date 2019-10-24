<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm1.aspx.vb" Inherits="MiRepeater.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mi Repeater</title>
    <script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/jquery.validate.min.js"></script>
    <script src="Scripts/jquery.validate.unobtrusive.min.js"></script>
    <script src="Scripts/repeater.js"></script>
    <style>
        .ProductID{background-color:aqua}
        .ProductName{background-color:yellow}
        .QuantityPerUnit{background-color:Orange}
    </style>
</head>
<body>
    
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server">

            <ContentTemplate>
                <asp:Repeater ID="Repeater" runat="server" DataSourceID="SqlDataSource1">
                    <HeaderTemplate>
                        <table id="Tabla" border="1">
                            <tr>
                                <th>Product ID</th>
                                <th>Product Name</th>
                                <th>Quantity Per Unit</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:Label ID="LblProductID" runat="server" Text='<%#Eval("ProductID")%>' Width="100" CssClass="ProductID"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="LblProductName" runat="server" Text='<%#Eval("ProductName")%>' Width="100" CssClass="ProductName"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="LblQPU" runat="server" Text='<%#Eval("QuantityPerUnit")%>' Width="100" CssClass="QuantityPerUnit"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TxtPorcentaje" runat="server"></asp:TextBox>                                
                            </td>
                            <td>
                                <asp:Button ID="BtnEliminar" runat="server" Text="Eliminar" OnClick="BtnEliminar_Click" />
                                <input id="InElim" type="button" onclick="EliminarClick(this.id)" value="Borrar" />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                

                
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnEliminar" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
        <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWINDConnectionString %>" SelectCommand="SELECT * FROM [Products]" ID="SqlDataSource1"></asp:SqlDataSource>
    </form>


</body>
</html>
