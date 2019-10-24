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
        .rowEven {
            background-color: lightyellow
        }

        .rowOdd {
            background-color:palegreen
        }

    </style>
</head>
<body>

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <asp:Button ID="BtnLoadData" runat="server" Text="Cargar Datos" OnClick="BtnLoadData_Click" />

        <asp:HiddenField ID="RowId" runat="server" />

        <asp:UpdatePanel runat="server" style="padding: 20px">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnLoadData" EventName="Click" />
            </Triggers>
            <ContentTemplate>
                <asp:Repeater ID="Repeater" runat="server">
                    <HeaderTemplate>
                        <table id="gridTabla">
                            <tr>
                                <th>Product ID</th>
                                <th style="width:30%">Product Name</th>
                                <th>Quantity Per Unit</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr id='<%#"row_" & RowId.Value %>' class='<%#IIf(CType(RowId.Value, Integer) Mod 2 = 0, "rowEven", "rowOdd")%>'>    
                            <td>
                                <asp:Label ID="LblProductID" runat="server" Text='<%#Eval("ProductID")%>' CssClass="ProductID"></asp:Label>
                            </td>
                            <td style="width:30%">
                                <asp:Label ID="LblProductName" runat="server" Text='<%#Eval("ProductName")%>' CssClass="ProductName"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="LblQPU" runat="server" Text='<%#Eval("QuantityPerUnit")%>' CssClass="QuantityPerUnit"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TxtPorcentaje" runat="server" ReadOnly="true"></asp:TextBox>
                            </td>
                            <td>
                                <input id='<%#"btnEdit_" & RowId.Value %>' type="button" onclick="EditarClick(this.id)" value="Editar" />
                            </td>
                            <td>
                                <input id='<%#"btnElim_" & RowId.Value %>' type="button" onclick="EliminarClick(getRowId(String(this.id)));" value="Borrar" />
                            </td>                            
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>

            </ContentTemplate>

        </asp:UpdatePanel>
        <%--<asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWINDConnectionString %>" SelectCommand="SELECT * FROM [Products]" ID="SqlDataSource1"></asp:SqlDataSource>--%>
    </form>
</body>
</html>
