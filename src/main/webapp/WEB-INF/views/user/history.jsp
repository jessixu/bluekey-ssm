<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ path + "/";

%>
<base href=" <%=basePath%>">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BLUE KEY</title>
<script src="static/js/jquery-3.1.0.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/bootstrapValidator.js"></script>
<script src="static/js/language/zh_CN.js"></script>
<script src="static/js/jquery.cxselect.js"></script>

<link rel="shortcut icon" href="static/img/favico.ico"/>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="static/css/mystyles.css" rel="stylesheet">
<link href="static/css/font-awesome.css" rel="stylesheet">
<link href="static/css/bootstrap-social.css" rel="stylesheet">
<link href="static/css/bootstrapValidator.css" rel="stylesheet">

</head>
<body style="overflow:scroll;overflow-x:hidden">
	<div class="wrapper">
		<div class="page">
			<jsp:include page="../top.jsp" flush="true" />
			<div class="container">
				<div class="row breadcrumb-nav">
					<div class="col-xs-12 col-sm-12 col-sm-push-0">
						<ol class="breadcrumb">
							<li><a href="user/query">Home</a></li>
							<li class="active">Send history</li>

						</ol>
					</div>
				</div>

				<legend>Send history</legend>
				<div >
					<c:choose>
						   <c:when test="${sendRecordList!= null}">  
						        <c:forEach var="record" items="${sendRecordList}">
								     <div class="history-container">
								     	<h4>
								     	  	${record.emailSubject }
							     	  	</h4>
							     	  	<p style="font-size: 12px;">
							     	  		${record.content }
							     	  	</p>
							     	  	<div> 
							     	  		<fmt:formatDate value="${record.createTime }"  pattern="yyyy-MM-dd HH:mm:ss" />
										</div>
									</div>
							    </c:forEach>
						   </c:when>
						   <c:otherwise> 
						     	No data
						   </c:otherwise>
					</c:choose>	
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
	<jsp:include page="../bottom.jsp" flush="true" />
	<script type="text/javascript">
		$(document).ready(function(){
			$(".top").on("click", function() { 
	            $("body").stop().animate({  
	                scrollTop: 0  
	            });  
	        })  
		});

	</script>
</body>
</html>
