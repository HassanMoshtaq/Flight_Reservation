<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebBased_Project.Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js" integrity="sha512-2ImtlRlf2VVmiGZsjm9bEyhjGW4dU7B6TNwh/hx/iSByxNENtj3WVE6o/9Lj4TJeVXPi4bnOIMXFIJJAeufa0A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" integrity="sha512-nMNlpuaDPrqlEls3IX/Q56H36qvBASwb3ipuo3MxeWbsQB1881ox0cRv7UPTgBlriqoynt35KjEwgGUeUXIPnw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script>
        $(document).ready(function () { $(".ddl").select2(); });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div>
        <%-- Container --%>
        <div class="container">
            <div class="row">
                <div class="col-md-12 d-flex justify-content-between">
                    <h1>BILETAL.com</h1>
                    <div>
                        <asp:Button ID="btnEnglish" runat="server" Text="English" OnClick="btnEnglish_Click" CssClass="btn btn-light" />
                        <asp:Button ID="btnPersian" runat="server" Text="Persian" OnClick="btnPersian_Click" CssClass="btn btn-light" />
                        <asp:Button ID="btnTurkish" runat="server" Text="Turkish" OnClick="btnTurkish_Click" CssClass="btn btn-light" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mx-auto">
                    <div class="card text-white bg-secondary" style="margin: 40px 0 40px 0;">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <div class="row">
                                        <%-- From City selectetor ajax combobox --%>
                                        <div class="col form-group">
                                            <h4><i class="bi bi-geo-alt-fill" style="font-size: 24px"></i>
                                                <asp:Literal runat="server" Text="<%$ Resources:Global, FromLabel %>"></asp:Literal>
                                            </h4>
                                            <ajaxToolkit:ComboBox ID="FromCityCbB" AutoCompleteMode="SuggestAppend" CssClass="d-flex justify-content-center" runat="server"></ajaxToolkit:ComboBox>
                                        </div>
                                        <%-- /From City selectetor ajax combobox --%>
                                        <%-- To City selectetor ajax combobox --%>
                                        <div class="col form-group">
                                            <h4><i class="bi bi-geo-alt-fill" style="font-size: 24px"></i>
                                                <asp:Literal runat="server" Text="<%$ Resources:Global, ToLabel %>"></asp:Literal>
                                            </h4>
                                            <ajaxToolkit:ComboBox ID="ToCityCbB" AutoCompleteMode="SuggestAppend" CssClass="d-flex justify-content-center" runat="server"></ajaxToolkit:ComboBox>
                                        </div>
                                        <%-- /To City selectetor ajax combobox --%>
                                    </div>
                                    <br />
                                    <div class="row">
                                    </div>
                                    <br />
                                    <div class="row">
                                        <%-- Departure date calender --%>
                                        <div class="form-group">
                                            <h4>
                                                <asp:Literal runat="server" Text="<%$ Resources:Global, DepartureDateLabel %>"></asp:Literal>
                                            </h4>
                                            <div class="d-flex justify-content-center">
                                                <asp:Calendar ID="DateCalender" CssClass="table table-primary table-bordered" OnDayRender="DateCalender_DayRender" DayHeaderStyle-CssClass="table-success" OtherMonthDayStyle-CssClass="table-info" TitleStyle-CssClass="table table-warning table-striped"
                                                    DayStyle-Font-Underline="false" NextMonthText="Next" PrevMonthText="Prev" NextPrevStyle-Font-Underline="false" SelectedDayStyle-CssClass=" text-bg-dark" runat="server"></asp:Calendar>
                                            </div>
                                        </div>
                                        <%-- /Departure date calender --%>
                                    </div>
                                    <br />
                                    <%-- Search btn --%>
                                    <div class="row">
                                        <div class="d-grid gap-2">
                                            <asp:LinkButton ID="SearchBTN" CssClass="btn btn-success btn-lg" ValidationGroup="search" OnClick="SearchBTN_Click" runat="server">
                                                <asp:Literal runat="server" Text="<%$ Resources:Global, SearchButton %>"></asp:Literal>
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                    <%-- /Search btn --%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%-- /Container --%>
    </div>
</asp:Content>
