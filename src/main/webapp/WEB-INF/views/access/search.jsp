<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

<link rel="shortcut icon" href="static/img/favico.ico"/>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="static/css/mystyles.css" rel="stylesheet">
<link href="static/css/font-awesome.css" rel="stylesheet">
<link href="static/css/bootstrap-social.css" rel="stylesheet">


</head>
<body style="overflow:scroll;overflow-x:hidden">
	<div class="wrapper">
		<div class="page">
			<jsp:include page="../top.jsp" flush="true" />

			<div class="container" >
				<div class="row breadcrumb-nav">
					<div class="col-xs-12 col-sm-12" >
						<ol class="breadcrumb">
							<li><a href="user/query">Home</a></li>
							<li class="active">Result</li>
						</ol>
					</div>
				</div>
				<div>
					Find ${size} results about "<span class="hightlight">${search}</span>"
				</div>
				<hr>
				<c:forEach var="access" items="${accessList}">
				     <div class="result-item">
				     	  <h3> 
					     	 <a href="access/detail/${access.accessId}">
					     	 	<c:set var="index" value="${fn:indexOf(fn:toLowerCase(access.title),fn:toLowerCase(search))}" />
					     	 	<c:choose>
								   <c:when test="${index>=0}">
										 ${fn:substring(access.title,0,index).concat('<span class="hightlight">').concat(search).concat('</span>').concat(fn:substring(access.title,index+search.length(),access.title.length()))}
                                            <%-- ${fn:substringBefore(access.title,search)+'<span class="hightlight">' + search + '</span>'+fn:substringAfter(access.title,search)} --%>
								   </c:when>
								   <c:otherwise> 
								     	${access.title }
								   </c:otherwise>
								</c:choose>	
				     	 	</a>
					     </h3>
					     <h4>
						     <p style="font-size: 12px;">
						    	<b>Function Description: &nbsp;&nbsp;</b>
						     	<c:set var="index" value="${fn:indexOf(fn:toLowerCase(access.function),fn:toLowerCase(search))}" />
					     	 	<c:choose>
								   <c:when test="${index>=0}">
										 ${fn:substring(access.function,0,index).concat('<span class="hightlight">').concat(search).concat('</span>').concat(fn:substring(access.function,index+search.length(),access.function.length()))}
	                                           <%-- ${fn:substringBefore(access.title,search)+'<span class="hightlight">' + search + '</span>'+fn:substringAfter(access.title,search)} --%>
								   </c:when>
								   <c:otherwise> 
								     	${access.function }
								   </c:otherwise>
								</c:choose>	
					    	</p>
					     </h4>
					     
					     <p style="font-size: 12px;">
					     	<c:set var="index" value="${fn:indexOf(fn:toLowerCase(access.applyStep),fn:toLowerCase(search))}" />
				     	 	<c:choose>
							   <c:when test="${index>=0}">
									 ${fn:substring(access.applyStep,0,index).concat('<span class="hightlight">').concat(search).concat('</span>').concat(fn:substring(access.applyStep,index+search.length(),access.applyStep.length()))}
                                           <%-- ${fn:substringBefore(access.title,search)+'<span class="hightlight">' + search + '</span>'+fn:substringAfter(access.title,search)} --%>
							   </c:when>
							   <c:otherwise> 
							     	${access.applyStep }
							   </c:otherwise>
							</c:choose>	
				    	</p>
					</div>
			    </c:forEach>
			</div>
			<div class="guide">
				<div class="guide-wrap">
					<a href="general/feedback" class="report" title="Feedback"><span>Feedback</span></a>
					<a href="javascript:void(0)" class="top" title="To top"><span>To top</span></a>
				</div>
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
