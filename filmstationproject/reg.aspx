<%@ Page Language="C#" AutoEventWireup="true" CodeFile="reg.aspx.cs" Inherits="reg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Film Station</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/magnify.css" rel="stylesheet" />
       

    <link href="css/Custom-Cs.css" rel="stylesheet" />
 <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
  <style>
      
    /* Remove the navbar's default rounded borders and increase the bottom margin */
    
     .navbar {
      margin-bottom: 50px;
      border-radius: 0;
       height:80px;
      background-color:black;
      

      
    }
    
    /* Remove the jumbotron's default bottom margin */ 
     .jumbotron {
      margin-bottom: 0;
    }
   
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
  </style>
      <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
  }
          .nav, .navbar-nav{
               
            margin-top:1%;
            margin-left:5%;
          }
            
.navbar-inverse .navbar-nav > li > a:hover,
.navbar-inverse .navbar-nav > li > a:focus

{
    background-color: gray;
}
                   

 

  </style>
     <script src='https://www.google.com/recaptcha/api.js'></script>

</head>
<body style="background-color:black;">
    <nav style="height:90px;" class="navbar navbar-inverse navbar-fixed-top ">
  <div class="container-fluid">
    <div class="navbar-header">
      <button style="margin-bottom:7%;" type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="Default.aspx"><img src="Images/logo.png" height="65"/></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="Default.aspx">Home</a></li>
        <li><a href="Product.aspx">Products</a></li>
          <asp:SqlDataSource runat="server" ID="CategorySqlDataSource1" ConnectionString='<%$ ConnectionStrings:FilmStationConnectionString %>' SelectCommand="SELECT * FROM [category]"></asp:SqlDataSource>
           <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Products<b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li class="dropdown-header">Categories</li>
                                    <li role="separator" class="divider"></li>
                                    
               <asp:Repeater ID="RptrCategory" runat="server" DataSourceID="CategorySqlDataSource1">
                   
                   <ItemTemplate> <li><a href="Category.aspx?id=<%#Eval("cat_id") %>"><%# Eval("cat_name") %> </a></li></ItemTemplate>
               </asp:Repeater>
          <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:FilmStationConnectionString %>' SelectCommand="SELECT * FROM [category]"></asp:SqlDataSource>
               
          

                                    
                                    
                                </ul>
                            </li>
  
      
      
        <li><a href="#">Contact</a></li>
      </ul>
     
      </ul>
    </div>
  </div>
</nav>
    
<br>

