<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FlightList.aspx.cs" Inherits="WebBased_Project.FlightList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
        <div class="row mt-5 mb-5">
            <div class="col-md-12 mx-auto d-flex justify-content-center">
                <div class="col">
                    <div class="row">
                        <div class="col ">
                            <asp:Label ID="DateLBL" CssClass="h2" runat="server"><%= WebBased_Project.FlightList.Date %></asp:Label>
                        </div>
                    </div>
                    <%-- Sql datasource for each AccordionPane --%>
                    <asp:SqlDataSource ID="FlightDTS1" runat="server" ConnectionString="<%$ ConnectionStrings:Con %>"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="FlightDTS2" runat="server" ConnectionString="<%$ ConnectionStrings:Con %>"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="FlightDTS3" runat="server" ConnectionString="<%$ ConnectionStrings:Con %>"></asp:SqlDataSource>
                    <%-- /Sql datasource for each AccordionPane --%>
                    <%-- Accordion --%>
                    <ajaxToolkit:Accordion ID="Accordion1" runat="server" HeaderCssClass="headerCssClass" ContentCssClass="contentCssClass" HeaderSelectedCssClass="headerSelectedCss" FadeTransitions="true" TransitionDuration="500" AutoSize="None" SelectedIndex="0">
                        <Panes>
                            <%-- Pane 1 --%>
                            <ajaxToolkit:AccordionPane ID="AccordionPane1" runat="server">
                                <Header>
                                    <%-- Flight info --%>
                                    <div class="row">
                                        <%-- Flight num --%>
                                        <div class="col d-flex justify-content-center ">
                                            <asp:Label ID="FlightNum1Lbl" CssClass="h2" runat="server"></asp:Label>
                                        </div>
                                        <%-- Flight time --%>
                                        <div class="col d-flex justify-content-center ">
                                            <asp:Label ID="Time1Lbl" CssClass="h2" runat="server"><i class="bi bi-clock"></i></asp:Label>
                                        </div>
                                        <%-- Flight price --%>
                                        <div class="col d-flex justify-content-center">
                                            <asp:Label ID="Price1Lbl" CssClass="h2" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                    <%-- /Flight info --%>
                                </Header>
                                <Content>
                                    <%-- Checkbox for select Seat number --%>
                                    <div class="row">
                                        <div class="col d-flex justify-content-center">
                                            <asp:CheckBoxList ID="FlightSeatCBl1" DataSourceID="FlightDTS1" DataTextField="SeatNumber" RepeatColumns="10" RepeatDirection="Vertical" runat="server"></asp:CheckBoxList>
                                        </div>
                                    </div>
                                    <%-- Confirm btn --%>
                                    <div class="row">
                                        <div class=" d-grid gap-2">
                                            <asp:LinkButton ID="SelectBTN1" CssClass="btn btn-info btn-lg" CommandName="Select1" OnClick="SelectBTN_Click" runat="server">Go to Payment</asp:LinkButton>
                                        </div>
                                    </div>
                                </Content>
                            </ajaxToolkit:AccordionPane>
                            <%-- Pane2 --%>
                            <ajaxToolkit:AccordionPane ID="AccordionPane2" runat="server">
                                <Header>
                                    <div class="row">
                                        <div class="col d-flex justify-content-center ">
                                            <asp:Label ID="FlightNum2Lbl" CssClass="h2" runat="server"></asp:Label>
                                        </div>
                                        <div class="col d-flex justify-content-center ">
                                            <asp:Label ID="Time2Lbl" CssClass="h2" runat="server"><i class="bi bi-clock"></i></asp:Label>
                                        </div>
                                        <div class="col d-flex justify-content-center">
                                            <asp:Label ID="Price2Lbl" CssClass="h2" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </Header>
                                <Content>
                                    <div class="row">
                                        <div class="col d-flex justify-content-center">
                                            <asp:CheckBoxList ID="FlightSeatCBl2" DataSourceID="FlightDTS1" DataTextField="SeatNumber" RepeatColumns="10" RepeatDirection="Vertical" runat="server"></asp:CheckBoxList>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class=" d-grid gap-2">
                                            <asp:LinkButton ID="SelectBTN2" CssClass="btn btn-info btn-lg" CommandName="Select2" OnClick="SelectBTN_Click" runat="server">Go to Payment</asp:LinkButton>
                                        </div>
                                    </div>
                                </Content>
                            </ajaxToolkit:AccordionPane>
                            <%-- Pane3 --%>
                            <ajaxToolkit:AccordionPane ID="AccordionPane3" runat="server">
                                <Header>
                                    <div class="row">
                                        <div class="col d-flex justify-content-center ">
                                            <asp:Label ID="FlightNum3Lbl" CssClass="h2" runat="server"></asp:Label>
                                        </div>
                                        <div class="col d-flex justify-content-center ">
                                            <asp:Label ID="Time3Lbl" CssClass="h2" runat="server"><i class="bi bi-clock"></i></asp:Label>
                                        </div>
                                        <div class="col d-flex justify-content-center">
                                            <asp:Label ID="Price3Lbl" CssClass="h2" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </Header>
                                <Content>
                                    <div class="row">
                                        <div class="col d-flex justify-content-center">
                                            <asp:CheckBoxList ID="FlightSeatCBl3" DataSourceID="FlightDTS1" DataTextField="SeatNumber" RepeatColumns="10" RepeatDirection="Vertical" runat="server"></asp:CheckBoxList>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class=" d-grid gap-2">
                                            <asp:LinkButton ID="SelectBTN3" CssClass="btn btn-info btn-lg" CommandName="Select3" OnClick="SelectBTN_Click" runat="server">Go to Payment</asp:LinkButton>
                                        </div>
                                    </div>
                                </Content>
                            </ajaxToolkit:AccordionPane>
                        </Panes>
                    </ajaxToolkit:Accordion>
                    <%-- /Accordion --%>
                </div>
            </div>
        </div>
    </div>
    <style>
        .headerCssClass {
            background-color: #c33803;
            color: white;
            border: 1px solid black;
            padding: 4px;
        }

        .contentCssClass {
            background-color: #e59a7d;
            color: black;
            border: 1px dotted black;
            padding: 4px;
        }

        .headerSelectedCss {
            background-color: #808080;
            color: white;
            border: 1px solid black;
            padding: 4px;
        }
    </style>
</asp:Content>
