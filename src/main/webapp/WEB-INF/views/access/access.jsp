<%@ page language="java" import="com.ibm.bluekey.*,java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<!-- saved from url=(0077)https://d396qusza40orc.cloudfront.net/phoenixassets/web-frameworks/index.html -->
<html lang="en">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Blue Key</title>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<base href=" <%=basePath%>">

<script src="static/js/jquery-1.10.2.min.js"></script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/bootstrapValidator.js"></script>
<script src="static/js/sweet-alert.js" type="text/javascript" charset="utf-8"></script>

<link rel="stylesheet" type="text/css" href="static/css/sweet-alert.css"/>	
<link rel="shortcut icon" href="static/img/favico.ico"/>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="static/css/mystyles.css" rel="stylesheet">
<link href="static/css/font-awesome.css" rel="stylesheet">
<link href="static/css/bootstrap-social.css" rel="stylesheet">
<link href="static/css/bootstrapValidator.css" rel="stylesheet"> 

<script type="text/javascript">
	$(document).ready(
			function() {
				var applyStep = $("#detail-apply-step").text().replace(/\n/g,
						'<br/>');
				$("#detail-apply-step").html(applyStep);

				var description = $("#detail-function-description").text()
						.replace(/\n/g, '<br/>');
				$("#detail-function-description").html(description);
			});
</script>
</head>

