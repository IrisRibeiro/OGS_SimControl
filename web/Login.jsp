<%-- 
    Document   : Login
    Created on : Oct 29, 2014, 12:37:40 PM
    Author     : Iris
--%>


<%@page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"   %>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">   

        <title>SimControl - Login</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="css/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/sb-admin-2.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script>
        function validateForm() { 
            if(document.frm.UserName.value=="") { 
                alert("User Name should not be blank.."); 
                document.frm.UserName.focus(); 
                return false; } 
            else if(document.frm.password.value=="") { 
                alert("Password should not be blank"); 
                document.frm.password.focus(); 
                return false; } 
        }
        </script>

    </head>
<body>
	<div class="container theme-showcase" role="main"> 
	<div class="jumbotron"> <img src="images/Logo_1.png" alt="logo_1" class="img-rounded"> </div>
	</div>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading" >
                        <h3 class="panel-title">Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <form  method="get" name="frm" action="LoginServlet" onSubmit="return validateForm()">
                            <fieldset>
                                <div class="form-group">
                                   <input class="form-control" placeholder="UserName" name="UserName" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" name="password" type="password" value="">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <input class="btn btn-lg btn-default btn-block" type="submit" value="Login"  />
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!--
 
    public void validate(String UserName, String password)throws Exception{
        if ((UserName == "")&&( password == "")){
            
        }else{
        
        }
    }

-->
    <!-- jQuery Version 1.11.0 -->
    <script src="js/jquery-1.11.0.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="js/plugins/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/sb-admin-2.js"></script>

</body>

</html>