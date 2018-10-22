<%-- 
    Document   : searchPageShowContent
    Created on : Jul 11, 2018, 2:03:41 PM
    Author     : Mohammad
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="com.database.ReadData" %>
<%@page import="com.database.DBHandler" %>
<%@include file="header.jspf"%>



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


<%  
    ReadData rd = new ReadData();
    List<String> lstDate;
    List<String> lstMsg;
    List<Integer> lstId;
    DBHandler db = new DBHandler();
    db.open();
    String sss = (String) request.getAttribute("message");
    rd = db.searcher(sss);
    db.close();
    lstDate = rd.getLstDate();
    lstMsg = rd.getLstMsg();
    lstId = rd.getLstId();
    for (int n=0; n<lstMsg.size(); n++){        
%>

<tr>
    <td><%out.println(lstId.get(n));%></td>
    <td><%out.println(lstDate.get(n));%></td>
    <td><%out.println(lstMsg.get(n));%></td>
</tr>

<%}%>




</body>
</html>