<br>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            

            $('#contact_form').bootstrapValidator({
                // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    txt_fname: {
                        validators: {
                            stringLength: {
                                min: 2,
                            },
                            notEmpty: {
                                message: 'Please enter your First Name'
                            }
                        }
                    },
                    txt_lname: {
                        validators: {
                            stringLength: {
                                min: 2,
                            },
                            notEmpty: {
                                message: 'Please enter your Last Name'
                            }
                        }
                    },
                    txt_pass: {
                        validators: {
                            stringLength: {
                                min: 8,
                            },
                            notEmpty: {
                                message: 'Please enter your Password of min 8 characters'
                            }
                        }
                    },
                    confirm_password: {
                        validators: {
                            stringLength: {
                                min: 8,
                            },
                            notEmpty: {
                                message: 'Please confirm your Password'
                            },
                            identical: {
                                field: 'txt_pass',
                                message: 'Password does not match'
                            }

                        }
                    },
                    txt_email: {
                        validators: {
                            notEmpty: {
                                message: 'Please enter your Email Address'
                            },
                            emailAddress: {
                                message: 'Please enter a valid Email Address'
                            }
                        }
                    },
                    contact_no: {
                        validators: {
                            stringLength: {
                                min: 12,
                                max: 12,
                                notEmpty: {
                                    message: 'Please enter your Contact No.'
                                }
                            }
                        } },
                    department: {
                        validators: {
                            notEmpty: {
                                message: 'Please select your Department/Office'
                            }
                        }
                    },
                    txt_phno: {
                        validators: {
                            stringLength: {
                                min: 10,
                                max:10,
                            },
                            notEmpty: {
                                message: 'Please enter your 10 digit mobile no.'
                            }
                        }
                    },
                    txt_pincode: {
                        validators: {
                            stringLength: {
                                min: 6,
                                max: 6,
                            },
                            notEmpty: {
                                message: 'Please enter your 6 digit PIN code'
                            }
                        }
                    },
                    txt_city: {
                        validators: {
                            stringLength: {
                                min: 2,
                            },
                            notEmpty: {
                                message: 'Please enter your city Name'
                            }
                        }
                    },
                    txt_state: {
                        validators: {
                            stringLength: {
                                min: 2,
                            },
                            notEmpty: {
                                message: 'Please enter your State Name'
                            }
                        }
                    },
                    txt_addr: {
                        validators: {
                            stringLength: {
                                min: 2,
                            },
                            notEmpty: {
                                message: 'Please enter your Address'
                            }
                        }
                    },
                }
            })
                
        });
    </script>

   <!-- <script type="text/javascript">

        $(document).ready(function () {

            // Generate a simple captcha

            function randomNumber(min, max) {

                return Math.floor(Math.random() * (max - min + 1) + min);

            };

            
            $('#captchaOperation').html([randomNumber(1, 100), '+', randomNumber(1, 200), '='].join(' '));
            $('#contact_form').bootstrapValidator({
                captcha: {

                    validators: {

                        callback: {

                            message: 'Wrong answer',

                            callback: function (value, validator) {

                                var items = $('#captchaOperation').html().split(' '), sum = parseInt(items[0]) + parseInt(items[2]);

                                return value == sum;

                            }

                        }

                    }

                }

            });
    </script>-->
   
            

    <style>
        #success_message{ display: none;}
        .inputGroupContainer,.selectContainer {
        
            margin-left:30%;
        }


        #contact_form{
        
        background-color:black;
        
        }
    </style>

    
       <div class="container reg">

    <form runat="server" class="well form-horizontal" action=" " method="post"  id="contact_form">
<fieldset>

<!-- Form Name -->
<legend><center><h2><b><font color="white">Registrsation Form</font></b></h2></center></legend><br>

<!-- Text input-->
        
<div class="form-group">
 
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <asp:TextBox runat="server" ID="txt_fname" placeholder="First Name" CssClass="form-control"></asp:TextBox>
    </div>
  </div>
</div>

<!-- Text input-->

<div class="form-group">
  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <asp:TextBox runat="server" ID="txt_lname" placeholder="Last Name" class="form-control"></asp:TextBox>
    </div>
  </div>
</div>

    <!-- Text input-->
       <div class="form-group">
 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
  <asp:TextBox runat="server" ID="txt_email" placeholder="E-Mail Address e.g:abc@xyz.com" class="form-control"></asp:TextBox>
    </div>
  </div>
</div>

    <!-- Text input-->

<div class="form-group">
 
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
  <asp:TextBox type="number" runat="server" ID="txt_phno" placeholder="Phone no." CssClass="form-control"></asp:TextBox>
      
    </div>
  </div>
</div>

    <!-- Text input-->

<div class="form-group">
  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
  <asp:TextBox runat="server" ID="txt_addr" placeholder="Enter your Address" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
    </div>
  </div>
</div>

    <div class="form-group">
 
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
  <asp:TextBox runat="server" ID="txt_city" placeholder="city" CssClass="form-control"></asp:TextBox>
    </div>
  </div>
</div>
  

    <!-- Text input-->

<div class="form-group">
  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
  <asp:TextBox runat="server" ID="txt_state" placeholder="State" CssClass="form-control"></asp:TextBox>
    </div>
  </div>
</div>

    <!-- Text input-->

<div class="form-group">
  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
  <asp:TextBox type="number" runat="server" ID="txt_pincode" placeholder="Enter 6 digit PIN code" CssClass="form-control"></asp:TextBox>
    </div>
  </div>
</div>

    <div class="form-group"> 
 
    <div class="col-md-4 selectContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
    <select name="country" class="form-control selectpicker">
      <option value="">Select your Country</option>
      <option value="USA">USA</option>
      <option value="UK">UK</option>
      <option value="India">India</option>
      <option value="China">China</option>
      <option value="Japan">Japan</option>
      <option value="Srilanka">Srilanka</option>
      <option value="South America">South America</option>
      <option value="France">Frnace</option>
      <option value="Singapore">Singapore</option>
    </select>
  </div>
</div>
</div>
  

<!-- Text input-->

<div class="form-group">
  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
  <asp:TextBox runat="server" ID="txt_pass" placeholder="Password" class="form-control"  TextMode="Password"></asp:TextBox>
    </div>
  </div>
</div>

<!-- Text input-->

<div class="form-group">
  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
  <asp:TextBox runat="server" ID="confirm_password" placeholder="Confirm Password" class="form-control"  TextMode="Password"></asp:TextBox>
    </div>
  </div>
</div>




  

       


<!-- Select Basic -->

<!-- Success message -->
<div class="alert alert-success" role="alert" id="success_message">Success <i class="glyphicon glyphicon-thumbs-up"></i> Success!.</div>

<!-- Button -->
<div class="form-group">
  
  <div class="col-md-4 inputGroupContainer"><br>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<asp:Button runat="server" ID="btnsubmit" OnClick="btnsubmit_Click" type="submit" class="btn btn-success" Text="SUBMIT"></asp:Button>
     
      
      <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
      <a href="Login.aspx">Login</a>
  </div>
</div>
        
</fieldset>
</form>
</div>

    <br /><br />
  
 <div class="container"> </div><div>
<footer style="background-color:black; color:white; text-align:center;">
    
 <p>&copy FilmStation.com Copyright</p>
    
</footer>
    </div><!-- /.container -->
    <script src="js/bootstrap.js"></script>
</body>
</html>
