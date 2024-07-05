<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registeration.aspx.cs" Inherits="WebBased_Project.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="DTS" runat="server" ConnectionString="<%$ ConnectionStrings:Con %>"></asp:SqlDataSource>
    <div>
        <div class="container">
            <div class="row">
                <div class="col-md-6 mx-auto">
                    <div class="card text-white bg-secondary" style="margin: 40px 0 40px 0">
                        <div class="card-body">
                            <div class="row">
                                <div class="col ">
                                    <div class="row ">
                                        <div class="col form-group">
                                            <label class="col-form-label">Name</label> 
                                            <asp:TextBox ID="NameTB" CssClass="form-control" required="required" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col form-group">
                                            <label class="col-form-label">SureName</label>
                                            <asp:TextBox ID="SureNameTB" CssClass="form-control" required="required" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row ">
                                        <div class="col form-group">
                                            <label class="col-form-label">Email</label>
                                            <asp:TextBox ID="EmailTB" TextMode="Email" CssClass="form-control" required="required" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row ">
                                        <div class="col form-group">
                                            <label class="col-form-label">Phone Number</label>
                                            <asp:TextBox ID="PhoneNumTB" CssClass="form-control" required="required" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col form-group">
                                            <label class="col-form-label">TC</label>
                                            <asp:TextBox ID="TcTB" CssClass="form-control" required="required" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class=" d-grid gap-2">
                                            <asp:LinkButton ID="SaveBTN" CssClass="btn btn-success btn-lg" OnClick="SaveBTN_Click"  runat="server">Save</asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
