<%-- 
    Document   : searchPage
    Created on : Jul 11, 2018, 12:39:58 PM
    Author     : Mohammad
--%>

<%@include file="header.jspf"%>
<link href="assets/searchPageCss.css" rel="stylesheet">
<div class="container">
    <div class="row">





        <form action="SearchMessage" method="get" accept-charset="UTF-8">
            <div class="search">
                <input type="text" class="form-control input-sm" maxlength="64" placeholder="Search" name="srchMsg" />
                <button type="submit" class="btn btn-primary btn-sm">Search</button>
            </div>
        </form>


    </div>
</div>




</body>
</html>