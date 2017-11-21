<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
							<li class="active">Access manage</li>
	
						</ol>
					</div>
				</div>
				<legend>Access List</legend>
			
				<div class="page-header">
					<div class="row">
						<c:if test="${Arrays.binarySearch(loginUser.authorization.accessRight.split(','),'2')>= 0}">     
							<div class="col-md-4">
								<a href="access/add" class="btn btn-primary" style="background: #5C7EBD; border: 0;"> 
									<span class="glyphicon glyphicon-plus"></span> add an access
								</a>
							</div>
						</c:if> 
						
						<form id="searchForm" role="form" class="login-form" style="float:right; width:400px" >
							
								<div class="col-lg-10 col-sm-5">
									<div class="input-group">
										<input type="text" class=" col-sm-10 form-control" id="search-access" name="accessSearch" value="${search}">
										<span class="input-group-btn"><button type="button"  class="btn btn-primary" style="background: #5C7EBD;"  id="search-access-btn">Search</button></span>
									</div>
									
								</div>
						</form>
					</div>
				</div>
				<div class="table-responsive">
					<table class="table  table-hover" >
						<thead>
							<tr class="active">
								<th style="width:5%">ID</th>
								<th >Access name</th>
								<th style="width:15%">Belong to</th>
								<th style="width:20%">Update time</th>
								<th style="width:20%">Update operator</th>
								<th style="width:8%">Operate</th>
							</tr>
						</thead>
						<tbody id="access-tb">
							
						</tbody>
					</table>
					<div class="no-data" style='text-align: center;display:none' ><img  src='static/img/no_data.jpg'></div>
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
	<jsp:include page="../bottom.jsp" flush="true" />
	<script type="text/javascript">
	
		var totalPages = 0;
		var curPages = 0;
		var accessRightArr = "${loginUser.authorization.accessRight}".split(',');
		$(document).ready(function(){
			$(".top").on("click", function() {
	            $("body").stop().animate({  
	                scrollTop: 0  
	            });  
	        }) 
	       
		});
		
		$(document).ready(function(){
			//页面加载时，发送ajax请求查询第一页信息
			ajaxQryAccess(1);
			
			$("#search-access-btn").click(function() {
				var data = $("#searchForm").serialize();
				
				$.ajax({
					url :"access/searchAccess",
					type : "POST",
					data : data,
					success : function(result) {
						console.log(result);
						if(result.code==100){
							showAccessList(result.data.accessList);
							$("#pageInfo-cont").empty();
							$(".no-data").css("display",'none');
							$("#navigation-cont").remove();
							
						}else{
							$("#access-tb").empty();
							$("#pageInfo-cont").empty();
							$("#navigation-cont").remove();
							
							$(".no-data").css("display",'inline-block');
						}
					}
				});
			});
			
			$(document).on("click",".deleteConfirm",function() {
				
					 var accessId =$(this).parent().parent().find('td:first').text() ;
					 var accessName =$(this).parent().parent().find('td:eq(1)').text() ;
					 
					 deleteArticle(accessId,accessName);
			});
			
	});
	
	
	
	function deleteArticle(accessId,accessName){  
		
	       swal({  
	          title:"",  
	          text:"Are you sure to delete ' "+accessName+" '?",  
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
						url :"access/access/"+accessId,
						type : "DELETE",
						success : function(result) {
							console.log(result);
							if(result.code==100){
								swal("", "Delete successfully", "success");
								$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
									ajaxQryAccess(curPages);
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
	function ajaxQryAccess(beginNum){
		$.ajax({
			url : "access/list",
			data : "beginNum=" + beginNum,
			async : false,
			success : function(result) {
				//解析JSON数据，显示员工详情
				showAccessList(result.data.pageInfo.list);
				//解析JSON数据，显示分页信息
				showPageInfoMsg(result);
				//解析JSON数据，显示分页条
				showPageScroll(result);
			}		
		});
	};
	
	
	
	function showAccessList(list){
		var tab = $("#access-tb");
		tab.empty();
	
		$.each(list, function(index,access){
			var updateTime = access.updateTime;
			console.log(access);console.log(access);
			var html = "";
			html += "<tr><td>" + access.accessId+ "</td>";
			html += "<td>" + access.title + "</td>";              
			html += "<td>" + (access.parentPart==1?"general access":"function access") + "</td>";  
			html += '<td>'+updateTime+'</td>';
			
			html += "<td>" + access.updateOperator+ "</td>";
			
			if($.inArray('1',accessRightArr)!=-1){
				html += "<td><a href='access/access/"+access.accessId+"'title='Edit'><span class='glyphicon glyphicon-pencil' ></span></a>&nbsp;&nbsp;&nbsp";
			}else{
				html += "<td>";
			}
			
			if($.inArray('3',accessRightArr)!=-1){
				html += "<a href='javascript:void(0)' title='Delete'   class='deleteConfirm' ><span class='glyphicon glyphicon-trash' ></span></a></td></tr>";
			}else{
				html += "</td></tr>";
			}
			
			tab.append(html);
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
		html += '<li><a href="javascript:void(0)" onclick="ajaxQryAccess(1)">First</a></li>';
		if( hasPreviousPage ) {
			html += '<li><a href="javascript:void(0)" aria-label="Previous" onclick="ajaxQryAccess('+(curNum-1)+')"><span aria-hidden="true">&laquo;</span></a></li>';	
		}	
		$.each(navigatepageNums, function(index, pageNum) {
			if( curNum == pageNum ) {
				html += '<li class="active"><a href="javascript:void(0)" onclick="ajaxQryAccess('+pageNum+')">'+pageNum+'</a></li>';
			} else {
				html += '<li><a href="javascript:void(0)" onclick="ajaxQryAccess('+pageNum+')">'+pageNum+'</a></li>';
			}		
		});
		if( hasNextPage ) {
			html += '<li><a href="javascript:void(0)" aria-label="Next" onclick="ajaxQryAccess('+(curNum+1)+')"><span aria-hidden="true">&raquo;</span></a></li>';	
		}
		html += '<li><a href="javascript:void(0)" onclick="ajaxQryAccess('+pages+')">Last</a></li>';
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
   