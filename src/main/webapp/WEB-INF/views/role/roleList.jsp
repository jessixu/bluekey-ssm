<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<script type="text/javascript">
$(document).ready(function(){
	var buRight = "${loginUser.authorization.bu}";
	var functionRight = "${loginUser.authorization.function}";
	
	
});

//alert(functionRight)

</script>
</head>
<body style="overflow:scroll;overflow-x:hidden">
	<div class=" wrapper">
		<div class="page">
			<jsp:include page="../top.jsp" flush="true" />
			<div class="container">
				<div class="row breadcrumb-nav" >
					<div class="col-xs-12 col-sm-12 col-sm-push-0">
						<ol class="breadcrumb">
							<li><a href="user/query">Home</a></li>
							<li><a href="#">Setting</a></li>
							<li class="active">Role manage</li>
	
						</ol>
					</div>
				</div>
	
				<legend>Role List</legend>
				<div class="col-md-12 select_role_list" >
					
					<form class="form-horizontal" id="query_role_form"  role="form" style="margin-top: 12px;">
						<div id="select_role" class="col-md-11">
							<div>
								<label for="inputParent_part"
									class="col-sm-1 control-label role-select-label">BU:</label>
								<div class="col-sm-2">
									<select class="bu form-control" name="bu" data-value="${loginUser.authorization.bu}" data-url="role/getBuList" data-required="true" ></select>
								</div>
							</div>
							<div>
								<label for="inputParent_part"
									class="col-sm-1 control-label role-select-label">Function:</label>
								<div class="col-sm-2">
									<select class="function form-control" name="function" data-value="${loginUser.authorization.function}" data-url="role/getFunctionList" data-json-space="function"  data-required="false" data-first-title="Select function" ></select>
								</div>
							</div>
							<div>
								<label for="inputParent_part"
									class="col-sm-1 control-label role-select-label" style="">Job
									Role:</label>
								<div class="col-sm-2">
									<select class="jobRole form-control" name="jobRole" data-value="" data-url="role/getJobroleList" data-json-space="jobRole" data-required="false" data-first-title="Select job role"  ></select>
								</div>
							</div>
							<div>
								<label for="inputParent_part" class="col-sm-1 control-label"
									role-select-label>Commodity:</label>
								<div class="col-sm-2">
									<select class="commodity form-control" name="commodity" data-value=""  data-url="role/getCommodityList" data-json-space="commodity" data-required="false" data-first-title="Select commodity" ></select>
								</div>
							</div>
						</div>
					</form>
					<div class="col-md-1">
						<button class="btn btn-info btn" id="query-role-btn" style="background: #5c7ebd; border: 0;">Query</button>
					</div>
				</div>
				<div class="page-header" style="min-height: 50px;">
					 
				
					<c:if test="${Arrays.binarySearch(loginUser.authorization.roleRight.split(','),'2')>= 0}">  
						<div style="margin-top: 100px; margin-bottom: 10px;">
							<a href="javascript:void(0)" class="btn btn-info" id="add-role-btn" style="background: #5c7ebd; border: 0;"> 
								<spanclass="glyphicon glyphicon-plus"></span> add an role
							</a>
						</div>
					</c:if>
					
				</div>
				<div class="table-responsive">
					<table class="table  table-hover" >
						<thead>
							<tr class="active">
								<th style="width:5%">ID</th>
								<th style="width:10%">BU</th>
								<th style="width:10%">Function</th>
								<th style="width:20%">Job role</th>
								<th style="width:15%">Commodity</th>
								<th style="width:15%">Update time</th>
								<th >Update operator</th>
								<th style="width:5%">operate</th>
							</tr>
						</thead>
						<tbody id= "role-tb">
							
						</tbody>
					</table>
				</div>
				<div class="row">
					<div class="col-md-8" id = "pageInfo-cont">
						Current Page&nbsp;&nbsp;<span id="pageNum"></span>&nbsp;&nbsp;,Total&nbsp;&nbsp;<span  id="pages"></span>&nbsp;&nbsp;page&nbsp;,Total&nbsp;&nbsp;<span  id="total"></span>&nbsp;&nbsp;record
					</div>
					<div class="col-md-4" id = "navigation-cont">
						<nav aria-label="Page navigation">
						  <ul class="pagination" id="navigatepageNums">				  	
						  </ul>
						</nav>
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
	<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width:900px">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h4 class="modal-title" id="addModalLabel"></h4>
					</div>
					<div class="modal-body" >
						<div class = "add_select_role_list" style="margin-left: 10px; margin-right: 30px;">
							<form class="form-horizontal" id="add_role_form" method="PUT" role="form" action="role/role">
								<div id="add-select_role" >
									<div class="form-group">
										<label for="inputParent_part" class="col-sm-2 control-label"><span style="color: red">*</span>BU:</label>
										<div class="col-sm-6 bu-cont">
											<select class="bu form-control" name="bu" data-value=""   data-url="role/getBuList" data-required="true"  ></select>
										</div>
									</div>
									<div class="form-group">
										<label for="inputParent_part" class="col-sm-2 control-label"><span style="color: red">*</span>Function:</label>
										<div class="col-sm-6 function-cont">
											<select class="function form-control" name="function" data-value="" " data-url="role/getFunctionList" data-json-space="function" data-required="true"  ></select>
										</div>
									</div>
									<div class="form-group">
										<label for="inputParent_part" class="col-sm-2 control-label"><span
											style="color: red">*</span>Job Role:</label>
										<div class="col-sm-6 jobRole-cont">
											<select class="jobRole form-control" name="jobRole" data-value="10" data-url="role/getJobroleList" data-json-space="jobRole" data-required="true"    ></select>
										</div>
									</div>
									<div class="form-group">
										<label for="inputParent_part" class="col-sm-2 control-label">Commodity:</label>
										<div class="col-sm-6 commodity-cont">
											<select class="commodity form-control" name="commodity" data-value=""  data-url="role/getCommodityList" data-json-space="commodity" data-required="true"  ></select>
										</div>
									</div>
								</div>
								
								<div class="form-group">
									<label for="inputPlatform" class="col-sm-2 control-label">Access:</label>
									<div class="col-sm-10 check-role">
										<hr>
										<span style="color: red">*</span>
										<label >General access</label></br>
										<div id="add-general-checkbox-cont" class="row"></div>
										
										<hr>
										<label>Function access</label></br>
										<div id="add-function-checkbox-cont" class="row"></div>
										
									</div>
								</div>
								<div class="modal-footer">
									<div class="col-sm-offset-2 col-sm-10">
										<button type="button" class="btn btn-primary add-role-btn" style="background: #5C7EBD; border: 0;">Add</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
	</div>
	
	<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width:900px">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h4 class="modal-title" id="editModalLabel"></h4>
					</div>
					<div class="modal-body" >
						<div class = "select_role_list" style="margin-left: 10px; margin-right: 30px;">
							<form class="form-horizontal" id="edit_role_form" method="post" role="form" action="role/role">
								<div id="edit-select_role" >
									<div class="form-group">
										<label for="inputParent_part" class="col-sm-2 control-label"><span style="color: red">*</span>BU:</label>
										<div class="col-sm-6  control-label bu-cont" style="text-align: left;">
										</div>
									</div>
									<div class="form-group">
										<label for="inputParent_part" class="col-sm-2 control-label"><span style="color: red">*</span>Function:</label>
										<div class="col-sm-6 control-label function-cont" style="text-align: left;"></div>
									</div>
									<div class="form-group">
										<label for="inputParent_part" class="col-sm-2 control-label"><span
											style="color: red">*</span>Job Role:</label>
										<div class="col-sm-6 control-label jobRole-cont" style="text-align: left;"></div>
									</div>
									<div class="form-group">
										<label for="inputParent_part" class="col-sm-2 control-label">Commodity:</label>
										<div class="col-sm-6 control-label commodity-cont" style="text-align: left;"></div>
									</div>
								</div>
								
								<div class="form-group">
									<label for="inputPlatform" class="col-sm-2 control-label">Access:</label>
									<div class="col-sm-10 check-role">
										
										<hr>
										<span style="color: red">*</span>
										<label >General access</label></br>
										<div id="edit-general-checkbox-cont" class="row"></div>
										
										<hr>
										<label>Function access</label></br>
										<div id="edit-function-checkbox-cont" class="row"></div>
										
									</div>
								</div>
								<div class="modal-footer">
									<div class="col-sm-offset-2 col-sm-10">
										<input type="hidden" name="roleId" value="" id="roleId">
										<button type="button" class="btn btn-primary edit-role-btn" style="background: #5C7EBD; border: 0;">Save</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal -->
	</div>
	<jsp:include page="../bottom.jsp" flush="true" />
	<script>
	var totalPages = 0;
	var curPages = 0;
	var roleRightArr = "${loginUser.authorization.roleRight}".split(',');
	var auth = "${loginUser.authorization}";
	var buRight = "${loginUser.authorization.bu}";
	var functionRight = "${loginUser.authorization.function}";
	console.log(buRight);	
	
	
	$(document).ready(function(){
		$(".top").on("click", function() {
            $("body").stop().animate({  
                scrollTop: 0  
            });  
        }) 
     
	});
	
	$(document).ready(function(){
		
		if(buRight>0||functionRight>0){
			$("#query_role_form .bu").attr("disabled",true);
			//限定了bu或者function
			var data="";
			if(buRight>0){
				data +="bu="+buRight;
				
			}
			
			if(functionRight>0){
				$("#query_role_form .function").attr("disabled", true);
				data +="&function="+functionRight;
			}
			
			$.ajax({
				url :"role/queryRole",
				type : "POST",
				data : data,
				async : false,
				success : function(result) {
					
					if(result.code==100){
						showRoleList(result.data);
						$("#pageInfo-cont").empty();
						$("#navigation-cont").remove();
						
					}else{
						$("#role-tb").empty();
						$("#pageInfo-cont").empty();
						$("#navigation-cont").remove();
						
						$("#role-tb").append("<img src='static/img/no-data.png'>");
					}
				}
			});
		}else{
			ajaxQryRole(1);
		}
		
		
		$('.select_role_list').cxSelect({
			selects: ['bu','function', 'jobRole', 'commodity'],
			jsonName: 'name',
			jsonValue: 'value'
		});
		
		$('.add_select_role_list').cxSelect({
			selects: ['bu','function', 'jobRole', 'commodity'],
			jsonName: 'name',
			jsonValue: 'value'
		});
		
		
		
		//按条件快速筛选
		$("#query-role-btn").click(function() {
			var data = $("#query_role_form").serialize();
			
			$.ajax({
				url :"role/queryRole",
				type : "POST",
				data : data,
				async : false,
				success : function(result) {
					
					if(result.code==100){
						showRoleList(result.data);
						$("#pageInfo-cont").empty();
						$("#navigation-cont").remove();
						
					}else{
						$("#role-tb").empty();
						$("#pageInfo-cont").empty();
						$("#navigation-cont").remove();
						
						$("#role-tb").append("<img src='static/img/no-data.png'>");
					}
				}
			});
		});
		

		$(document).on('hidden.bs.modal','.modal',function(e){
			//alert("dsafds")
		    $(this).removeData("bs.modal");
		});
		
		
		//点击新增模态框
		$("#add-role-btn").click(function() {
			$('#addModalLabel').text('Add role');
			var general_tab = $("#add-general-checkbox-cont");
			var function_tab = $("#add-function-checkbox-cont");
			var roleId = 0;
			$.ajax({
				url :"access/checkBoxAccess/"+roleId,
				type : "POST",
				async : false,
				success : function(result) {
					
					if(result.code==100){
						ShowAccessRadio(general_tab,result.data.generalList,"generalAccess");
						ShowAccessRadio(function_tab,result.data.functionList,"functionAccess");
						
					}
				}
			});
			
			$('#addModal').modal('show');
		});
		
		//新增
		$(document).on("click",".add-role-btn",function() {
			
				 var data =$("#add_role_form").serialize() ;
				 
				 $.ajax({
						url :"role/role",
						type : "POST",
						async : false,
						data : data+"&_method=PUT",
						success : function(result) {
							$('#addModal').modal('hide');
							if(result.code==100){
								swal("", "Save successfully", "success");
								$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
									ajaxQryRole(totalPages);
	                            });
							}else{
								if(result.msg){
									swal("", result.msg, "error");
								}else{
									swal("", "Save failure!", "error");
								}
								
								$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
	                                location.reload();
	                            });
							}
						}
					});
		});
		
		
		//点击编辑模态框
		$(document).on("click",".editRole",function() {
			$('#editModalLabel').text('Edit role');
			var general_tab = $("#edit-general-checkbox-cont");
			var function_tab = $("#edit-function-checkbox-cont");
			var roleId = $(this).parent().parent().find('td:first').text() ;
			var bu = $(this).parent().parent().find('td:eq(1)').text() ;
			var functionName = $(this).parent().parent().find('td:eq(2)').text() ;
			var jobRole = $(this).parent().parent().find('td:eq(3)').text() ;
			var commodity = $(this).parent().parent().find('td:eq(4)').text() ;
			
			$.ajax({
				url :"access/checkBoxAccess/"+roleId,
				type : "POST",
				async : false,
				success : function(result) {
					
					if(result.code==100){
						$("#edit-select_role .bu").remove();
						$("#edit-select_role .bu-cont").text(bu);
						$("#edit-select_role .function").remove();
						$("#edit-select_role .function-cont").text(functionName);
						$("#edit-select_role .jobRole").remove();
						$("#edit-select_role .jobRole-cont").text(jobRole);
						$("#edit-select_role .commodity").remove();
						$("#edit-select_role .commodity-cont").text(commodity);
						$("#edit-select_role .commodity-cont").text(commodity);
						
						$("#roleId").val(roleId);
						ShowAccessRadio(general_tab,result.data.generalList,"generalAccess");
						ShowAccessRadio(function_tab,result.data.functionList,"functionAccess");
						
					}
				}
			});
			
			$('#editModal').modal('show');
		}); 
		
		
		//保存
		$(document).on("click",".edit-role-btn",function() {
			
				 var data =$("#edit_role_form").serialize() ;
				 
				 $.ajax({
						url :"role/role",
						type : "POST",
						async : false,
						data:data,
						success : function(result) {
							$('#editModal').modal('hide');
							if(result.code==100){
								swal("", "Save successfully", "success");
								$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
									ajaxQryRole(curPages);
	                            });
							}else{
								swal("", "Save failure!", "error");
								$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
	                                location.reload();
	                            });
							}
						}
					});
		});
		
		//删除
		$(document).on("click",".deleteConfirm",function() {
			
				 var roleId =$(this).parent().parent().find('td:first').text() ;
				 var accessName =$(this).parent().parent().find('td:eq(1)').text() ;
				 
				 deleteArticle(roleId);
		});
		
		
	});
	
	
	
	//加载checkbox
	function ShowAccessRadio(tab,list,accessClass){
		
		
		tab.empty();
		
		$.each(list, function(index,access){
			var html = "";
			if(access[2]=="checked"){
				html += "<div class='col-sm-5 checkBox-item' style='padding:0 5px 0 5px'><input type='checkbox' checked name='"+accessClass+"' value="+access[0]+"  title='"+access+"'/>" + access[1]+"&nbsp;&nbsp;</div>";
			}else{
				html += "<div class='col-sm-5 checkBox-item' style='padding:0 5px 0 5px'><input type='checkbox' name='"+accessClass+"' value="+access[0]+"  title='"+access+"'/>" + access[1]+"&nbsp;&nbsp;</div>";
				
			}
			
			tab.append(html);
			
			
		});
		
	}
	
	/**
	 * 发送ajax请求分页查询
	 * @param beginNum
	 * @returns
	 */
	function ajaxQryRole(beginNum){
		$.ajax({
			url : "role/list",
			data : "beginNum=" + beginNum,
			async : false,
			success : function(result) {
				//解析JSON数据，显示员工详情
				showRoleList(result.data);
				//解析JSON数据，显示分页信息
				showPageInfoMsg(result);
				//解析JSON数据，显示分页条
				showPageScroll(result);
			}		
		});
	};
	
	//加载role 数据
	function showRoleList(data){
		
		var list = data.pageInfo.list;
		var tab = $("#role-tb");
		tab.empty();

		$.each(list, function(index,role){
			
			var html = "";
			html += "<tr><td>" + role.roleId+ "</td>";
			html += "<td>" + data.buMap[role.bu] + "</td>";    
			html += "<td>" + data.functionMap[role.function] + "</td>";    
			html += "<td>" + data.jobRoleMap[role.jobRole] + "</td>";    
			if(role.commodity!=null&&role.commodity!= ""){
				html += "<td>" + data.commodityMap[role.commodity] + "</td>";  
			}else{
				html += "<td></td>"; 
			}
			
			html += "<td>"+role.updateTime+"</td>";
			
			html += "<td>" + role.updateOperator+ "</td>";
			
			if($.inArray('1',roleRightArr)!=-1){
				html += "<td><a href='javascript:void(0)' title='Edit' class='editRole'><span class='glyphicon glyphicon-pencil' ></span></a>&nbsp;&nbsp;&nbsp";
			}else{
				html += "<td>";
			}
			
			if($.inArray('3',roleRightArr)!=-1){
				html += "<a href='javascript:void(0)' title='Delete'   class='deleteConfirm' ><span class='glyphicon glyphicon-trash' ></span></a></td></tr>";
			}else{
				html += "</td></tr>";
			}
			
			
			tab.append(html);
		});
	}; 
	
	//删除
	function deleteArticle(roleId){  
		
	       swal({  
	          title:"",  
	          text:"Are you sure to delete the role?",  
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
						url :"role/role/"+roleId,
						type : "DELETE",
						success : function(result) {
							console.log(result);
							if(result.code==100){
								swal("", "Delete successfully", "success");
								$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
									ajaxQryRole(curPages);
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
	 * 解析JSON数据，显示分页条信息
	 * @param responseData
	 * @returns
	 */
	function showPageScroll(responseData) {
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
		$("#navigatepageNums").empty();
		html += '<li><a  href="javascript:void(0)" onclick="ajaxQryRole(1)">First</a></li>';
		if( hasPreviousPage ) {
			html += '<li><a href="javascript:void(0)" aria-label="Previous" onclick="ajaxQryRole('+(curNum-1)+')"><span aria-hidden="true">&laquo;</span></a></li>';	
		}	
		$.each(navigatepageNums, function(index, pageNum) {
			if( curNum == pageNum ) {
				html += '<li class="active"><a href="javascript:void(0)" onclick="ajaxQryRole('+pageNum+')">'+pageNum+'</a></li>';
			} else {
				html += '<li><a href="javascript:void(0)" onclick="ajaxQryRole('+pageNum+')">'+pageNum+'</a></li>';
			}		
		});
		if( hasNextPage ) {
			html += '<li><a  href="javascript:void(0)" aria-label="Next" onclick="ajaxQryRole('+(curNum+1)+')"><span aria-hidden="true">&raquo;</span></a></li>';	
		}
		html += '<li><a href="javascript:void(0)" onclick="ajaxQryRole('+pages+')">Last</a></li>';
		$("#navigatepageNums").append(html);
	};
	
	/**
	 * 解析JSON数据，显示分页信息：总页数，当前页数，总记录数
	 * @param responseData
	 * @returns
	 */
	function showPageInfoMsg(responseData) {
		//当前页数
		var pageNum = responseData.data.pageInfo.pageNum;
		$("#pageNum").text(pageNum);
		//总页数
		var pages = responseData.data.pageInfo.pages;
		$("#pages").text(pages);
		//总记录条数
		var total = responseData.data.pageInfo.total;
		$("#total").text(total);
		totalPages = total;
		curPages = pageNum;
	};	
	
	
	</script>
</body>
</html>
