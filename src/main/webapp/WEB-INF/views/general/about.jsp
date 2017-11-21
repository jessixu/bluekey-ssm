<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 <%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>
 <%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BLUE KEY</title>
<base href=" <%=basePath%>">
<script src="static/js/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="static/js/bootstrap.min.js" type="text/javascript"></script>
<script src="static/js/bootstrapValidator.js" type="text/javascript"></script>
<script src="static/js/language/zh_CN.js" type="text/javascript"></script>
<script src="static/js/jquery.cxselect.js" type="text/javascript"></script>

<link rel="shortcut icon" href="static/img/favico.ico" />
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="static/css/mystyles.css" rel="stylesheet">
<link href="static/css/font-awesome.css" rel="stylesheet">
<link href="static/css/bootstrap-social.css" rel="stylesheet">
<link href="static/css/bootstrapValidator.css" rel="stylesheet">
<link href="static/css/video-js.css" rel="stylesheet">	
	<style>
		body{}
		.m{ width: 740px; height: 400px; margin-left: auto; margin-right: auto; margin-top: 100px; }
	</style>
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
						<li class="active">About</li>
					</ol>
				</div>
			</div>
				<div>
				<legend>About</legend>
				<p>BlueKey is a smart platform knows what  applications access you would need to apply for your job role.
   					It is a cool guide for the new hires who provides steps to setup all necessary access , information and tools for work.</p>
				<p>Get more about Blue Key by watching the video</p>
				</div>
				
				<div class="video-container" style="text-align: center">
					<div class="m" style="margin-top: 20px;">
						<video id="my-video" class="video-js" controls preload="auto"
							width="740" height="400" poster="MY_VIDEO_POSTER.jpg"
							data-setup="{}" src="">
							<source src="static/video/bluekey.mp4" type="video/mp4">
							<source src="http://vjs.zencdn.net/v/oceans.webm" type="video/webm">
							<source src="http://vjs.zencdn.net/v/oceans.ogv" type="video/ogg">
							<p class="vjs-no-js">
								To view this video please enable JavaScript, and consider
								upgrading to a web browser that <a
									href="http://videojs.com/html5-video-support/" target="_blank">supports
									HTML5 video</a>
							</p>
						</video>
						<script src="static/js/video.min.js"
							type="text/javascript"></script>
						<script type="text/javascript">
							var myPlayer = videojs('my-video');
							videojs("my-video").ready(function() {
								var myPlayer = this;
								myPlayer.play();
							});
						</script>
					</div>
				</div>
				
				<p style="padding-top:20px">If the video can't paly,please click the URL to watch!  <a href="https://ibm.box.com/s/jggpa6fdi9ufuu1f6q7mcc8ck54vh6fb" target="view_window">https://ibm.box.com/s/jggpa6fdi9ufuu1f6q7mcc8ck54vh6fb</a></p>
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
