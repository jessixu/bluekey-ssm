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
<script src="static/js/zzsc.js"></script>

<link rel="shortcut icon" href="static/img/favico.ico" />
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="static/css/mystyles.css" rel="stylesheet">
<link href="static/css/font-awesome.css" rel="stylesheet">
<link href="static/css/bootstrap-social.css" rel="stylesheet">
</head>
<body style="overflow:scroll;overflow-x:hidden">
	<div class="wrapper">
		<div class="page">
			<jsp:include page="top.jsp" flush="true" />

				<div class="container" style=" padding-top: 60px;">
					<div>
						<div style="text-align: center;">
							<img src="static/img/wolf.png" style="width: 1100; height: 650px;" >	
						</div>
						
						<a href="user/query"><img src="static/img/gohome.png" style="width: 200px; height: 50px; margin-left: 0px; position: absolute; left: 410px; top: 490px;"></a>
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
