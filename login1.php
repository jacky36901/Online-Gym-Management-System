<?php
 require('index.top.php');
//session_start();
 //include ("header.php");
// include ("connection.inc.php");
// include ("function.inc.php");

$utype='';
$username='';
$msg="";
$User_type='';
$u1="admin";
$u2="staff";
$u3="customer";
if(isset($_POST['submit'])){
    $username=get_safe_value($con,$_POST['username']);
    $password=get_safe_value($con,$_POST['password']);
   
    
    $sql="select * from tb_log where username='$username' and password='$password' ";
    $res=mysqli_query($con,$sql);
    $count=mysqli_num_rows($res);
    $row=mysqli_fetch_assoc($res);
    $usertype=$row['usertype'];
  
    
    //admin
    if($count>0 && $usertype==$u1 )
      { echo "Hello world";
        $_SESSION['usertype']="admin";
    
         $_SESSION['USER_LOGIN']=$username;
        header("location:admin/categories.php"); 
      }
    //staff  
      else if($count>0 && $usertype==$u2)
    {
        $_SESSION['usertype']="staff";
      
         $_SESSION['USER_LOGIN']=$username;
        
        header("location:staff/staf.cat.php");
    }
    //customer
        else if($count>0 && $usertype==$u3)
    {
      

        
       $_SESSION['USER_LOGIN']=$username;
        header("location:customer/index.customer.php");
    }
       
        
    else {
        
        echo "<script>";
        echo "alert('this account does not exist')";
        echo "</script>";
        $msg="Please enter valid login details";
    }
}

if(isset($_POST['signup'])){
$cust_fname=get_safe_value($con,$_POST['cust_fname']);
$cust_lname=get_safe_value($con,$_POST['cust_lname']);
$cust_num=get_safe_value($con,$_POST['cust_num']);
$cust_age=get_safe_value($con,$_POST['cust_age']);
$cust_gen=get_safe_value($con,$_POST['cust_gen']);
$cust_house=get_safe_value($con,$_POST['cust_house']);
$cust_city=get_safe_value($con,$_POST['cust_city']);
$cust_pin=get_safe_value($con,$_POST['cust_pin']);
$username=get_safe_value($con,$_POST['username']);
$password=get_safe_value($con,$_POST['password']);

$check_user=mysqli_num_rows(mysqli_query($con,"select * from tb_customer where cust_username='$username'"));
if($check_user>0){
    echo "email_present";
}
else{

     mysqli_query($con,"insert into tb_log (username,usertype,password) values ('$username','customer','$password')");

   // echo "insert into tb_log (username,usertype,password) values ('$username','customer','$password')";
    mysqli_query($con,"insert into tb_customer(cust_username,cust_firstname,cust_lastname,cust_phno,cust_hname,cust_city,cust_gen,cust_pin,cust_age) values('$username','$cust_fname','$cust_lname','$cust_num','$cust_house','$cust_city','$cust_gen','$cust_pin','$cust_age')") or die(mysqli_error($con));
    

   //echo "insert";

}
}


