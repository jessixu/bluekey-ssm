<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 <%
 	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>
 
 <base href=" <%=basePath%>">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BLUE KEY</title>
<script src="static/js/jquery-1.10.2.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/bootstrapValidator.js"></script>
<script src="static/js/language/zh_CN.js"></script>
<script src="static/js/jquery.cxselect.js"></script>
<script src="static/js/sweet-alert.js" type="text/javascript" charset="utf-8"></script>

<link rel="stylesheet" type="text/css" href="static/css/sweet-alert.css"/>	
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
				<div class="row breadcrumb-nav" >
					<div class="col-xs-12 col-sm-12 col-sm-push-0">
						<ol class="breadcrumb">
							<li><a href="user/query">Home</a></li>
							<li><a href="general/setting">Setting</a></li>
							<li class="active">Authority manage</li>
	
						</ol>
					</div>
				</div>
	
				<legend>User List</legend>
				<div class="row clearfix">
					<div class="col-md-12 column">
						<div class="tabbable" id="tabs-368872">
							<ul class="nav nav-tabs" >
								<li class="active" >
									 <a href="#panel-admin" data-toggle="tab" >Admin </a>
								</li>
								<li >
									 <a href="#panel-authorizationRole" data-toggle="tab"> Authorization role</a>
								</li>
								
							</ul>
							<div class="tab-content">
								<div class="tab-pane fade in active" id="panel-admin">
									<div style="padding:0 20px 20px 20px;min-height:480px">
										<div class="page-header" >
											<c:if test="${Arrays.binarySearch(loginUser.authorization.authRight.split(','),'2')>= 0}">   
												<div>
													<a class="btn btn-info btn" id="add-admin" style="background: #5c7ebd; border: 0;"  data-toggle="modal"> 
														<span class="glyphicon glyphicon-plus"></span>	add Admin
													</a>
												</div>
											</c:if>
										</div>
										<div class="table-responsive">
											<table class="table  table-hover">
												<thead>
													<tr class="active">
														<th style="width:5%">ID</th>
														<th style="width:20%">Email</th>
														<th style="width:20%">Authorization role</th>
														<th style="width:20%">Update time</th>
														<th>Update operator</th>
														<th style="width:5%">Operate</th>
													</tr>
												</thead>
												<tbody id ="user-tb">
													
												</tbody>
											</table>
										</div>
									</div>
									<div class="row">
										<div class="col-md-8" id = "admin-pageInfo-cont">
											Current Page&nbsp;&nbsp;<span id="pageNum"></span>&nbsp;&nbsp;,Total&nbsp;&nbsp;<span  id="pages"></span>&nbsp;&nbsp;page&nbsp;,Total&nbsp;&nbsp;<span  id="total"></span>&nbsp;&nbsp;record
										</div>
										<div class="col-md-4" id = "admin-navigation-cont">
											<nav aria-label="Page navigation">
											  <ul class="pagination" id="admin-navigatepageNums">				  	
											  </ul>
											</nav>
										</div>
									</div>
								</div>
								
								<div class="tab-pane fade " id="panel-authorizationRole">
									<div style="padding:0 20px 20px 20px;min-height:480px">
										<div class="page-header">
											<c:if test="${Arrays.binarySearch(loginUser.authorization.authRight.split(','),'5')>= 0}">   
												<div>
													<a href="javascript:void(0)" class="btn btn-primary" id="add-auth" style="background: #5c7ebd; border: 0;"> 
														<span class="glyphicon glyphicon-plus"></span> add Authorization Role
													</a>
												</div>
											</c:if>
										</div>
										<div class="table-responsive">
											<table class="table  table-hover" >
												<thead>
													<tr class="active">
														<th style="width:3%">ID</th>
														<th style="width:10%">Name</th>
														<th style="width:5%">BU</th>
														<th style="width:5%">Function</th>
														
														<th style="width:18%">Authorization right</th>
														<th style="width:18%">Organization right</th>
														<th style="width:12%">Role right</th>
														<th style="width:12%">Access right</th>
														<th style="width:5%">Update time</th>
														<th >Update operator</th>
														<th style="width:5%">Operate</th>
													</tr>
												</thead>
												<tbody id="auth-tb">
													
												</tbody>
											</table>
										</div>
									</div>
									<div class="row">
										<div class="col-md-8" id = "auth-pageInfo-cont">
											Current Page&nbsp;&nbsp;<span id="pageNum"></span>&nbsp;&nbsp;,Total&nbsp;&nbsp;<span  id="pages"></span>&nbsp;&nbsp;page&nbsp;,Total&nbsp;&nbsp;<span  id="total"></span>&nbsp;&nbsp;record
										</div>
										<div class="col-md-4" id = "auth-auth-navigation-cont">
											<nav aria-label="Page navigation">
											  <ul class="pagination" id="auth-navigatepageNums">				  	
											  </ul>
											</nav>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="guide">
			<div class="guide-wrap">
				<a href="general/feedback" class="report" title="Feedback"><span>Feedback</span></a>
				<a href="javascript:void(0)" class="top" title="To top"><span>To top</span></a>
			</div>
		</div>
		
		<div class="col-md-12 column">
			<div class="modal fade" id="admin-modal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
							<h4 class="modal-title" id="adminModalLabel">Add admin</h4>
						</div>
						<form class="form-horizontal" role="form" id="admin_form">
							<div class="modal-body" style="height: 200px">
								<div class="form-group">
									<label for="inputEmailTitle" class="col-sm-4 control-label"><span style="color: red">*</span>Admin Email</label>
									<div class="col-sm-6 ">
										<input type="text" name="email" class="form-control" placeholder="Input Email" />
									</div>
								</div>
								<div class="form-group">
									<label for="inputParent_part" class="col-sm-4 control-label">Authorization role:</label>
									<div class="col-sm-6">
										<select class="form-control" name="authorizationRole" id="auth-select-container" ></select>
									</div>
								</div>
								
							</div>
							<div class="modal-footer">
								<input type="hidden" name="" value="" >
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary" style="background: #5C7EBD; border: 0;">Save</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="col-md-12 column">
			<div class="modal fade" id="add-right-modal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" style="width:800px">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h4 class="modal-title" id="addAuthModalLabel"></h4>
						</div>
						<form class="form-horizontal" role="form" action="post" id="add-authorizationr_right_form">
							<div class="modal-body" >
								<div id="auth-role-cont">
									<div class="form-group">
										<label for="inputEmailTitle" class="col-sm-3 control-label"><span style="color: red">*</span>role name</label>
										<div class="col-sm-6 ">
											<input type="text" name="name" class="form-control" placeholder="Input role name" />
										</div>
									</div>
									
									<div class = "select_role_list" >
										<div class="form-group">
											<label for="inputParent_part" class="col-sm-3 control-label">BU:</label>
											<div class="col-sm-6 bu-cont">
												<select class="bu form-control" name="bu" data-value=""  data-url="role/getBuList" data-required="false" data-first-title="Select BU"  ></select>
											</div>
										</div>
										<div class="form-group">
											<label for="inputParent_part" class="col-sm-3 control-label">Function:</label>
											<div class="col-sm-6 function-cont">
												<select class="function form-control" name="function" data-value="" data-url="role/getFunctionList" data-json-space="function"  data-required="false" data-first-title="Select function" ></select>
											</div>
										</div>
									</div>
									
									<div class="form-group">
										<label for="inputParent_part" class="col-sm-3 control-label"><span style="color: red">*</span>authorization right:</label>
										<div class="col-sm-8" id="add-authorization-checkbox-con"></div>
									</div>
									<div class="form-group">
										<label for="inputParent_part" class="col-sm-3 control-label">Organization right:</label>
										<div class="col-sm-8" id="add-organization-checkbox-con">
										</div>
									</div>
									<div class="form-group">
										<label for="inputParent_part" class="col-sm-3 control-label">Role right:</label>
										<div class="col-sm-8" id="add-role-checkbox-con"></div>
									</div>
									<div class="form-group">
										<label for="inputParent_part" class="col-sm-3 control-label">Access right:</label>
										<div class="col-sm-8" id="add-access-checkbox-con"></div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary " style="background: #5C7EBD; border: 0;">Save</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-12 column">
			<div class="modal fade" id="edit-right-modal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" style="width:800px">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h4 class="modal-title" id="editAuthModalLabel"></h4>
						</div>
						<form class="form-horizontal" role="form" action="post" id="edit-authorizationr_right_form">
							<div class="modal-body" >
								<div id="auth-role-cont">
									<div class="form-group">
										<label for="inputEmailTitle" class="col-sm-3 control-label"><span style="color: red">*</span>role name</label>
										<div class="col-sm-6 ">
											<input type="text" name="name" class="form-control" placeholder="Input role name" />
										</div>
									</div>
									
									<div class = "select_role_list" >
										<div class="form-group">
											<label for="inputParent_part" class="col-sm-3 control-label">BU:</label>
											<div class="col-sm-6 bu-cont">
												
											</div>
										</div>
										<div class="form-group">
											<label for="inputParent_part" class="col-sm-3 control-label">Function:</label>
											<div class="col-sm-6 function-cont">
												
											</div>
										</div>
									</div>
									
									<div class="form-group">
										<label for="inputParent_part" class="col-sm-3 control-label"><span style="color: red">*</span>authorization right:</label>
										<div class="col-sm-8" id="edit-authorization-checkbox-con"></div>
									</div>
									<div class="form-group">
										<label for="inputParent_part" class="col-sm-3 control-label">Organization right:</label>
										<div class="col-sm-8" id="edit-organization-checkbox-con">
										</div>
									</div>
									<div class="form-group">
										<label for="inputParent_part" class="col-sm-3 control-label">Role right:</label>
										<div class="col-sm-8" id="edit-role-checkbox-con"></div>
									</div>
									<div class="form-group">
										<label for="inputParent_part" class="col-sm-3 control-label">Access right:</label>
										<div class="col-sm-8" id="edit-access-checkbox-con"></div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<input type="hidden" name="" value="" >
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary " style="background: #5C7EBD; border: 0;">Save</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	
	<jsp:include page="../bottom.jsp" flush="true" />
	<script>
	var adminTotalPages;
	var adminCurPages ;
	var authTotalPages;
	var authCurPages ;
	var authRightArr=new Array("visit","edit admin","add admin","delete admin","edit authrization","add authrization","delete authrization");
	var organizationRightArr=new Array("visit","edit BU","add BU","delete BU","edit function","add function","delete function","edit job role","add job role","delete job role","edit commodity","add commodity","delete commodity");
	var roleRightArr=new Array("visit","edit","add","delete");
	var accessRightArr=new Array("visit","edit","add","delete");
	var authJson =JSON.parse('${authJson}') ;
	var buJson =JSON.parse('${buJson}') ;
	var functionJson =JSON.parse('${functionJson}') ;
	
	var adminRightArr = "${loginUser.authorization.authRight}".split(',');
	
	$(document).ready(function(){
		$(".top").on("click", function() {
            $("body").stop().animate({  
                scrollTop: 0  
            });  
        })  
	});
	
	
	
	$(document).ready(function() {
		ajaxQryAdmin(1);
		ajaxQryAuth(1);
		
		$('#user_right_form').bootstrapValidator(
			{
				message : 'This value is not valid',
				feedbackIcons : {/*输入框不同状态，显示图片的样式*/
					valid : 'glyphicon glyphicon-ok',
					invalid : 'glyphicon glyphicon-remove',
					validating : 'glyphicon glyphicon-refresh'
				},
				fields : {/*验证*/
					user_email : {
						validators : {
							notEmpty : {
								message : 'The email is required and can\'t be empty'
							},
							emailAddress : {
								message : 'The input is not a valid email address'
							}
						}
					},
					'function' : {
						validators : {
							notEmpty : {
								message : 'The Access Title is required and cannot be empty'
							}
						}
					},
				}
		});
		
		$(document).on('hidden.bs.modal','.modal',function(e){
			//alert("dsafds")
		    $(this).removeData("bs.modal");
		});
		
		//点击新增模态框 user 
		$("#add-admin").click(function() {
			$('#adminModalLabel').text('Add admin');
			$("#admin_form").find("input:first").val(null).removeAttr("disabled");
			ajaxShowAdminSelect($("#auth-select-container",null));
			$('#admin_form .modal-footer').find("input:eq(0)").attr("name","").val(null);
			$("#admin_form .modal-footer").find("button:eq(1)").removeClass("edit-admin-btn").addClass("add-admin-btn");
			$('#admin-modal').modal('show');
		});
		
		//保存新增user
		$(document).on("click",".add-admin-btn",function() {
			var data = $("#admin_form").serialize(0);
			
			$.ajax({
				url:"user/user",
				type:"POST",
				data:data+"&_method=PUT",
				async:false,
				success:function(result){
					$('#admin-modal').modal('hide');
					if(result.code==100){
						swal("", "Save successfully. It'll take effect after 24h or user logout!", "success");
						$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
							ajaxQryAdmin(adminTotalPages);
                        });
					}else{
						swal("", "Save failure!", "error");
						$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
                            location.reload();
                        });
					}
				}
			})
		});
		
		//点击编辑模态框 user 
		$(document).on("click",".editAdmin",function() {
			var userId = $(this).parent().parent().find('td:eq(0)').text();
			var email = $(this).parent().parent().find('td:eq(1)').text();
			
			$('#adminModalLabel').text('Edit admin');
			console.log(email);
			
			
			$.ajax({
				url:"user/user/"+userId,
				type:"GET",
				async:false,
				success:function(result){
					if(result.code==100){
						$("#admin_form").find("input:first").val(email).attr("disabled","disabled");
						console.log(result.data.user.authorizationRole);
						ajaxShowAdminSelect($("#auth-select-container"),result.data.user.authorizationRole);
					}
				}
		
			})
			
			$('#admin_form .modal-footer').find("input:eq(0)").attr("name","userId").val(userId);
			$("#admin_form .modal-footer").find("button:eq(1)").removeClass("add-admin-btn").addClass("edit-admin-btn");
			$('#admin-modal').modal('show');
		});
		
		//保存编辑user
		$(document).on("click",".edit-admin-btn",function() {
			var data = $("#admin_form").serialize(0);
			
			$.ajax({
				url:"user/user",
				type:"POST",
				data:data,
				async:false,
				success:function(result){
					$('#admin-modal').modal('hide');
					if(result.code==100){
						swal("", "Save successfully. It'll take effect after 24h or user logout!", "success");
						$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
							ajaxQryAdmin(adminCurPages);
                        });
					}else{
						swal("", "Save failure!", "error");
						$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
                            location.reload();
                        });
					}
				}
		
			})
			
			
		});
		
		
		//删除
		$(document).on("click",".deleteAdminConfirm",function() {
			
				 var userId =$(this).parent().parent().find('td:first').text() ;
				 var userName =$(this).parent().parent().find('td:eq(1)').text() ;
				 
				 deleteAdminArticle("user/user/"+userId,userName);
		});
		
		//点击新增模态框 authorization 
		$("#add-auth").click(function() {
			$('#addAuthModalLabel').text('Add authority role');
			
			ShowAuthCheckbox($("#add-access-checkbox-con"),accessRightArr,null,"accessRight");
			ShowAuthCheckbox($("#add-role-checkbox-con"),roleRightArr,null,"roleRight");
			ShowAuthCheckbox($("#add-organization-checkbox-con"),organizationRightArr,null,"organizationRight");
			ShowAuthCheckbox($("#add-authorization-checkbox-con"),authRightArr,null,"authRight");
			
			$("#add-authorizationr_right_form .modal-footer").find("button:eq(1)").addClass("add-auth-btn");
			$('#add-right-modal').modal('show');
		});
		
		//保存新增authorization
		$(document).on("click",".add-auth-btn",function() {
			var data = $("#add-authorizationr_right_form").serialize(0);
			
			$.ajax({
				url:"auth/authorization",
				type:"POST",
				data:data+"&_method=PUT",
				async:false,
				success:function(result){
					$('#add-right-modal').modal('hide');
					if(result.code==100){
						swal("", "Save successfully", "success");
						$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
							ajaxQryAuth(authTotalPages);
                        });
					}else{
						swal("", "Save failure!", "error");
						$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
                            location.reload();
                        });
					}
				}
		
			})
			
			
		});
		
		
		//点击编辑模态框authorization
		$(document).on("click",".editAuth",function() {
			
			var authRoleId = $(this).parent().parent().find('td:eq(0)').text();
			var roleName = $(this).parent().parent().find('td:eq(1)').text();
			
			$('#editAuthModalLabel').text(' Edit authority role');
			$('#edit-authorizationr_right_form').find("input:eq(0)").val(roleName).attr("disabled","disabled");
			$('#edit-authorizationr_right_form .modal-footer').find("input:eq(0)").attr("name","authRoleId").val(authRoleId);
			
			$.ajax({
				url :"auth/authorization/"+authRoleId,
				type : "GET",
				async : false,
				success : function(result) {
					
					if(result.code==100){
						console.log(result.data.auth);
						$('#edit-authorizationr_right_form .bu-cont').empty().text(buJson[result.data.auth.bu]);
						$('#edit-authorizationr_right_form .function-cont').empty().text(functionJson[result.data.auth.function]);
						
						ShowAuthCheckbox($("#edit-authorization-checkbox-con"),authRightArr,result.data.auth.authRight,"authRight");
						ShowAuthCheckbox($("#edit-organization-checkbox-con"),organizationRightArr,result.data.auth.organizationRight,"organizationRight");
						ShowAuthCheckbox($("#edit-role-checkbox-con"),roleRightArr,result.data.auth.roleRight,"roleRight");
						ShowAuthCheckbox($("#edit-access-checkbox-con"),accessRightArr,result.data.auth.accessRight,"accessRight");
					
					}
				}
			});
			
			$("#edit-authorizationr_right_form .modal-footer").find("button:eq(1)").addClass("edit-auth-btn");
			$('#edit-right-modal').modal('show');
		});
		
		//保存编辑authorization
		$(document).on("click",".edit-auth-btn",function() {
			var data = $("#edit-authorizationr_right_form").serialize(0);
			
			$.ajax({
				url:"auth/authorization",
				type:"POST",
				data:data,
				async:false,
				success:function(result){
					$('#edit-right-modal').modal('hide');
					if(result.code==100){
						swal("", "Save successfully", "success");
						$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
							ajaxQryAuth(authCurPages);
                        });
					}else{
						swal("", "Save failure!", "error");
						$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
                            location.reload();
                        });
					}
				}
		
			})
			
			
		});
		
		//删除auth
		$(document).on("click",".deleteAuthConfirm",function() {
			
				 var authRoleId =$(this).parent().parent().find('td:first').text() ;
				 var authName =$(this).parent().parent().find('td:eq(1)').text() ;
				 
				 deleteAuthArticle("auth/authorization/"+authRoleId,authName);
		});
		
		$('.select_role_list').cxSelect({
			selects: ['bu','function'],
			jsonName: 'name',
			jsonValue: 'value'
		});
			
	});
	
	//admin模态框内容填充
	function ajaxShowAdminSelect(obj,data){
		console.log(data);
		obj.empty();
		
		$.ajax({
			url :"auth/authList",
			type : "POST",
			success : function(result) {
				
				var list = result.data.authList;
				
				if(result.code==100){
					var html = "";
					$.each(list, function(index,auth){
						if(data!=null&&auth.authRoleId == data){
							
							html+='<option value="'+auth.authRoleId+'" selected>'+auth.name+'</option>';
						}else{
							html+='<option value="'+auth.authRoleId+'">'+auth.name+'</option>';
						}
						
					});
				}
				
				obj.append(html);
			}
		});
	}
	
	//auth 模态框
	function ShowAuthCheckbox(obj,rightArr,data,name){
		
		obj.empty();
		if(data==null){
			$.each(rightArr, function(index,right){
				var html = "";
				html += "<div class='col-sm-4 checkBox-item' style='padding:0 5px 0 5px'><input style='margin-right: 5px;' type='checkbox' name='"+name+"' value="+index+"  title='"+right+"'/>" + right+"&nbsp;&nbsp;</div>";
				obj.append(html);
			});
		}else{
			var dataArr = data.split(",")
			$.each(rightArr, function(index,right){
				
				var html = "";
				if($.inArray(String(index),dataArr)==-1){
					html += "<div class='col-sm-4 checkBox-item' style='padding:0 5px 0 5px'><input style='margin-right: 5px;' type='checkbox'  name='"+name+"' value="+index+"  title='"+right+"'/>" + right+"&nbsp;&nbsp;</div>";
				}else{
					html += "<div class='col-sm-4 checkBox-item' style='padding:0 5px 0 5px'><input style='margin-right: 5px;' type='checkbox' checked name='"+name+"' value="+index+"  title='"+right+"'/>" + right+"&nbsp;&nbsp;</div>";
					
				}
				
				obj.append(html);
			});
		}
		
		
	}
	
	//删除auth
	function deleteAuthArticle(url,authName){  
		
	       swal({  
	          title:"",  
	          text:"Are you sure to delete '"+authName+"''?",  
	          type:"warning",  
	          showCancelButton:"true",  
	          showConfirmButton:"true",  
	          confirmButtonText:"OK",  
	          cancelButtonText:"Cancel",  
	          animation:"slide-from-top"  
	        }, 
	        function(isConfirm) { 
	        	if (isConfirm) {
	        		$.ajax({
						url :url,
						type : "DELETE",
						success : function(result) {
							console.log(result);
							if(result.code==100){
								swal("", "Delete successfully", "success");
								$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
									ajaxQryAuth(authCurPages);
	                            });
							}else{
								swal("", "Delete failure!", "error");
								$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
	                                location.reload();
	                            });
							}
						}
					});
	        	}
       });  
	        	
	};
	
	//删除admin
	function deleteAdminArticle(url,authName){  
		
	       swal({  
	          title:"",  
	          text:"Are you sure to delete '"+authName+"''?",  
	          type:"warning",  
	          showCancelButton:"true",  
	          showConfirmButton:"true",  
	          confirmButtonText:"OK",  
	          cancelButtonText:"Cancel",  
	          animation:"slide-from-top"  
	        }, 
	        function(isConfirm) { 
	        	if (isConfirm) {
	        		$.ajax({
						url :url,
						type : "DELETE",
						success : function(result) {
							console.log(result);
							if(result.code==100){
								swal("", "Delete successfully", "success");
								$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
									ajaxQryAdmin(adminCurPages);
	                            });
							}else{
								swal("", "Delete failure!", "error");
								$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
	                                location.reload();
	                            });
							}
						}
					});
	        	}
       });  
	        	
	};
	
	/**
	 * 发送ajax请求分页查询
	 * @param beginNum
	 * @returns
	 */
	function ajaxQryAdmin(beginNum){
		$.ajax({
			url : "user/list",
			data : "beginNum=" + beginNum,
			async : false,
			success : function(result) {
				//解析JSON数据，显示员工详情
				showUserList(result.data);
				//解析JSON数据，显示分页信息
				showPageInfoMsg($("#admin-pageInfo-cont"),result);
				//解析JSON数据，显示分页条 
				showPageScroll($("#admin-navigatepageNums"),result,"ajaxQryAdmin");
				adminTotalPages = result.data.pageInfo.total;
				adminCurPages =result.data.pageInfo.pageNum;
			}		
		});
	};	
	
	/**
	 * 发送ajax请求分页查询
	 * @param beginNum
	 * @returns
	 */
	function ajaxQryAuth(beginNum){
		$.ajax({
			url : "auth/list",
			data : "beginNum=" + beginNum,
			async : false,
			success : function(result) {
				//解析JSON数据，显示员工详情
				showAuthList(result.data);
				//解析JSON数据，显示分页信息
				showPageInfoMsg($("#auth-pageInfo-cont"),result);
				//解析JSON数据，显示分页条 
				showPageScroll($("#auth-navigatepageNums"),result,"ajaxQryAuth");
				authTotalPages = result.data.pageInfo.total;
				authCurPages =result.data.pageInfo.pageNum;
				
			}		
		});
	};

	//加载role 数据
	function showUserList(data){
		
		var list = data.pageInfo.list;
		var tab = $("#user-tb");
		tab.empty();

		$.each(list, function(index,user){
			
			var html = "";
			html += "<tr><td>" + user.userId+ "</td>";
			html += "<td>" + user.email + "</td>";    
			html += "<td>" +authJson[user.authorizationRole ]+ "</td>";   
			html += "<td>"+user.updateTime+"</td>";
			
			html += "<td>" + user.updateOperator+ "</td>";
			
			if($.inArray('1',adminRightArr)!=-1){
				html += "<td><a href='javascript:void(0)' title='Edit' class='editAdmin'><span class='glyphicon glyphicon-pencil' ></span></a>&nbsp;&nbsp;&nbsp";
			}else{
				html += "<td>";
			}
			
			if($.inArray('3',adminRightArr)!=-1){
				html += "<a href='javascript:void(0)' title='Delete'   class='deleteAdminConfirm' ><span class='glyphicon glyphicon-trash' ></span></a></td></tr>";
			}else{
				html += "<td>";
			}
			
			
			tab.append(html);
		});
	}; 
	
	
	//加载auth 数据
	function showAuthList(data){
		
		var list = data.pageInfo.list;
		var tab = $("#auth-tb");
		tab.empty();

		$.each(list, function(index,auth){
			
			var html = "";
			html += "<tr><td>" + auth.authRoleId+ "</td>";
			html += "<td>" + auth.name + "</td>";
			if(auth.bu!=null&&auth.bu!= ""){
				html += "<td>" +buJson[auth.bu] + "</td>";
			}else{
				html += "<td></td>";
			}
			
			if(auth.function!=null&&auth.function!= ""){
				html += "<td>" +functionJson[auth.function]  + "</td><td>";
			}else{
				html += "<td></td><td>";
			}
			
		
			if(auth.authRight!=null&&auth.authRight!= ""){
				var  authRight = auth.authRight.split(',');
				for(var i in authRight) {
					html +=authRightArr[authRight[i]]+"</br> "; 
				}
			}
			
			html += "</td><td>" 
				console.log(auth.organizationRight);
			if(auth.organizationRight!=null&&auth.organizationRight!= ""){
				
				var  organizationRight = auth.organizationRight.split(',');
				for(var i in organizationRight) {
					html +=organizationRightArr[organizationRight[i]]+"</br> "; 
				}
			}
			
			html += "</td><td>" 
			if(auth.roleRight!=null&&auth.roleRight!= ""){
				var  roleRight = auth.roleRight.split(',');
				for(var i in roleRight) {
					html +=roleRightArr[roleRight[i]]+"</br> "; 
				}
			}
			
			html += "</td><td>" 
			if(auth.roleRight!=null&&auth.roleRight!= ""){
				var  accessRight = auth.accessRight.split(',');
				for(var i in accessRight) {
					html +=accessRightArr[accessRight[i]]+"</br> "; 
				}
			}
			
			html += "</td>"
				
			html += "<td>"+auth.updateTime+"</td>";
			html += "<td>" + auth.updateOperator+ "</td>";
			if($.inArray('4',adminRightArr)!=-1){
				html += "<td><a href='javascript:void(0)' title='Edit' class='editAuth'><span class='glyphicon glyphicon-pencil' ></span></a>&nbsp;&nbsp;&nbsp";
			}else{
				html += "<td>";
			}
			
			if($.inArray('6',adminRightArr)!=-1){
				html += "<a href='javascript:void(0)' title='Delete'   class='deleteAuthConfirm' ><span class='glyphicon glyphicon-trash' ></span></a></td></tr>";
			}else{
				html += "<td>";
			}
			
			
			tab.append(html);
		});
	}; 
	
	/**
	 * 解析JSON数据，显示分页条信息
	 * @param responseData
	 * @returns
	 */
	function showPageScroll(obj,responseData,functionName) {
		//分页条信息集合
		var navigatepageNums = responseData.data.pageInfo.navigatepageNums;
		//获取当前页面页码
		var curNum = responseData.data.pageInfo.pageNum;
		//总页数
		var pages = responseData.data.pageInfo.pages;
		//是否有上一页的标识
		var hasPreviousPage = responseData.data.pageInfo.hasPreviousPage;
		//是否有下一页的标识
		var hasNextPage = responseData.data.pageInfo.hasNextPage;
		//拼接分页条html
		var html = '';
		//清空上一次操作的分页条信息
		obj.empty();
		html += '<li><a  href="javascript:void(0)" onclick="'+functionName+'(1)">First</a></li>';
		if( hasPreviousPage ) {
			html += '<li><a href="javascript:void(0)" aria-label="Previous" onclick="'+functionName+'('+(curNum-1)+')"><span aria-hidden="true">&laquo;</span></a></li>';	
		}	
		$.each(navigatepageNums, function(index, pageNum) {
			if( curNum == pageNum ) {
				html += '<li class="active"><a href="javascript:void(0)" onclick="'+functionName+'('+pageNum+')">'+pageNum+'</a></li>';
			} else {
				html += '<li><a href="javascript:void(0)" onclick="'+functionName+'('+pageNum+')">'+pageNum+'</a></li>';
			}		
		});
		if( hasNextPage ) {
			html += '<li><a  href="javascript:void(0)" aria-label="Next" onclick="'+functionName+'('+(curNum+1)+')"><span aria-hidden="true">&raquo;</span></a></li>';	
		}
		html += '<li><a href="javascript:void(0)" onclick="'+functionName+'('+pages+')">Last</a></li>';
		obj.append(html);
	};
	
	/**
	 * 解析JSON数据，显示分页信息：总页数，当前页数，总记录数
	 * @param responseData
	 * @returns
	 */
	function showPageInfoMsg(obj,responseData) {
		//当前页数
		var pageNum = responseData.data.pageInfo.pageNum;console.log("info:"+obj);
		obj.find('span:eq(0)').text(pageNum);
		//总页数
		var pages = responseData.data.pageInfo.pages;
		obj.find('span:eq(1)').text(pages);
		//总记录条数
		var total = responseData.data.pageInfo.total;
		obj.find('span:eq(2)').text(total);
		
	};	
	</script>
</body>
</html>
