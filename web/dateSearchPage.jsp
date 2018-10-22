<%-- 
    Document   : DateSearchMessage
    Created on : Jul 15, 2018, 2:12:26 PM
    Author     : Mohammad
--%>

<%@include file="header.jspf" %>
<script src="assets/dateSearchPageJS.js"></script> 


<div class="container">
    <div class="row">
    </div>
    <br/>

    <form class="navbar-form navbar-left" action="DateSearchMessage" method="get">
        <div class="row">
          


                <div class="form-group">
                    <div class="col-xs-5 date">
                        <div class="input-group input-append date" id="datePicker">
                            <input type="text" class="form-control" name="date" />
                            <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>


                        </div>
                    </div>

                    <div class="form-group"> 
                        <button class="btn btn-primary " name="submit" type="submit">Explore(By Date)</button>
                    </div>
                </div>
        </div>
    </form>
</div> 
</body>
</html>

