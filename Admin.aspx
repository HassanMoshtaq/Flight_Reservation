<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="WebBased_Project.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="DTS" runat="server" ConnectionString="<%$ ConnectionStrings:Con %>" SelectCommand="Select * from booking"></asp:SqlDataSource>
    <div background="img/airplane-big-cloud.jpg" style="background-size: cover">
        <div class="container">
            <div class="row">
                <div class="col-md-6 mx-auto">
                    <div class="card text-white bg-secondary" style="margin: 40px 0 40px 0">
                        <div class="card-body">
                            <div class="row">
                                <%-- Show SeatId Name surename phone of passenger   --%>
                                <div class="col table-responsive ">
                                    <asp:GridView ID="GV" CssClass="table table-striped table-bordered" Style="width: 100%" AllowPaging="true" PageSize="10" PagerStyle-HorizontalAlign="Center" PagerStyle-CssClass=" text-secondary table table-bordered" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="table-warning "
                                        DataSourceID="DTS" AutoGenerateColumns="false" runat="server">
                                        <Columns>
                                            <asp:BoundField DataField="PassengerSeatID" HeaderText="PassenderSeatID" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" />
                                            <asp:BoundField DataField="PassengerName" HeaderText="PassengerName" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" />
                                            <asp:BoundField DataField="PassengerSurname" HeaderText="PassengerSurname" ReadOnly="true" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" />
                                            <asp:BoundField DataField="PassengerPhone" HeaderText="PassengerPhone" DataFormatString="{0:d}" ReadOnly="true" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                            <%-- Export btn --%>
                            <div class="row">
                                <div class=" d-grid gap-2">
                                    <asp:LinkButton ID="ExportBTN" CssClass="btn btn-success btn-lg" OnClick="ExportBTN_Click" runat="server">Export pdf</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