<body style="overflow:scroll;overflow-x:hidden">
	<div class="wrapper">
		<div class="page">
		<jsp:include page="../top.jsp" flush="true" />


		<div class="container">
			<div class="row"></div>
			<div class="row breadcrumb-nav" style="font-size: 14px;">
				<div class="col-xs-12 col-sm-12 col-sm-push-0" >
					<ol class="breadcrumb">
						<li><a href="user/query">Home</a></li>
						<li class="active">${access.shortTitle}</li>

					</ol>
				</div>
			</div>

			<div class="row row-content">
				<div class="col-xs-12 col-sm-2 col-sm-push-0 " style="margin-top: 50px;">
					<p style="padding: 15px;"></p>
					<div class="row">
						<div class="col-xs-12 col-sm-8 col-sm-push-1 access-item-test"
							id="generalAccess"
							style="font-size: 20px; text-align: center; height: 70px;">
							<h1 style="text-align: center; font-size: 20px;">Overview</h1>
						</div>
						<div class="col-xs-12 col-sm-8 col-sm-push-1 access-item-test"
							id="functionAccess"
							style="font-size: 20px; text-align: center; height: 70px;">
							<h1 style="text-align: center; font-size: 20px;">Apply</h1>
						</div>
						<div class="col-xs-12 col-sm-8 col-sm-push-1 access-item-test"
							id="otherAccess"
							style="font-size: 20px; text-align: center; height: 70px;">
							<h1 style="text-align: center; font-size: 20px;">Others</h1>
						</div>
					</div>
				</div>

				<div class="col-xs-12 col-sm-10 col-sm-push-0 "
					style="background-color: white; padding-bottom: 20px; border-left: 2px solid #5c7ebd;">

					<!-- å·ä½åå®¹ æ¾ç¤º -->
					<div class="row" id="general_access">
						<div class="col-xs-12 col-sm-12 access-item-detail" style="left: 26px; top: 19px;">
							<h3 style="font-size: 22px; ">${access.title}</h3>
							<p style="font-size: 14px; padding-bottom: 20px; " id="detail-function-description">
								${access.function}
							</p>
							<p style="font-size: 14px; padding-bottom: 20px;">
								<b>Access:</b>
								<c:choose>
								   <c:when test="${access.parentPart== 1}">
								     	general access
								   </c:when>
								   <c:otherwise> 
								     	function access
								   </c:otherwise>
								</c:choose>	
							</p>
							<p style="font-size: 14px; padding-bottom: 20px;">
								<b>Lead time:</b>
								${access.leadTime} days
							</p>
							<p style="font-size: 14px; padding-bottom: 20px; ">
								<b>Platform:</b>
								<c:choose>
								   <c:when test="${access.platform== 1}">  
								     	lotus notes
								   </c:when>
								   <c:otherwise> 
								     	web
								   </c:otherwise>
								</c:choose>
							</p>
							
						</div>
					</div>

					<div class="row" id="function_access" hidden="">
						<div class="col-xs-12 col-sm-12 access-item-detail"
							style="left: 26px; top: 19px;">
							<h3>Apply</h3>

							<p style="font-size: 14px; padding-bottom: 10px; padding-top: 10px;" id="detail-apply-step">
								${access.applyStep}
							</p>
							<c:if test="${not empty access.url}">
								<hr>
								<p style="font-size: 14px; ">
									Link: <a href="%{access。getUrl()}" target="view_window">${access.url}</a>
								</p>
							</c:if>
							
							<c:if test="${not empty access.otherUrl}">
								<hr>
								<p style="font-size: 14px; padding-bottom: 10px; padding-top: 10px;">
									Link2:<a href="${access.otherUrl}" target="view_window">${access.otherUrl}</a>
								</p>
							</c:if>
							
							<c:if test="${not empty access.applyEmail}">
								<hr>
								<p style="font-size: 14px; padding-bottom: 20px; padding-top: 20px;">
									If you want to send an email to apply for the access, please click the button!
								</p>
	
								<div>
									<div>
										<a id="applyAccess" href="#modal-container-email" role="button" class="btn btn-primary" data-toggle="modal" style="background: #5c7ebd; border: 0;">
											Apply Access
										</a>
	
										<div class="modal fade" id="modal-container-email"
											role="dialog" aria-labelledby="myModalLabel"
											aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-hidden="true">×</button>
														<h4 class="modal-title" id="myModalLabel">Send an email to apply for the access</h4>
													</div>
													<form class="form-horizontal" id="sendEmail-form" role="form" action="mail/sendEmail" dosubmit="false">
														<div class="modal-body" style="width: 610px;">
															<div>
																<div class="form-group">
																	<label for="inputRecevieAddress"
																		class="col-sm-2 control-label">Receive Address</label>
																	<div class="col-sm-6">
																		<input type="text" class="form-control" readonly name="receiveEmail" 
																			value="${access.applyEmail}" />	
																	</div>
																	<div class="col-sm-3 ">
																		<span class="label label-warning" data-toggle="tooltip"
																			data-placement="right"
																			title="If the email address is wrong,please feedback to us!">Alert</span>
																	</div>
	
																</div>
	
																<div class="form-group">
																	<label for="inputEmailTitle"
																		class="col-sm-2 control-label">CC</label>
																	<div class=" col-sm-9 ">
																		<input type="text" class="form-control" name="email"  value="${loginUser.user.email}" />
																	</div>
																	
																	<div class="col-sm-offset-2 col-sm-9 ">
																		<div id="myAlert" class="alert alert-warning" style="padding-top: 5px; padding-bottom: 5px; margin-bottom: 0px;">
																			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">
																				&times;
																			</button>
																			<strong>Alert！</strong>separate multiple addresses by comma!
																		</div>
																	</div>
																</div>
																<div class="form-group">
																	<label for="inputEmailTitle"
																		class="col-sm-2 control-label">Subject</label>
																	<div class="col-sm-9">
																		<input type="text" class="form-control" name="emailSubject" style="width: 410px;"
																			value="${mailTemplate.subjectTitle}" />
																	</div>
																</div>
																<div class="form-group">
																	<label for="inputEmailContent"
																		class="col-sm-2 control-label">Content</label>
																	<div class="col-sm-9">
																		<textarea class="form-control" name="content" rows="18">
																			<c:out  value=" ${fn:trim(mailTemplate.content)}"></c:out>
																			 <c:out value="Name: ${loginUser.name}"></c:out>
																			 <c:out value="S/N: ${loginUser.uid}"></c:out>
																			 <c:out value="Notes ID: ${loginUser.notesId}"></c:out>
          																	
																		</textarea>
	
																	</div>
																</div>
															</div>
														</div>
														<div class="modal-footer">
															<input type="hidden" name="accessId" value="${access.accessId}" >
															<input type="hidden" name="userId" value="${loginUser.user.userId}" >
															<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
															<button type="submit" class="btn btn-primary" style="background: #5C7EBD; border: 0;">Send</button>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
									
							</c:if>
							
						</div>

					</div>
					<!-- <div class="col-xs-12 col-sm-9 " style=" background-color:white; padding-bottom: 20px;padding-left: 20px;border-left: 2px solid #5c7ebd;" hidden="">
 -->
					<div class="row" id="other_access" hidden="">
						<div class="col-xs-12 col-sm-12 access-item-detail"
							style="left: 26px; top: 19px;">
							<h3>Resource</h3>

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
	<jsp:include page="../bottom.jsp" flush="true" />

	<script type="text/javascript">
		$(document).ready(function(){
			$(".top").on("click", function() { 
	            $("body").stop().animate({  
	                scrollTop: 0  
	            });  
	        }); 
			
		//点击模态框
		$("#addCommodity").click(function() {
			var tab = $("#add-select-container");

			$('#addModalLabel').text('Add Commodity');
			$('.add').attr("id","add-commodity-btn");
			$("#add-form input[name='name']:first").val('');
			ajaxDataHtml(tab,"jId","organization/getJobRoleList","","jobRoleList");
			
			$('#addModal').modal('show');
		});
			
		 //发送邮件	
		 $('#sendEmail-form').bootstrapValidator({
	            message: 'This value is not valid',
	            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
	                valid: 'glyphicon glyphicon-ok',
	                invalid: 'glyphicon glyphicon-remove',
	                validating: 'glyphicon glyphicon-refresh'
	            },
	            fields: {/*验证*/
	            	
	            	emailSubject: {
	                    validators: {
	                        notEmpty: {
	                            message: 'The Email Subject is required and cannot be empty'
	                        },
	                        stringLength: {
	                            min: 6,
	                            max: 100,
	                            message: 'The Email Subject must be more than 6 and less than 100 characters long'
	                        },
	                    }
	                },
	             
	                content: {
	                    validators: {
	                        notEmpty: {
	                            message: 'The content  is required and cannot be empty'
	                        },
	                        stringLength: {
	                            min: 10,
	                            message: 'The content  must be more than 10 characters long'
	                        },
	                    }
	                },
	               
	            },
	        }).on('success.form.bv', function(e) {
	           
	            e.preventDefault();
	            var $form = $(e.target);
	            var bv = $form.data('bootstrapValidator');
	
	            // Use Ajax to submit form data
	            $.post($form.attr('action'), $form.serialize(), function(result) {
	            	$('#modal-container-email').modal('hide');
	            	if(result.code==100){
						swal("Save successfully", "", "success")
					}else{
						swal({
							  title: "Error!",
							  text: "Save failure!",
							  type: "error",
							  confirmButtonText: "ok"
							});
					}
				
	            }, 'json');
	        });   
	     
		  });  
		 $(function() {
				$("[data-toggle='tooltip']").tooltip();
			});

			var generalAccess = document.getElementById("generalAccess");
			// alert(generalAccess.id);

			var functionAccess = document.getElementById("functionAccess");

			var otherAccess = document.getElementById("otherAccess");

			var generalTotal = document.getElementById("general_access");

			var functionTotal = document.getElementById("function_access");

			var otherTotal = document.getElementById("other_access");
			generalAccess.onclick = function showGeneral() {
				generalAccess.style.backgroundColor = "#5c7ebd";
				generalAccess.style.color = "white";
				functionAccess.style.backgroundColor = "";
				functionAccess.style.color = "#5C7EBD";
				otherAccess.style.backgroundColor = "";
				otherAccess.style.color = "#5C7EBD";
				functionTotal.style.display = "none";
				// functionTotal.parentNode.style.display="none";
				generalTotal.style.display = "inline";
				// generalTotal.parentNode.style.display="inline";

				// otherTotal.parentNode.style.display="none";
				otherTotal.style.display = "none";
			}
			functionAccess.onclick = function showFunction() {
				generalAccess.style.backgroundColor = "";
				generalAccess.style.color = "#5C7EBD";
				functionAccess.style.backgroundColor = "#5c7ebd";
				functionAccess.style.color = "white";
				otherAccess.style.backgroundColor = "";
				otherAccess.style.color = "#5C7EBD";
				// functionTotal.parentNode.style.display="inline";
				functionTotal.style.display = "inline";
				// generalTotal.parentNode.style.display="none";
				generalTotal.style.display = "none";

				// generalTotal.parentNode.style.borderLeft="";
				// otherTotal.parentNode.style.display="none";
				otherTotal.style.display = "none";
				// otherTotal.parentNode.style.borderLeft="";
			}
			otherAccess.onclick = function showOther() {
				otherAccess.style.backgroundColor = "#5c7ebd";
				otherAccess.style.color = "white";
				generalAccess.style.backgroundColor = "";
				generalAccess.style.color = "#5C7EBD";
				functionAccess.style.backgroundColor = "";
				functionAccess.style.color = "#5C7EBD";
				// generalTotal.parentNode.style.display="none";
				generalTotal.style.display = "none";

				// functionTotal.parentNode.style.display="none";
				functionTotal.style.display = "none";

				// otherTotal.parentNode.style.display="inline";
				otherTotal.style.display = "inline";

			}
			generalAccess.click();
	</script>
</body>
</html>

