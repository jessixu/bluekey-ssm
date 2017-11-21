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
			<jsp:include page="top.jsp" flush="true" />
			<div class="container" style="padding-top: 100px;">
				<div class="col-sm-6 col-sm-offset-3 form-box">
					
					<div class="form-top">
						<img src="static/img/u6.jpg" style="width: 80%; padding-left: 20%;" >
					</div>

					<div class="form-bottom" id="select_role"	style="background-color: rgba(231,236,245,0.8);">
						<form role="form" class="query-form" id="query-form">
							<div class="row" style="margin-bottom: 15px;">
								<div class="form-group" style="margin-bottom: 15px;">
									<label for="functionid" class="col-sm-4 control-label "
										style="text-align: right; color: #5c7ebd; font-size: 20px;"><span style="color:red;font-size:16px">*</span>Business Unit</label>
									<div class="col-sm-8">
										<select class="bu form-control" name="bu" data-value="${remember_arr[0] }"  data-url="role/getBuList" data-required="true"></select>
									</div>
								</div>
							</div>
							
							<div class="row" style="margin-bottom: 15px;">
								<div class="form-group" style="margin-bottom: 15px;">
									<label for="functionid" class="col-sm-4 control-label "
										style="text-align: right; color: #5c7ebd; font-size: 20px;">Function</label>
									<div class="col-sm-8">
									
										<select class="function form-control" name="function" data-value="${remember_arr[1] }" data-url="role/getFunctionList" data-json-space="function" data-required="true"  ></select>
									</div>
								</div>
							</div>
							
							<div class="row" style="margin-bottom: 15px;">
								<div class="form-group" style="margin-bottom: 15px;">
									<label for="commodity" class="col-sm-4 control-label"
										style="text-align: right; color: #5c7ebd; font-size: 20px;">Job
										Role</label>
									<div class="col-sm-8">
										<select class="jobRole form-control" name="jobRole" data-value="${remember_arr[2] }" data-url="role/getJobroleList" data-json-space="jobRole" data-required="true"  >
										
										</select>
									</div>
								</div>
							</div>
							<div class="row" style="margin-bottom: 15px;">

								<div class="form-group">
									<label for="commodity" class="col-sm-4 control-label"
										style="text-align: right; color: #5c7ebd; font-size: 20px;">Commodity</label>
									<div class="col-sm-8">
										<select class="commodity form-control" name="commodity" data-value="${remember_arr[3] }"  data-url="role/getCommodityList" data-json-space="commodity" data-required="true" ></select>
									</div>
								</div>

							</div>

							<div class="row" style="margin-bottom: 15px;">


								<div class="form-group">
									<div class="col-sm-offset-4 col-sm-8">
										<div class="checkbox">
											<label> <input type="checkbox" name="remember_type" style="height: 22px;"> Remember my selection </label>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-4">
									<button type="button" id="query-btn" class="btn">Query</button>
								</div>
							</div>
							
							
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="bottom.jsp" flush="true" />
	<script src="static/js/sweet-alert.js" type="text/javascript" charset="utf-8"></script>
	<script src="static/js/jquery-3.1.0.js"></script>
	<script src="static/js/jquery.cxselect.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
	
	<script>
	(function() {
	  $('#select_role').cxSelect({
	    selects: ['bu','function', 'jobRole', 'commodity'],
	    jsonName: 'name',
	    jsonValue: 'value'
	  });
	  
	// query 提交按钮
    $("#query-btn").click(function() {
		var data = $("#query-form").serialize();
		
		$.ajax({
			url :"role/result",
			type : "POST",
			data : data,
			success : function(result) {
				console.log(result);
				if(result.code==200){
					swal({
						  title: "",
						  text: "The job role haven't created! Please contact Admin",
						  type: "warning",
						  confirmButtonColor: "rgb(92, 126, 189)",
						  confirmButtonText: "OK"
						});
				}else{
					window.location.href = "access/result/"+result.data.roleId;
				}
			}
		});
	});
	})();
	</script>
</body>
</html>

