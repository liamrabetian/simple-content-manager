<%-- 
    Document   : index
    Created on : Jul , 2018, 10:12:25 AM
    Author     : Mohammad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jspf" %>
<%@page import="java.util.List" %>
<%@page import="com.database.DBHandler" %>
<%@page import="com.database.ReadData" %>
<!DOCTYPE html>

<div class="container">
    <div class="row">

        <form action="SaveMessage" method="get" accept-charset="UTF-8">
            <label for ="Date">Date :</label>
            <div class="form-group">
                <div class="col-xs-5 date">
                    <div class="input-group input-append date" id="datePicker">
                        <input type="text" class="form-control" name="date" />
                        <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="comment">Message :</label>
                <textarea name="messageText" class="form-control" cols="50" rows="15"></textarea>
                <input type="submit" class="btn btn-block btn-info" name="btn" value="Save"/>
            </div>
        </form>


    </div>

    <div class="position">
        <%
            DBHandler db = new DBHandler();
            //  List<Integer> lstId;
            List<String> lstDate;
            List<String> lstMsg;
            db.open();
            ReadData rd = db.getAllMessage();
            db.close();
            //   lstId = rd.getLstId();
            lstDate = rd.getLstDate();
            lstMsg = rd.getLstMsg();
            //   for (int n = 0; n < lstId.size(); n++) {
            if (lstMsg.size() > 0) {
        %>


        <div class="alert alert-success alert-dismissible fade show text-center">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <%out.println(lstDate.get(lstDate.size() - 1));%>
            <strong>Last message inserted to DB :</strong>
            <% out.println(lstMsg.get(lstMsg.size() - 1));%>
        </div>


        <%
            }
        %>
    </div>


</div>

<br/><br/><br/>


<%@include file="footer.jspf" %>
