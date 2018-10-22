<%-- 
    Document   : datePage
    Created on : Jul 15, 2018, 1:58:36 PM
    Author     : Mohammad
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="com.database.ReadData"%>
<%@page import="java.util.List"%>
<%@page import="com.database.DBHandler"%>

<%@include file="header.jspf" %>

<div class="container">
    <!--  <form name = "DateTablese" action="DateTablese" method="Post*">  -->
    <h2><p class="text-success">Date TABLE</p></h2>
    <p class="text-muted">You Can See The Table Below : </p>
    <table class="table table-bordered table-sm">
        <thead>
            <tr>

                <th><p class="text-warning">Index</p></th>
                <th><p class="text-primary">Date</p></th>
                <th><p class="text-danger">Content</p></th>



                <%
                    DBHandler db = new DBHandler();
                    List<Integer> lstId;
                    List<String> lstDate;
                    List<String> lstMsg;
                    db.open();
                    String st = (String) request.getAttribute("Message");
                    db.dateSearcher(st);
                    ReadData rd = db.dateSearcher(st);
                    db.close();

                    lstId = rd.getLstId();
                    lstDate = rd.getLstDate();
                    lstMsg = rd.getLstMsg();

                    for (int n = 0; n < lstId.size(); n++) {
                %>
            </tr>

        <td><% out.print(lstId.get(n)); %></td>
        <td>Date : <% out.print(lstDate.get(n)); %></td>
        <td>Message :<% out.print(lstMsg.get(n)); %></td>



        </tr>
        <% }%>
        </form>
        </tbody>
    </table>
</div>
</body>
</html>
