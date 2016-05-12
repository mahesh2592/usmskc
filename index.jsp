<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
	<html lang="en">
		<head>
			<meta charset="utf-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
			<meta name="description" content="A Bootstrap based app landing page template">
			<meta name="author" content="">
			<link rel="shortcut icon" href="assets/ico/favicon.ico">

			<title>USMS-KC - Responsive App Landing Page Template</title>

			<!-- Bootstrap core CSS -->
			<link href="css/bootstrap.min.css" rel="stylesheet">

			<!-- Custom styles for this template -->
			<link href="css/custom.css" rel="stylesheet">
			<link href="css/flexslider.css" rel="stylesheet">
			
			<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
			<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300,700' rel='stylesheet' type='text/css'>
			<link href='http://fonts.googleapis.com/css?family=Noto+Sans:400,700' rel='stylesheet' type='text/css'>

			<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
			<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
			<![endif]-->
		</head>

		<body>
		
                <%@ include file="Header.jsp" %>
                    
	<div id="topWrap" class="jumbotron">
			<div class="container">
				<div class="col-md-6 col-md-push-6 jumboText">
					<h1>USMS-KC Responsive Application</h1>
					<h2>" Knowledge Transfer Portal "</h2>
				</div>
				
				
			</div>
			</div>

	<div id="featureWrap">
		<div class="container">
			<div class="row">
				<div class="col-sm-4 text-center feature">
                                    <a href="Register.jsp"><i class="fa fa-tablet icon"></i></a>
                                        <a href="Register.jsp"><h3>Register With USMS-KC</h3></a>
					<p>
					Create your own account in USMS-KC by providing simple information.
					</p>
				</div>
				<div class="col-sm-4 text-center feature">
                                    <a href="NewEvent.jsp"><i class="fa fa-pencil icon"></i></a>
                                    <a href="NewEvent.jsp"><h3>Create New Event/Presentation</h3></a>
					<p>
					Create new event or presentation.Please fill the simple form and schedule your KT.
					</p>
				</div>
				<div class="col-sm-4 text-center feature">
					 <a href="BookSelect.jsp"><i class="fa fa-star icon"></i></a>
					 <a href="BookSelect.jsp"><h3>Knowledge Center</h3></a>
					<p>
					USMS knowledge sharing portal where we can get all information in one place.
					</p>
				</div>
			</div>
		</div>
	</div> <!-- /featureWrap -->
	
	<div id="productWrap" class="altWrap">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<h2 class="sectionTitle">Modern &amp; clean portal to learn USMS</h2>
					<h3 class="sectionTitle">Sharing knowledge is one of the best way to enhance our own thoughts.</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-md-5 col-md-offset-1">
					<div class="imgWrap">
                                            <img class="img-responsive" src="assets/img/tablet.jpg" />
					</div>
				</div>
				<div class="col-md-5">
					<div class="productFeatures clearfix">
						<div class="col-xs-2 icon">
							<span class="fa-stack fa-lg">
							<i class="fa fa-circle fa-stack-2x"></i>
							<i class="fa fa-trophy fa-stack-1x fa-inverse"></i>
							</span>
						</div>
						<div class="col-xs-10">
							<h3>Amazing features</h3>
							<p></p>
						</div>
						<div class="col-xs-2 icon">
							<span class="fa-stack fa-lg">
							<i class="fa fa-circle fa-stack-2x"></i>
							<i class="fa fa-cog fa-stack-1x fa-inverse"></i>
							</span>
						</div>
						<div class="col-xs-10">
							<h3>Fully customizeable</h3>
							<p></p>
						</div>
						<div class="col-xs-2 icon">
							<span class="fa-stack fa-lg">
							<i class="fa fa-circle fa-stack-2x"></i>
							<i class="fa fa-bars fa-stack-1x fa-inverse"></i>
							</span>
						</div>
						<div class="col-xs-10">
							<h3>Clean &amp; functional layout</h3>
							<p></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
 <!-- /pricingWrap -->
<%
 String[] Desc = new String[100];
 String[] Author = new String[100];
 String[] Date = new String[100];
 String[] Title = new String[100];
 int n=0;
Class.forName("org.apache.derby.jdbc.ClientDriver");
//creating connection with the database 
Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/USMS","usms","usms");
PreparedStatement ps =con.prepareStatement("select * from Events");
ResultSet rs1=ps.executeQuery();
while (rs1.next()) {
Title[n]=rs1.getString("Title");            
Desc[n]=rs1.getString("Description");
Author[n]=rs1.getString("Owner");
Date[n]=rs1.getString("Date");
n++;
}
%>

