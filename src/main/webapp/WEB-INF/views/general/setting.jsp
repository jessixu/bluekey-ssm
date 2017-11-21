<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

 <%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Blue Key</title>

<base href=" <%=basePath%>">
<link rel="stylesheet" type="text/css" href="static/css/sweet-alert.css"/>	
<link rel="shortcut icon" href="static/img/favico.ico"/>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="static/css/font-awesome.css" rel="stylesheet">
<link href="static/css/bootstrap-social.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
<link href="static/css/mystyles.css" rel="stylesheet">
<script type="text/javascript">
	function responseJson(){
		$.ajax({
			type:"POST",
			/* url:"role/getBuList", */
			url:"role/getBuList",
			data:'buid=1',
			async: false,  
			success:function(data){
				alert(eval('('+data+')'));
				$("#c_id").html("");  
                $.each(eval('('+data+')'),function(i, item) {  
                	alert(item.value);
                    var statem = "<option value='"+item.value+"'>"+item.name+"</option>";  
                    $("#c_id").append(statem);  
                });  
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {  //#3这个error函数调试时非常有用，如果解析不正确，将会弹出错误框
                alert(textStatus);
       		},
		})
	}
	
	
	
</script>
</head>

<body style="overflow:scroll;overflow-x:hidden">
<div class="wrapper">
		<div class="page">
			<jsp:include page="../top.jsp" flush="true" />
			<div class="container">
			<div class="row breadcrumb-nav" >
					<div class="col-xs-12 col-sm-12 col-sm-push-0">
						<ol class="breadcrumb">
							<li><a href="user/query">Home</a></li>
							<li class="active">Setting</li>
	
						</ol>
					</div>
				</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row">
				<div class="col-md-4">
					<div class="thumbnail">
						<img alt="300x200" src="v3/default4.jpg" />
						<div class="caption">
							<h3>
								Thumbnail label
							</h3>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
							<p>
								 <a class="btn btn-primary" href="#">Action</a> <a class="btn" href="#">Action</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="thumbnail">
						<img alt="300x200" src="v3/default5.jpg" />
						<div class="caption">
							<h3>
								Thumbnail label
							</h3>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
							<p>
								 <a class="btn btn-primary" href="#">Action</a> <a class="btn" href="#">Action</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="thumbnail">
						<img alt="300x200" src="v3/default6.jpg" />
						<div class="caption">
							<h3>
								Thumbnail label
							</h3>
							<p>
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
							<p>
								 <a class="btn btn-primary" href="#">Action</a> <a class="btn" href="#">Action</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
		</div>
	</div>
	
	<jsp:include page="../bottom.jsp" flush="true" />
	<script src="static/js/sweet-alert.js" type="text/javascript" charset="utf-8"></script>
	<script src="static/js/jquery-3.1.0.js"></script>
	<script src="static/js/jquery.cxselect.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
	
</body>
</html>

