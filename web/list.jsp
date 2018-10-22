<%-- 
    Document   : list
    Created on : Jul 11, 2018, 11:10:35 AM
    Author     : Mohammad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.List" %>
<%@page import="com.database.DBHandler" %>
<%@page import="com.database.ReadData" %>
<%@include file="header.jspf" %>







<div class="container">
    <h2><p class="text-success">List TABLE</p></h2>
    <p class="text-muted">You Can See The Table Below : </p>
    <table class="table table-bordered table-sm">
        <thead>
            <tr>
                <th><p class="text-warning">index</p></th>
                <th><p class="text-primary">Date</p></th>
                <th><p class="text-danger">Message</p></th>
            </tr>
        </thead>
        <tbody>
            <% DBHandler db = new DBHandler();
            List<String> lstMsg;
            List<String> lstDate;
            List<Integer> lstId;
            db.open();
            ReadData rd = db.getAllMessage();
            db.close();
            lstId = rd.getLstId();
            lstMsg = rd.getLstMsg();
            lstDate = rd.getLstDate();
            for (int n = 0; n<lstMsg.size(); n++){
   
               %> 
                
               
            
            <tr>
                <td><%out.print(n);%> </td>
                <td><%out.println(lstDate.get(n)); %></td>
                <td><%out.println(lstMsg.get(n)); %></td>
            </tr>

               <%}%>
    </table>
</div>



</body>
</html>
