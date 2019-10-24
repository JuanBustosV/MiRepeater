Public Class WebForm1
    Inherits System.Web.UI.Page

    Property ListProducts As List(Of Products) = New List(Of Products) From {
            New Products With {
                .ProductID = 1,
                .ProductName = "Chai",
                .QuantityPerUnit = "10 boxes x 20 bags"
            },
            New Products With {
                .ProductID = 2,
                .ProductName = "Chang",
                .QuantityPerUnit = "24 - 12 oz bottles"
            },
            New Products With {
                .ProductID = 3,
                .ProductName = "Aniseed Syrup",
                .QuantityPerUnit = "12 - 550 ml bottles"
            },
            New Products With {
                .ProductID = 4,
                .ProductName = "Chef Anton's Cajun Seasoning",
                .QuantityPerUnit = "48 - 6 oz jars"
            }
        }

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not IsPostBack) Then

            RowId.Value = -1

            Repeater.DataSource = ListProducts
            Repeater.DataBind()

            System.Diagnostics.Debug.WriteLine("NO PostBack:  Page_Load Event")
        Else
            System.Diagnostics.Debug.WriteLine("PostBack:  Page_Load Event")
        End If
    End Sub

    Protected Sub Repeater_ItemDataBound(sender As Object, e As RepeaterItemEventArgs) Handles Repeater.ItemDataBound
        RowId.Value = CType(RowId.Value, Integer) + 1
        System.Diagnostics.Debug.WriteLine("ItemDataBound Event - RowId: " & RowId.Value)
    End Sub

    Protected Sub BtnLoadData_Click(sender As Object, e As EventArgs) Handles BtnLoadData.Click
        'Repeater.DataSource = Repeater.DataSource
        'Repeater.DataBind()

        System.Diagnostics.Debug.WriteLine("Pulsó LoadData:  Click Event")
    End Sub
End Class








