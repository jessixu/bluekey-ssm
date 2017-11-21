<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script src="static/js/sweet-alert.js" type="text/javascript" charset="utf-8"></script>

<link rel="stylesheet" type="text/css" href="static/css/sweet-alert.css"/>	
<link rel="shortcut icon" href="static/img/favico.ico"/>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="static/css/mystyles.css" rel="stylesheet">
<link href="static/css/font-awesome.css" rel="stylesheet">
<link href="static/css/bootstrap-social.css" rel="stylesheet">
<link href="static/css/bootstrapValidator.css" rel="stylesheet"> 

<script>
	
</script>
</head>
<body style="overflow:scroll;overflow-x:hidden">
	<div class=" wrapper">
	<div class="page">
    <jsp:include page= "../top.jsp" flush ="true"/>
    
	<div class="container"  >
		<div class="row breadcrumb-nav" >
			<div class="col-xs-12 col-sm-12 col-sm-push-0">
				<ol class="breadcrumb">
					<li><a href="user/query">Home</a></li>
					<li><a href="#">Setting</a></li>
					<li class="active">Edit access</li>

				</ol>
			</div>
		</div>
		<legend>Edit access</legend>
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="tabbable" id="tabs-368872">
					<ul class="nav nav-tabs" >
						<li class="active">
							 <a href="#panel-detail" data-toggle="tab"> Detail information</a>
						</li>
						<li>
							 <a href="#panel-mail-template" data-toggle="tab" >Mail template</a>
						</li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane fade in active" id="panel-detail">
							<div class="row clearfix">
								<div class="col-md-12 column">
									<form class="form-horizontal" id="access_form"  role="form" method="POST" action="access/access" >
										<div class="form-group">
											 <label for="inputParent_part" class="col-sm-2 control-label"><span style="color:red">*</span>Parent part</label>
											<div class="col-sm-4">
												<select class="form-control " name="parentPart">
													<option value="1" 
														<c:if test="${access.parentPart ==1}">
														  selected
														</c:if>>general access
													</option>
													<option value="2" 
														<c:if test="${access.parentPart ==2}">
														  selected
														</c:if>>function access
													</option>
												</select>
											</div>
										</div>
										
										<div class="form-group">
											 <label for="inputTitle" class="col-sm-2 control-label"><span style="color:red">*</span>Access title</label>
											<div class="col-sm-8">
												<input type="text" class="form-control input" name="title"   value="${access.title }"/>
											</div>
										</div>
										<div class="form-group">
											 <label for="inputShortTitle" class="col-sm-2 control-label"><span style="color:red">*</span>Short title</label>
											<div class="col-sm-8">
												<input type="text" class="form-control input" name="shortTitle" value="${access.shortTitle }"/>
											</div>
										</div>
										
										<div class="form-group">
											 <label for="inputFunction" class="col-sm-2 control-label"><span style="color:red">*</span>Description</label>
											<div class="col-sm-8">
												<textarea class="form-control  input" name="function" rows="6">${access.function }</textarea>
												<%-- <input type="text" class="form-control input" name="function" value="<%=function%>"/> --%>
											</div>
										</div>
										<div class="form-group">
											 <label for="inputPlatform" class="col-sm-2 control-label"><span style="color:red">*</span>Platform</label>
											<div class="col-sm-8">
												 <input type="radio" name="platform" value="1" 
												 		<c:if test="${access.platform ==1}">
														  checked
														</c:if>>lotus notes &nbsp;&nbsp;&nbsp;
									             <input type="radio" name="platform" value="2" 
									             		<c:if test="${access.platform ==2}">
														  checked
														</c:if>>web
											</div>
										</div>				
										<div class="form-group">
											 <label for="inputURL" class="col-sm-2 control-label">URL</label>
											<div class="col-sm-8">
												<input type="url" class="form-control input" name="url" value="${access.url }" placeholder="http://"/>
											</div>
										</div>
										<div class="form-group">
											 <label for="inputURL" class="col-sm-2 control-label">URL 2</label>
											<div class="col-sm-8">
												<input type="url" class="form-control input" name="otherUrl" value="${access.otherUrl }" placeholder="http://"/>
											</div>
										</div>
										<div class="form-group">
											 <label for="inputURL" class="col-sm-2 control-label">Access email</label>
											<div class="col-sm-8">
												<input type="email" class="form-control input" name="applyEmail" value="${access.applyEmail }" placeholder="XXXXX@cn.ibm.com"/>
											</div>
										</div>
										<div class="form-group">
											 <label for="inputURL" class="col-sm-2 control-label">Lead time</label>
											<div class="col-sm-2">
												<input type="number" class="form-control input" name="leadTime"  value="${access.leadTime }"/>
											</div>
											<div class="col-sm-1"><p class="form-control-static">days</p></div>
										</div>
										
										<div class="form-group">
											 <label for="inputApply_step" class="col-sm-2 control-label"><span style="color:red">*</span>Apply step</label>
											<div class="col-sm-8">
												<textarea class="form-control  input" name="applyStep" rows="12">${access.applyStep }</textarea>
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												 <input type="hidden" name="accessId" value="${access.accessId }">
												 <button type="submit" class="btn btn-primary" id="access-btn" style="background: #5c7ebd; border: 0;">Save</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<div class="tab-pane fade " id="panel-mail-template">
							
							<div class="row clearfix">
								<div class="col-md-13 column">
									<form  id="email_form" class="form-horizontal" role="form" method="post" action ="mail/saveMail">
										
										<div class="form-group">
											 <label for="inputTitle" class="col-sm-2 control-label"><span style="color:red">*</span>Mail Title</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" name="subjectTitle"   value="${mailTemplate.subjectTitle }"/>
											</div>
										</div>
										
										<div class="form-group">
											 <label for="inputContent" class="col-sm-2 control-label"><span style="color:red">*</span>Content</label>
											<div class="col-sm-8">
												<textarea class="form-control" name="content" rows="18">${mailTemplate.content }</textarea>
											</div>
										</div>
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
												 <input type="hidden" name="tempId" value="${mailTemplate.tempId }">
												 <input type="hidden" name="accessId" value="${access.accessId }">
												 <button  type="submit" id="email-btn" class="btn btn-primary" style="background: #5c7ebd; border: 0;" >Save</button>
											</div>
										</div>
									</form>
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
	</div>
	<jsp:include page= "../bottom.jsp" flush ="true"/>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".top").on("click", function() { 
	            $("body").stop().animate({  
	                scrollTop: 0  
	            });  
	        })  
		});
		$(document).ready(function() {
		    $('#access_form').bootstrapValidator({
		            message: 'This value is not valid',
		            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
		                valid: 'glyphicon glyphicon-ok',
		                invalid: 'glyphicon glyphicon-remove',
		                validating: 'glyphicon glyphicon-refresh'
		            },
		            fields: {/*验证*/
		            	parentPart: {
		            		
		                    validators: {
		                        notEmpty: {
		                            message: 'The parent part is required'
		                        }
		                    }
		                },
		            	title: {
		                    validators: {
		                        notEmpty: {
		                            message: 'The Access title is required and cannot be empty'
		                        },
		                        stringLength: {
		                            min: 1,
		                            max: 100,
		                            message: 'The Access title must be more than 1 and less than 100 characters long'
		                        },
		                    }
		                },
		                shortTitle: {
		                    validators: {
		                        notEmpty: {
		                            message: 'The Short Title is required and cannot be empty'
		                        },
		                        stringLength: {
		                            min: 1,
		                            max: 100,
		                            message: 'The Short title must be more than 1 and less than 100 characters long'
		                        },
		                    }
		                },
		                'function': {
		                    validators: {
		                        notEmpty: {
		                            message: 'The Description is required and cannot be empty'
		                        },
		                        stringLength: {
		                            min: 6,
		                            message: 'The Description must be more than 6 characters long'
		                        },
		                    }
		                },
		                url: {
		                	validators: {
		                        uri: {
		                            message: 'The input is not a valid URL'
		                        }
		                    }
		                },
		                otherUrl: {
		                	validators: {
		                        uri: {
		                            message: 'The input is not a valid URL'
		                        }
		                    }
		                },
		            	platform : {
		                    feedbackIcons: false,
		                    validators: {
		                        notEmpty: {
		                            message: 'The platform is required'
		                        }
		                    }
		                },
		                email: {
		                    validators: {
		                        notEmpty: {
		                            message: 'The email address is required and can\'t be empty'
		                        },
		                        emailAddress: {
		                            message: 'The input is not a valid email address'
		                        }
		                    }
		                },
		                leadTime: {
		                    validators: {
		                        digits: {
		                            message: 'The value can contain only digits'
		                        }
		                    }
		                },
		                applyStep: {
		                    validators: {
		                        notEmpty: {
		                            message: 'The Apply step is required and cannot be empty'
		                        },
		                        stringLength: {
		                            min: 10,
		                            message: 'The Apply step must be more than 10 characters long'
		                        },
		                    }
		                },
		               
		            }
		        }).on('success.form.bv', function(e) {
			           
		            e.preventDefault();
		            var $form = $(e.target);
		            var bv = $form.data('bootstrapValidator');

		            // Use Ajax to submit form data
		            $.post($form.attr('action'), $form.serialize(), function(result) {
		            	
		            	if(result.code==100){
							swal("Save successfully", "", "success");
							$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
								window.location.href="access/accessList/"; 
	                        });
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
		    
		    $('#email_form').bootstrapValidator({
	            message: 'This value is not valid',
	            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
	                valid: 'glyphicon glyphicon-ok',
	                invalid: 'glyphicon glyphicon-remove',
	                validating: 'glyphicon glyphicon-refresh'
	            },
	            fields: {/*验证*/
	            	
	            	subjectTitle: {
	                    validators: {
	                        notEmpty: {
	                            message: 'The Email Title is required and cannot be empty'
	                        },
	                        stringLength: {
	                            min: 6,
	                            max: 100,
	                            message: 'The Email title must be more than 6 and less than 100 characters long'
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
	            	
	            	if(result.code==100){
						swal("Save successfully", "", "success");
						$('.confirm').click(function () {   //额外绑定一个事件，当确定执行之后返回成功的页面的确定按钮，点击之后刷新当前页面或者跳转其他页面
							window.location.href="access/accessList/"; 
                        });
						
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
		    
		    
		    /* // access 提交按钮
		    $("#access-btn").click(function() {
		    	var mailValidator  = $("#access_form").data("bootstrapValidator");
				mailValidator.validate();
				
				if(mailValidator.isValid()){
					var data = $("#access_form").serialize();
					$.ajax({
						url :"access/access",
						type : "POST",
						data : data,
						success : function(result) {
							console.log(result);
							if(result.code==100){
								swal("Save successfully", "", "success")
							}else{
								swal({
									  title: "Error!",
									  text: "Save failure!",
									  type: "error",
									  confirmButtonText: "red"
									});
							}
						}
					});
				}
				
			});
		     */
		    
		});
		
		</script>
</body>
</html>