<div id="testimonialsWrap" class="altWrap">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<h2 class="sectionTitle">Upcoming Events</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<div class="flexslider">
						<ul class="slides">
						
                                                    <% for(int i=0;i<n;i++)
                                                    {%>
                                                        <li>
								<div class="Title"> <% out.println(Title[i]);%></div>
								<div class="quote"><% out.println(Desc[i]);%> </div>                                                                
                                                                <div class="author">Presented By:<% out.println(Author[i]);%> on <% out.println(Date[i]);%></div>
							</li>
                                                    <%} %>                                                          						
						</ul>
					</div>
				</div>
			</div>
		</div>

                                               
</div>


	<!-- /testimonialsWrap -->
	
	<div id="contactWrap">
		<div class="overlay">
			<div class="container">
				<div class="row">
						<div class="col-xs-12">
						<h2 class="sectionTitle">Contact us</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12 text-center">
						<div class="blurb">
						Want to chat? Send us a message. We'd love to hear from you!
						</div>
					</div>
				</div>
					<div class="row">
						<div class="col-sm-4 col-sm-offset-2">
							<div class="inputContainer">
							<label>Name</label>
                                                        <form action="peoplemessage" >
								<input type="text" name="contactName" id="contactName" value="" class="form-control" autocomplete="off" />
							</div>
						</div>
						<div class="col-sm-4">
							<div class="inputContainer">
							<label class="screen-reader-text">Email</label>
								<input type="Email" name="email" id="email" value="" class="form-control" autocomplete="off"  />
							</div>
						</div>
						<div class="col-sm-8 col-sm-offset-2">
							<div class="inputContainer">
							<label class="screen-reader-text">Message</label>
								<textarea name="comments" id="commentsText" class="form-control" autocomplete="off"></textarea>
							</div>
						</div>
						<div class="col-sm-8 col-sm-offset-2">
                                                    <center> 
                                                        <input  type="submit" class="btn btn-primary btn-lg" value="Send"/>
                                                        <input  type="reset" class="btn btn-primary btn-lg" value="Clear"/>
                                                    </center>
                                                        </form>
						</div>
					</div>
			</div>
		</div>
	</div> <!-- /contactWrap -->
<div id="testimonialsWrap" class="altWrap">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<h2 class="sectionTitle">What people say</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<div class="flexslider">
						<ul class="slides">
							<li>
								<div class="quote">"Fantastic Application to learn about USMS"</div>
								<div class="author">Praveen Kumar</div>
							</li>
							<li>
								<div class="quote">"Needs Some Improvement in design part"</div>
								<div class="author">Barathwaj</div>
							</li>
							<li>
								<div class="quote">"Please upload some more detailed documents regarding Change Management Module"</div>
								<div class="author">Dinesh Kumar</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div> 	
<%@ include file="Footer.jsp" %>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/flexslider.js"></script>
	
<script type="text/javascript">
$(document).ready(function() {

	$('.mobileSlider').flexslider({
		animation: "slide",
		slideshowSpeed: 3000,
		controlNav: false,
		directionNav: true,
		prevText: "&#171;",
		nextText: "&#187;"
	});
	$('.flexslider').flexslider({
		animation: "slide",
		directionNav: false
	});
		
	$('a[href*=#]:not([href=#])').click(function() {
		if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') || location.hostname == this.hostname) {
			var target = $(this.hash);
			target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
			if ($(window).width() < 768) {
				if (target.length) {
					$('html,body').animate({
						scrollTop: target.offset().top - $('.navbar-header').outerHeight(true) + 1
					}, 1000);
					return false;
				}
			}
			else {
				if (target.length) {
					$('html,body').animate({
						scrollTop: target.offset().top - $('.navbar').outerHeight(true) + 1
					}, 1000);
					return false;
				}
			}

		}
	});
	
	$('#toTop').click(function() {
		$('html,body').animate({
			scrollTop: 0
		}, 1000);
	});
	
	var timer;
    $(window).bind('scroll',function () {
        clearTimeout(timer);
        timer = setTimeout( refresh , 50 );
    });
    var refresh = function () {
		if ($(window).scrollTop()>100) {
			$(".tagline").fadeTo( "slow", 0 );
		}
		else {
			$(".tagline").fadeTo( "slow", 1 );
		}
    };
		
});
</script>
  </body>
</html>