?>

 <div class="main-banner" id="top">
        <video autoplay muted loop id="bg-video">
            <source src="assets/images/gym-video.mp4" type="video/mp4" />
        </video>

        <div class="video-overlay header-text">
            <div class="caption">
                <h6>work harder, get stronger</h6>
                <h2>easy with our <em>gym</em></h2>
               
            </div>
        </div>
    </div>
     <!-- Stard Bradcaump area -->
        <!-- Start Contact Area -->
        <section class="htc__contact__area ptb--100 bg__white" style="background:#afd192; 
        ">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="contact-form-wrap mt--60">
                            <div class="col-xs-12">
                                <div class="contact-title">
                                    <h2 class="title__line--6">Login</h2>
                                </div>
                            </div>
                            <div class="col-xs-12">
                                <form id="login-form" method="post">
                                    <div class="single-contact-form">
                                        <div class="contact-box name">
                                            <input type="text" name="username" id="login_email" placeholder="Your Email*" style="width:100%">
                                        </div>
                                        <span class="field_error" id="login_email_error"></span>
                                    </div>
                                    <div class="single-contact-form">
                                        <div class="contact-box name">
                                            <input type="password" name="password" id="login_password" placeholder="Your Password*" style="width:100%">
                                        </div>
                                        <span class="field_error" id="login_password_error"></span>
                                    </div>

                                    
                                    <div class="contact-btn">
                                       <input  type="submit" class="btn" value="Login" name="submit" style="background: #000;color: #fff;margin-left:200px;margin-top: 10px;width: 60x; "> <br>
                                    </div>
                                    <?php echo $msg ?>
                                </form>
                                <div class="form-output login_msg">
                                    <p class="form-messege"></p>
                                </div>
                            </div>
                        </div> 
                
                </div>
                

                    <div class="col-md-6">
                        <div class="contact-form-wrap mt--60">
                            <div class="col-xs-12">
                                <div class="contact-title">
                                    <h2 class="title__line--6">Register</h2>
                                </div>
                            </div>
                            <div class="col-xs-12">
                                <form id="register-form"  method="POST">
                                    <div class="single-contact-form">
                                        <div class="contact-box name">
                                            <input type="text" name="cust_fname" id="cust_fname" pattern="[A-Za-z]{1,32}" title="First Name can only contain Alphabets" placeholder="Your First Name*" style="width:100%">
                                        </div>
                                        <span class="field_error" id="fname_error"></span>
                                    </div>
                                    <div class="single-contact-form">
                                        <div class="contact-box name">
                                            <input type="text" name="cust_lname"  id="cust_lname" pattern="[A-Za-z]{1,32}" title="Last Name can only contain Alphabets" placeholder="Your Last Name*" style="width:100%">
                                        </div>
                                        <span class="field_error" id="lname_error"></span>
                                    </div>
                                    <div class="single-contact-form">
                                        <div class="contact-box name">
                                            <input type="text" name="cust_num" id="cust_num" pattern="[6-9]{1}[0-9]{9}" title="Enter valid mobile number" placeholder="Your Mobile number*" style="width:100%">
                                        </div>
                                        <span class="field_error" id="mobile_error"></span>
                                    </div>
                                         <div class="single-contact-form">
                                        <div class="contact-box name">
                                            <input type="text" name="cust_age" id="cust_age" placeholder="Your AGE " style="width:100%">
                                        </div>
                                        <span class="field_error" id="mobile_error"></span>
                                    </div>
                                     <div class="single-contact-form">
                                        <div class="contact-box name">
                                            <input type="text" name="cust_gen" id="cust_gen" placeholder="Your GENDER " style="width:100%">
                                        </div>
                                        <span class="field_error" id="mobile_error"></span>
                                    </div>


                                    <div class="single-contact-form">
                                        <div class="contact-box name">
                                            <input type="text" name="cust_house" id="cust_house" placeholder="Your house name" style="width:100%">
                                        </div>
                                        <span class="field_error" id="mobile_error"></span>
                                    </div>
                                    <div class="single-contact-form">
                                        <div class="contact-box name">
                                            <input type="text" name="cust_city" id="cust_city" placeholder="Your City Name*" style="width:100%">
                                        </div>
                                        <span class="field_error" id="city_error"></span>
                                    </div>
                                    
                                    <div class="single-contact-form">
                                        <div class="contact-box name">
                                            <input type="text" name="cust_pin" id="cust_pin" placeholder="Your Pincode" style="width:100%">
                                        </div>
                                        <span class="field_error" id="pin_error"></span>
                                    </div>
                                    <div class="single-contact-form">
                                        <div class="contact-box name">
                                            <input type="email" name="username" id="username" placeholder="Your Email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" title="Enter valid email" style="width:100%">
                                        </div>
                                        <span class="field_error" id="email_error"></span>
                                    </div>
                                    <div class="single-contact-form">
                                        <div class="contact-box name">
                                            <input type="password" name="password" id="password"  placeholder="Your Password*" style="width:100%" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                              title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters">
                                        </div>
                                        <span class="field_error" id="password_error"></span>
                                    </div>
                                                                      
                                    <div class="contact-btn">
                                        <button type="submit" class="fv-btn" name="signup"  style="background: #000;color: #fff;margin-left:200px;margin-top: 10px;width: 60x; ">Register</button>
                                    </div>
                                    <script>
        window.onload = function() {
            document.getElementById("password").onchange = validatePassword;
            document.getElementById("password1").onchange = validatePassword;
        }

        function validatePassword() {
            var pass2 = document.getElementById("password").value;
            var pass1 = document.getElementById("password1").value;
            if (pass1 != pass2)
                document.getElementById("password1").setCustomValidity("Passwords Don't Match");
            else
                document.getElementById("password1").setCustomValidity('');
            //empty string means no validation error
        }
    </script>

                                </form>
                                <div class="form-output register_msg">
                                    <p class="form-messege field_error"></p>
                                </div>
                            </div>
                        </div> 
                
                </div>
                    
            </div>
        </section>
        <!-- End Contact Area -->
        <!-- End Banner Area -->
        <!-- Start Footer Area --<!-- script for password match -->
    <script>
        window.onload = function() {
            document.getElementById("password1").onchange = validatePassword;
            document.getElementById("password2").onchange = validatePassword;
        }

        function validatePassword() {
            var pass2 = document.getElementById("password2").value;
            var pass1 = document.getElementById("password1").value;
            if (pass1 != pass2)
                document.getElementById("password2").setCustomValidity("Passwords Don't Match");
            else
                document.getElementById("password2").setCustomValidity('');
            //empty string means no validation error
        }
    </script>>
    
    <!-- Body main wrapper end -->

<?php require('index.foot.php')?>
        