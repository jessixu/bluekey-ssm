<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BLUE KEY</title>

 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>
 
 <base href=" <%=basePath%>">

<script src="static/js/jquery-1.10.2.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/sweet-alert.js" type="text/javascript" charset="utf-8"></script>

<link rel="stylesheet" type="text/css" href="static/css/sweet-alert.css"/>	
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
			
			<div class="row breadcrumb-nav" >
				<div class="col-xs-12 col-sm-12 col-sm-push-0">
					<ol class="breadcrumb">
						<li><a href="user/query">Home</a></li>
						<li><a href="#">Setting</a></li>
						<li class="active">Organization manage</li>

					</ol>
				</div>
			</div>
			<legend>Organization List</legend>
			<div class="row clearfix">
				<div class="col-md-12 column">
					<div class="tabbable" id="tabs-368872">
						<ul class="nav nav-tabs" >
							<li class="active" >
								 <a href="#panel-commodity" data-toggle="tab" >Commodity</a>
							</li>
							<li >
								 <a href="#panel-jobRole" data-toggle="tab"> Job role</a>
							</li>
							<li>
								 <a href="#panel-function" data-toggle="tab" >Function</a>
							</li>
							<li >
								 <a href="#panel-bu" data-toggle="tab"> Business Unit</a>
							</li>
							
							
							
						</ul>
						<div class="tab-content">
							<div class="tab-pane fade" id="panel-bu">
								<div style="padding:0 20px 20px 20px;min-height:480px">
									<div class="page-header">
										<c:if test="${Arrays.binarySearch(loginUser.authorization.organizationRight.split(','),'2')>= 0}">   
											<a href="javascript:void(0)" class="btn btn-primary" id="addBu" style="background: #5c7ebd; border: 0;"> 
												<span class="glyphicon glyphicon-plus"></span> add an bu
											</a>
										</c:if>
										
									</div>
									<div class="table-responsive">
										<table class="table  table-hover" id="BuTable" >
											<thead>
												<tr class="active">
													<th>ID</th>
													<th>BU name</th>
													<th>Update time</th>
													<th>Update operator</th>
													<th>Operatedf </th>
												</tr>
											</thead>
											<tbody id="access-tb">
												<c:forEach var="bu" items="${buList}" varStatus="status">
													<tr>
														<td>${bu.buId}</td>
														<td>${bu.name}</td>
														<td><fmt:formatDate value="${bu.updateTime}"  pattern="yyyy-MM-dd HH:mm:ss" /></td>
														<td>${bu.updateOperator}</td>
													   	
														<td>	
															<c:if test="${Arrays.binarySearch(loginUser.authorization.organizationRight.split(','),'1')>=0}">  
																<a href="javascript:void(0)" title="Edit" class="editBu"><span class="glyphicon glyphicon-pencil"></span></a>&nbsp;&nbsp;&nbsp
															</c:if>
															<c:if test="${Arrays.binarySearch(loginUser.authorization.organizationRight.split(','),'3')>=0}"> 
																<a href="javascript:void(0)" title="Delete"  class="deleteBuConfirm"><span class="glyphicon glyphicon-trash" ></span></a>
															</c:if>
														</td>
														
											    </c:forEach>
											</tbody>
										</table>
									</div>
								</div>
								
							</div>
							<div class="tab-pane fade " id="panel-function">
								<div style="padding:0 20px 20px 20px;min-height:480px">
									<div class="page-header">
										<c:if test="${Arrays.binarySearch(loginUser.authorization.organizationRight.split(','),'5')>= 0}"> 
											<a href="javascript:void(0)" class="btn btn-primary" id="addFunction" style="background: #5c7ebd; border: 0;"> 
												<span class="glyphicon glyphicon-plus"></span> add an function
											</a>
										</c:if>
									</div>
									<div class="table-responsive">
										<table class="table  table-hover" >
											<thead>
												<tr class="active">
													<th>ID</th>
													<th>Function name</th>
													<th>parent</th>
													<th>Update time</th>
													<th>Update operator</th>
													<th>Operate</th>
												</tr>
											</thead>
											<tbody id="access-tb">
												<c:forEach var="function" items="${functionList}" varStatus="status">
													<tr>
														<td>${function.fId}</td>
														<td>${function.name}</td>
														<td>${buMap[function.buId]}</td>
														<td><fmt:formatDate value="${function.updateTime}"  pattern="yyyy-MM-dd HH:mm:ss" /></td>
														<td>${function.updateOperator}</td>
														
														<td>
															<c:if test="${Arrays.binarySearch(loginUser.authorization.organizationRight.split(','),'4')>=0}">  
																<a href="javascript:void(0)" title="Edit" class="editFunction"><span class="glyphicon glyphicon-pencil"></span></a>&nbsp;&nbsp;&nbsp
															</c:if>	
															<c:if test="${Arrays.binarySearch(loginUser.authorization.organizationRight.split(','),'6')>=0}">  
																<a href="javascript:void(0)" title="Delete"   class="deleteFunctionConfirm"><span class="glyphicon glyphicon-trash" ></span></a>
															</c:if>
														</td>
													</tr>
											    </c:forEach>
											</tbody>
										</table>
									</div>
								</div>
								
							</div>
							<div class="tab-pane fade " id="panel-jobRole">
								<div style="padding:0 20px 20px 20px;min-height:480px">
									
									<div class="page-header">
										<c:if test="${Arrays.binarySearch(loginUser.authorization.organizationRight.split(','),'8')>= 0}"> 
											<a href="javascript:void(0)" class="btn btn-primary" id="addJobRole" style="background: #5c7ebd; border: 0;"> 
												<span class="glyphicon glyphicon-plus"></span> add an job Role
											</a>
										</c:if>
									</div>
									<div class="table-responsive">
										<table class="table  table-hover" >
											<thead>
												<tr class="active">
													<th>ID</th>
													<th>Job Role name</th>
													<th>parent</th>
													<th>Update time</th>
													<th>Update operator</th>
													<th>Operate</th>
												</tr>
											</thead>
											<tbody id="job-role-tb">
												<c:forEach var="jobRole" items="${jobRoleList}" varStatus="status">
													<tr>
														<td>${jobRole.jId}</td>
														<td>${jobRole.name}</td>
														<td>${functionMap[jobRole.fId]}</td>
														<td><fmt:formatDate value="${jobRole.updateTime}"  pattern="yyyy-MM-dd HH:mm:ss" /></td>
														<td>${jobRole.updateOperator}</td>
														
														<td>	
															<c:if test="${Arrays.binarySearch(loginUser.authorization.organizationRight.split(','),'7')>=0}"> 
																<a href="javascript:void(0)" title="Edit" class="editJobRole"><span class="glyphicon glyphicon-pencil"></span></a>&nbsp;&nbsp;&nbsp
															</c:if>
															<c:if test="${Arrays.binarySearch(loginUser.authorization.organizationRight.split(','),'9')>=0}"> 
																<a href="javascript:void(0)" title="Delete" class="deleteJobRoleConfirm"><span class="glyphicon glyphicon-trash" ></span></a>
															</c:if>
														</td>
														
													</tr>
											    </c:forEach>
											</tbody>
										</table>
									</div>
								</div>
								
							</div>
							<div class="tab-pane fade  in active" id="panel-commodity">
								<div style="padding:0 20px 20px 20px;min-height:480px">
										<div class="page-header">
											<c:if test="${fn:contains(loginUser.authorization.organizationRight, '11')}"> 
												<a href="javascript:void(0)" class="btn btn-primary" id="addCommodity" style="background: #5c7ebd; border: 0;"> 
													<span class="glyphicon glyphicon-plus"></span> add an commodity
												</a>
											</c:if>
										</div>
										<div class="table-responsive">
											<table class="table  table-hover" >
												<thead>
													<tr class="active">
														<th>ID</th>
														<th>Commodity name</th>
														<th>parent</th>
														<th>Update time</th>
														<th>Update operator</th>
														<th>Operate</th>
													</tr>
												</thead>
												<tbody id="access-tb">
													<c:forEach var="commodity" items="${commodityList}" varStatus="status">
														<tr>
															<td>${commodity.cId}</td>
															<td>${commodity.name}</td>
															<td>${jobRoleMap[commodity.jId]}</td>
															<td><fmt:formatDate value="${commodity.updateTime}"  pattern="yyyy-MM-dd HH:mm:ss" /></td>
															<td>${commodity.updateOperator}</td>
															
															<td>	
																<c:if test="${fn:contains(loginUser.authorization.organizationRight, '10')}"> 
																	<a href="javascript:void(0)" title="Edit" class="editCommodity"><span class="glyphicon glyphicon-pencil"></span></a>&nbsp;&nbsp;&nbsp
																</c:if>
																<c:if test="${fn:contains(loginUser.authorization.organizationRight, '12')}">
																	<a href="javascript:void(0)" title="Delete" class="deleteCommodityConfirm"><span class="glyphicon glyphicon-trash" ></span></a>
																</c:if>
															</td>
															
														</tr>
												    </c:forEach>
												</tbody>
											</table>
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
		</div>
	</div>
		
	<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title" id="addModalLabel"></h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" role="form" id="add-form">
							<div class="modal-body" style="width: 610px;">
								<div>
									<div class="form-group">
										<label for="inputRecevieAddress" class="col-sm-2 control-label" id ="labName">Name:</label>
										<div class="col-sm-6">
											<input type="text" class="form-control" name="name"  />	
										</div>
									</div>
									
									<div class="form-group"  id="add-select-container">
										
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary add" style="background: #5C7EBD; border: 0;">Add</button>
							</div>
						</form>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
	</div>
		
		
	<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title" id="editModalLabel"></h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" role="form" id="edit-form">
							<div class="modal-body" style="width: 610px;">
								<div>
									<div class="form-group">
										<label for="inputRecevieAddress" class="col-sm-2 control-label" id ="labName">Name:</label>
										<div class="col-sm-6 ">	
											<input type="text" class="form-control" name="name"  />	 
										</div>
									</div>
									
									<div class="form-group" id="edit-select-container" >
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<input type="hidden" name="" value="" >
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary edit" style="background: #5C7EBD; border: 0;">Save</button>
							</div>
						</form>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
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
			///////////////////////////////// commodity
			//点击Commodity新增模态框
			$("#addCommodity").click(function() {
				var tab = $("#add-select-container");

				$('#addModalLabel').text('Add Commodity');
				$('.add').attr("id","add-commodity-btn");
				$("#add-form input[name='name']:first").val('');
				ajaxDataHtml(tab,"jId","organization/getJobRoleList","","jobRoleList");
				
				$('#addModal').modal('show');
			});
			
			//Commodity新增
			$(document).on("click","#add-commodity-btn",function() {
				var data = $("#add-form").serialize();
				
				$.ajax({
					url :"organization/commodity",
					type : "POST",
					data : data+"&_method=PUT",
					success : function(result) {
						$('#addModal').modal('hide');
						if(result.code==100){
							swal("", "Add successfully", "success");
							$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
                                location.reload();
								
                            });
						}else{
							swal("", "Add failure!", "error");
							$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
                                location.reload();
                            });
						}
					}
				});
				
			});
			
			
			//Commodity 编辑按钮模态框
			$(document).on("click",".editCommodity",function() {
				var name =$(this).parent().parent().find('td:eq(1)').text() ;
				var cId =$(this).parent().parent().find('td:eq(0)').text() ;
				var parentName =$(this).parent().parent().find('td:eq(2)').text() ;
				var tab = $("#edit-select-container");
				
				$('.edit').attr("id","edit-commodity-btn");
				$("#edit-form input[name='name']:first").val(name);
				$("#edit-form input[type='hidden']:first").attr("name","cId").attr("value",cId);
				$('#editModalLabel').text('Edit Commodity');
				ajaxDataHtml(tab,"jId","organization/getJobRoleList",parentName,"jobRoleList");
				 
				$('#editModal').modal('show');
			});
			
			
			//Commodity编辑保存
			$(document).on("click","#edit-commodity-btn",function() {
				var data = $("#edit-form").serialize();
				var cId =$(this).parent().parent().find('td:eq(0)').text() ;
				$.ajax({
					url :"organization/commodity/"+cId,
					type : "POST",
					data :data,
					success : function(result) {
						$('#editModal').modal('hide');
						if(result.code==100){
							swal("", "Add successfully", "success");
							$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
                                location.reload();
                            });
						}else{
							swal("", "Add failure!", "error");
							$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
                                location.reload();
                            });
						}
					}
				});
				
			});
			

			//Commodity 删除按钮
			$(document).on("click",".deleteCommodityConfirm",function() {
				
				 var cId =$(this).parent().parent().find('td:first').text() ;
				 var commodityName =$(this).parent().parent().find('td:eq(1)').text() ;
				 var URL = "organization/commodity/"+cId;
				
				 deleteArticle(commodityName,URL);
			});
			
			///////////////////////////////// job role
			
			//点击job role新增模态框
			$("#addJobRole").click(function() {
				var tab = $("#add-select-container");
				
				$('.add').attr("id","add-jobRole-btn");
				$('#addModalLabel').text('Add Job Role');
				$("#add-form input[name='name']:first").val('');
				ajaxDataHtml(tab,"fId","organization/getFunctionList","","functionList");
				
				$('#addModal').modal('show');
			});
			
			//Commodity新增
			$(document).on("click","#add-jobRole-btn",function() {
				var data = $("#add-form").serialize();
				
				$.ajax({
					url :"organization/jobRole",
					type : "POST",
					data : data+"&_method=PUT",
					success : function(result) {
						$('#addModal').modal('hide');
						if(result.code==100){
							swal("", "Add successfully", "success");
							$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
                               
								location.reload();
								
                            });
						}else{
							swal("", "Add failure!", "error");
							$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
                                location.reload();
                            });
						}
					}
				});
				
			});
			
			
			//job role 编辑按钮模态框
			$(document).on("click",".editJobRole",function() {
				var name =$(this).parent().parent().find('td:eq(1)').text() ;
				var jId =$(this).parent().parent().find('td:eq(0)').text() ;
				var parentName =$(this).parent().parent().find('td:eq(2)').text() ;
				var tab = $("#edit-select-container");
				
				$('.edit').attr("id","edit-jobRole-btn");
				$("#edit-form input[name='name']:first").val(name);
				$("#edit-form input[type='hidden']:first").attr("name","jId").attr("value",jId);
				$('#editModalLabel').text('Edit Job Role');
				
				ajaxDataHtml(tab,"fId","organization/getFunctionList",parentName,"functionList");
				 
				$('#editModal').modal('show');
			});
			
			
			//job role编辑保存
			$(document).on("click","#edit-jobRole-btn",function() {
				var data = $("#edit-form").serialize();
				var Id =$(this).parent().parent().find('td:eq(0)').text() ;
				$.ajax({
					url :"organization/jobRole/"+Id,
					type : "POST",
					data :data,
					success : function(result) {
						$('#editModal').modal('hide');
						if(result.code==100){
							swal("", "Add successfully", "success");
							$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
                                location.reload();
                            });
						}else{
							swal("", "Add failure!", "error");
							$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
                                location.reload();
                            });
						}
					}
				});
				
			});
			
			//JobRole 删除按钮
			$(document).on("click",".deleteJobRoleConfirm",function() {
				
				 var jId =$(this).parent().parent().find('td:first').text() ;
				 var jobRoleName =$(this).parent().parent().find('td:eq(1)').text() ;
				 var URL = "organization/jobRole/"+jId;
				 console.log(URL);
				 deleteArticle(jobRoleName,URL);
			});
			
			///////////////////// function
			
			//点击function新增模态框
			$("#addFunction").click(function() {
				var tab = $("#add-select-container");
				
				$('.add').attr("id","add-function-btn");
				$('#addModalLabel').text('Add Function');
				$("#add-form input[name='name']:first").val('');
				ajaxDataHtml(tab,"buId","organization/getBuList","","buList");
				
				$('#addModal').modal('show');
			});
			
			//function新增
			$(document).on("click","#add-function-btn",function() {
				var data = $("#add-form").serialize();
				
				$.ajax({
					url :"organization/function",
					type : "POST",
					data : data+"&_method=PUT",
					success : function(result) {
						$('#addModal').modal('hide');
						if(result.code==100){
							swal("", "Add successfully", "success");
							$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
								location.reload();
								
                            });
						}else{
							swal("", "Add failure!", "error");
							$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
                                location.reload();
                            });
						}
					}
				});
				
			});
			
			
			//function 编辑按钮模态框
			$(document).on("click",".editFunction",function() {
				var name =$(this).parent().parent().find('td:eq(1)').text() ;
				var fId =$(this).parent().parent().find('td:eq(0)').text() ;
				var parentName =$(this).parent().parent().find('td:eq(2)').text() ;
				var tab = $("#edit-select-container");
				
				$('.edit').attr("id","edit-function-btn");
				$("#edit-form input[name='name']:first").val(name);
				$("#edit-form input[type='hidden']:first").attr("name","fId").attr("value",fId);
				$('#editModalLabel').text('Edit Job Role');
				
				ajaxDataHtml(tab,"buId","organization/getBuList",parentName,"buList");
				 
				$('#editModal').modal('show');
			});
			
			
			//function编辑保存
			$(document).on("click","#edit-function-btn",function() {
				var data = $("#edit-form").serialize();
				var Id =$(this).parent().parent().find('td:eq(0)').text() ;
				$.ajax({
					url :"organization/function/"+Id,
					type : "POST",
					data :data,
					success : function(result) {
						$('#editModal').modal('hide');
						if(result.code==100){
							swal("", "Add successfully", "success");
							$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
                                location.reload();
                            });
						}else{
							swal("", "Add failure!", "error");
							$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
                                location.reload();
                            });
						}
					}
				});
				
			});
			
			
			//Function 删除按钮
			$(document).on("click",".deleteFunctionConfirm",function() {
				
				 var fId =$(this).parent().parent().find('td:first').text() ;
				 var functionName =$(this).parent().parent().find('td:eq(1)').text() ;
				 var URL = "organization/function/"+fId;
				 console.log(URL);
				 deleteArticle(functionName,URL);
			});
			
			
			////////////////////////  BU
			
			
			//点击BU新增模态框
			$("#addBu").click(function() {
				var tab = $("#add-select-container");
				$("#add-form input[name='name']:first").val('');
				$('.add').attr("id","add-bu-btn");
				$('#addModalLabel').text('Add Business Unit');
				$("#add-select-container").empty();
				$('#addModal').modal('show');
			});
			
			//BU新增
			$(document).on("click","#add-bu-btn",function() {
				var data = $("#add-form").serialize();
				
				$.ajax({
					url :"organization/bu",
					type : "POST",
					data : data+"&_method=PUT",
					success : function(result) {
						$('#addModal').modal('hide');
						if(result.code==100){
							swal("", "Add successfully", "success");
							$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
                                location.reload();
                            });
						}else{
							swal("", "Add failure!", "error");
							$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
                                location.reload();
                            });
						}
					}
				});
				
			});
			
			//bu 编辑按钮模态框
			$(document).on("click",".editBu",function() {
				var name =$(this).parent().parent().find('td:eq(1)').text() ;
				var buId =$(this).parent().parent().find('td:eq(0)').text() ;
				var parentName =$(this).parent().parent().find('td:eq(2)').text() ;
				var tab = $("#edit-select-container");
				
				$('.edit').attr("id","edit-bu-btn");
				$("#edit-form input[name='name']:first").val(name);
				$("#edit-form input[type='hidden']:first").attr("name","buId").attr("value",buId);
				$('#editModalLabel').text('Edit Business Unit');
				$("#edit-select-container").empty();
				$('#editModal').modal('show');
			});
			
			
			//bu 编辑保存
			$(document).on("click","#edit-bu-btn",function() {
				var data = $("#edit-form").serialize();
				var Id =$(this).parent().parent().find('td:eq(0)').text() ;
				$.ajax({
					url :"organization/bu/"+Id,
					type : "POST",
					data :data,
					success : function(result) {
						$('#editModal').modal('hide');
						if(result.code==100){
							swal("", "Add successfully", "success");
							$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
                                location.reload();
                            });
						}else{
							swal("", "Add failure!", "error");
							$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
                                location.reload();
                            });
						}
					}
				});
				
			});
			
			//Bu 删除按钮
			$(document).on("click",".deleteBuConfirm",function() {
				
				 var buId =$(this).parent().parent().find('td:first').text() ;
				 var buName =$(this).parent().parent().find('td:eq(1)').text() ;
				 var URL = "organization/bu/"+buId;
				 console.log(URL);
				 deleteArticle(buName,URL);
			});
			
			
			//模态框内容填充
			function ajaxDataHtml(tab,id,URL,parentName,listName){
				tab.empty();
				
				$.ajax({
					url :URL,
					type : "POST",
					success : function(result) {
						
						var list = result.data[listName];
						console.log(list);
						if(result.code==100){
							var html = "<label class='col-sm-2 control-label'>Parent:</label><div class='col-sm-6'><select class='form-control' name='"+id+"' >";
							$.each(list, function(index,item){
								if(parentName==null){
									 html+='<option value="'+item[id]+'">'+item.name+'</option>';
								}
								else{
									
									if(parentName != item.name){
										 html+='<option value="'+item[id]+'">'+item.name+'</option>';
									}else{
										
										 html+='<option value="'+item[id]+'"selected>'+item.name+'</option>';
									}
								}
							   
							});
						}
						
						tab.append(html+"</select><div>");
					}
				});
			}
			//删除确认
			function deleteArticle(Name,URL){  
				
			       swal({  
			          title:"",  
			          text:"Are you sure to delete ' "+Name+" '?",  
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
								url :URL,
								type : "DELETE",
								success : function(result) {
									console.log(result);
									if(result.code==100){
										swal("", "Delete successfully", "success");
										$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
			                                location.reload();
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
			
			
			
			
		});
			
		
	</script>
</body>
</html>
   