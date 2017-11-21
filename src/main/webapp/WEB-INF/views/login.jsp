<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Blue key login</title>

<%
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>

<base href=" <%=basePath%>">
<script src="static/js/sweet-alert.js" type="text/javascript" charset="utf-8"></script>

<link rel="stylesheet" type="text/css" href="static/css/sweet-alert.css"/>	
<link rel="shortcut icon" href="static/img/favico.ico"/>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="static/css/font-awesome.css" rel="stylesheet">
<link href="static/css/bootstrap-social.css" rel="stylesheet">
<link rel="stylesheet" href="static/css/style.css">
<link href="static/css/bootstrapValidator.css" rel="stylesheet">

</head>
<body>

	<!-- Top content -->
	<div class="top-content">

		<div class="inner-bg">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-sm-offset-2 text"  style="text-align: center">
						<h1>
							<strong>Welcome to Blue Key</strong>
						</h1>
						<div class="description">
							<p style="font-size: 18px;">
								<strong>please login in with your w3id</strong>
							</p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 form-box">
						<div class="form-top">
								<img src="static/img/u7.png" style="text-align: center; width: 90%; padding-left: 10%;">
						</div>
						<div class="form-bottom">
							<form role="form" class="login-form" id="login-form" name="login-form">
								<div class="form-group input-group">
									<span class="input-group-addon glyphicon glyphicon-user"></span>
									<input type="text" name="email" placeholder="email" class="email form-control" id="form-email">
								</div>
								<div class="form-group input-group">
									<span class="input-group-addon glyphicon glyphicon-lock"></span>
									<input type="password" name="password" placeholder="password" class="form-password form-control" id="form-password">
								</div>
								<button type="button" class="btn" id="btn-login" data-loading-text="Loading..." >Sign in</button>
							</form>
						</div>
						
						<!-- <div class="form-bottom">
							<form role="form" class="login-form" id="login-form" name="login-form">
								<div class="form-group">
									<label class="col-sm-2 control-label" for="form-email">Email</label> 
									<div class="col-sm-10">
										<input type="text" name="email" placeholder="email" class="email form-control" id="form-email">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="form-password">Password</label> 
									<div class="col-sm-10">
										<input type="password" name="password" placeholder="password" class="form-password form-control" id="form-password">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">	
										<button type="button" class="btn" id="btn-login" data-loading-text="Loading..." >Sign in</button>
									</div>
								</div>
							</form>
						</div> -->
					</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<script src="static/js/jquery-1.10.2.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/bootstrapValidator.js"></script>
	<script src="static/js/jquery.backstretch.min.js"></script>
	<script src="static/js/scripts.js"></script>

	<script type="text/javascript">
	
	$(document).ready(function() {
	    $('.login-form').bootstrapValidator({
		            message: 'This value is not valid',
		            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
		                valid: 'glyphicon glyphicon-ok',
		                invalid: 'glyphicon glyphicon-remove',
		                validating: 'glyphicon glyphicon-refresh'
		            },
		            fields: {/*验证*/
		            	
		                'email': {
		                    validators: {
		                        notEmpty: {
		                            message: 'The email address is required and can\'t be empty'
		                        },
		                        emailAddress: {
		                            message: 'The input is not a valid email address'
		                        }
		                    }
		                },
		                'password': {
		                    validators: {
		                        notEmpty: {
		                            message: 'The password is required and can\'t be empty'
		                        }
		                    }
		                },
		               
		            }
		  });
	    
	    $("#btn-login").click(function() {
	    	var tab_btn = $(this);
	    	var mailValidator  = $("#login-form").data("bootstrapValidator");
			mailValidator.validate();
			console.log(mailValidator.isValid());
			if(mailValidator.isValid()){
				tab_btn.button('loading').delay(1000).queue(function() {
					
		    		var data = $("#login-form").serialize();
		 			$.ajax({
		 				url :"user/login",
		 				type : "POST",
		 				data : data,
		 				success : function(result) {
		 					console.log(result);
		 					if(result.code==200){
		 						swal({
		 							  title: "",
		 							  text: "The email or password is wrong.Please try it again!",
		 							  confirmButtonColor: "#DD6B55",
		 							  
		 							},
		 							function(){
		 								tab_btn.button('reset');
		 								tab_btn.dequeue(); 
		 						    });
		 					}else{
		 						window.location.href = "user/query";
		 						
		 					}
		 				},
		 				complete : function(XMLHttpRequest,status){ //请求完成后最终执行参数
		 				　　　　if(status=='timeout'){//超时,status还有success,error等值的情况
		 				　　　　　 swal({
							 	  title: "",
	 							  text: "Connect timeout!"
	 							},
	 							function(){
	 								tab_btn.button('reset');
	 								tab_btn.dequeue(); 
	 						    });
		 				　　　　}
	 				　　},
		 			});
		             
		        });
			}
			
		});
	});
	
	
	</script>
</body>
</html>