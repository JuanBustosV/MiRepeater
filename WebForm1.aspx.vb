Imports System.Reflection

Public Class WebForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not IsPostBack) Then

            'Repeater.DataSource = Repeater.DataSource
            'Repeater.DataBind()

            System.Diagnostics.Debug.WriteLine("NO PostBack:  Page_Load Event")
        Else
            System.Diagnostics.Debug.WriteLine("PostBack:  Page_Load Event")
        End If
    End Sub

    Protected Sub Repeater_ItemDataBound(sender As Object, e As RepeaterItemEventArgs) Handles Repeater.ItemDataBound
        System.Diagnostics.Debug.WriteLine("ItemDataBound Event")
    End Sub

    Protected Sub BtnEliminar_Click(sender As Object, e As EventArgs) Handles BtnEliminar.Click
        'Repeater.DataSource = Repeater.DataSource
        'Repeater.DataBind()
        Dim esteObjeto As Type = sender.GetType()
        Dim propiedades As PropertyInfo() = esteObjeto.GetProperties()
        System.Diagnostics.Debug.WriteLine("Pulsó Eliminar:  Click Event" & propiedades.ToString())
    End Sub
End Class








