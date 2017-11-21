<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>

<div id="header">
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="background-color: #5c7ebd; font-size: 14px; border-bottom-width: 0px;">
		<div class="container" style="padding-left: 0px;">
			<div class="navbar-header" style="margin:10px 5px;">
				<a href="user/query"> 
					<img src="static/img/logo2.png" height="50" width="180">
				</a>
			</div>

			<div id="navbar" class="collapse navbar-collapse" style="margin-top: 10px;">
				<ul class="nav navbar-nav">
					<li><a href="${APP_PATH}/user/query"> <span
							class="glyphicon glyphicon-home" aria-hidden="true"></span> Home
					</a></li>
					
					<li>
						<a href="${APP_PATH}/general/feedback">  Feedback</a>
					</li>
					<li>
						<a href="${APP_PATH}/general/about">  About</a>
					</li>
					<c:if test="${loginUser.authorization!=null}">
						  <li class="dropdown">
						  		<a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown"> Setting <b class="caret"></b></a>
								<ul class="dropdown-menu">
									
									<c:if test="${fn:contains(loginUser.authorization.authRight, 0)}">
										<li><a href="user/userList">authority manage </a></li>
									</c:if>
									
									<c:if test="${Arrays.binarySearch(loginUser.authorization.organizationRight.split(','),'0')>=0}">     
											<li><a href="organization/list">organization manage</a></li>
									</c:if> 
									<c:if test="${fn:contains(loginUser.authorization.roleRight, 0)}">
										<li><a href="role/roleList">role manage</a></li>
									</c:if>
									<c:if test="${fn:contains(loginUser.authorization.accessRight, 0)}">
										<li><a href="access/accessList">access manage</a></li>
									</c:if>
								</ul>
							</li>
					</c:if>
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<form class="navbar-form" role="search" style="float: left;" action="access/search" method="post">
						<div class="form-group">
							<input type="text" name="search" class="form-control"
								placeholder="Search" style="height: 34px" value="${search }">
							<span class="">
								<button type="submit" class="btn btn-default"
									style="height: 34px; background: #5c7ebd; border: 0;">
									<img src="static/img/u11.png"
										style="height: 20px; width: 20px; margin-bottom: 16px;">
								</button>
							</span>
						</div>
					</form>
					
					<c:choose>
					   <c:when test="${loginUser.user== null}">  
					     	<li><a href="user/index"><span class="glyphicon glyphicon-log-in"></span> sign in</a></li>
					   </c:when>
					   <c:otherwise> 
					     	<li class="dropdown">
					     			
					     		<a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown"  style="padding: 0px;"> 
					     			<img style="width:50px;heiht:50px;padding: 0px;" src="https://w3-services1.w3-969.ibm.com/myw3/unified-profile-photo/v1/image/${loginUser.user.email}?type=bp" class="img-rounded"  style="width:50px;height:50px">&nbsp;&nbsp;&nbsp;
									${loginUser.name}&nbsp;&nbsp;<b class="caret"></b>
								</a>
								<ul class="dropdown-menu">
									<li>&nbsp;&nbsp;${loginUser.user.email}</li>
									<li class="divider"></li>
									<li><a href="${APP_PATH}/user/history">apply history </a></li>
									<li class="divider"></li>
									<li><a href=${APP_PATH}/user/logout>sign out</a></li>
								</ul>
							</li>
					   </c:otherwise>
					</c:choose>		
				</ul>
			</div>
	</nav>
</div>
