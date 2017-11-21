<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<base href=" <%=basePath%>">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BLUE KEY</title>
<script src="static/js/jquery-3.1.0.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>


<link rel="shortcut icon" href="static/img/favico.ico" />
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="static/css/mystyles.css" rel="stylesheet">
<link href="static/css/font-awesome.css" rel="stylesheet">
<link href="static/css/bootstrap-social.css" rel="stylesheet">

<script language="javascript">

        $(document).ready(function() { 
            function jump(count) { 
                window.setTimeout(function(){ 
                    count--; 
                    if(count >0) { 
                    	console.log(count)
                        $('#num').text( count); 
                        jump(count); 
                    } else { 
                        //location.href="user/query"; 
                    } 
                }, 1000); 
            } 
            jump(3); 
        });
        
        

</script> 

</head>
<body  style="overflow:scroll;overflow-x:hidden">
	<div class="wrapper">
		<div class="page">
			<jsp:include page="top.jsp" flush="true" />
			
		 		
			 <div class="container" style=" padding-top: 80px;">
				<div style="text-align: center;">
					<div>
					<img src="static/img/cw4.png" " >	
				</div>
				<C:if test="${message}" >
				 	<span style="color:#5C7EBD"><h1>${message}</h1></span>
				</C:if >
				<C:if test="${message==null}" >
				 	<span style="color:#5C7EBD"><h1>An error occurred</h1></span>
				</C:if >
					<br/><h4>It will reward to home page after 3s. Left&nbsp;<span id="num" >3</span>&nbsp;seconds</h4>
					<button class="btn btn-default"> <a  href="#">return home</a></button>
				</div>

			</div> 

		</div>
		<div class="guide">
			<div class="guide-wrap">
				<a href="general/feedback" class="report" title="Feedback"><span>Feedback</span></a>
				<a href="javascript:void(0)" class="top" title="To top"><span>To top</span></a>
			</div>
		</div>
	</div>
	<jsp:include page="bottom.jsp" flush="true" />
</body>
</html>
