<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by TEMPLATED
http://templated.co
Released for free under the Creative Commons Attribution License

Name       : Undeviating 
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20140322

-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />

<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->
<%@ page import="com.giftme.properties.EbayFBSync" %>
<%@ page import="com.giftme.properties.WishlistGen" %>
<%
String ebayID = request.getParameter("ebayUserId");
String profID = request.getParameter("fbprofileid");
String dob = request.getParameter("fbdob");
String friends = request.getParameter("fbfriends");
String[] str = friends.split(":");
String output=null;
System.out.println(str.length);
for(int i=0;i<str.length;i++){
    if(ebayID == null||ebayID.isEmpty()){
    	ebayID = EbayFBSync.checkifexists(str[i]);
    }
   output= WishlistGen.getWishList(ebayID);
   System.out.println(str[i]);
    
}
%>

</head>
<body>
<div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo">
        	<img src="images/cutoutlogo.jpg" alt="some_text">
		</div>
		<div id="menu">
			<ul>
				<li><a href="index.jsp" accesskey="1" title="">My Home</a></li>
				<li class="active"><a href="friends.jsp" accesskey="2" title="">Friends Wishes</a></li>
				<!-- <li><a href="#" accesskey="3" title="">About Us</a></li>
				<li><a href="#" accesskey="4" title="">Careers</a></li>
				<li><a href="#" accesskey="5" title="">Contact Us</a></li> -->
			</ul>
		</div>
	</div>
</div>
<div class="wrapper">
	<!-- <div id="banner" class="container"><img src="images/banner.jpg" width="1200" height="500" alt="" /></div> -->
<!-- 	<div id="welcome" class="container">
    	
  
		<form action="/com/handler/configHandle">
		<table align="center">
		<tr><td><h4>Name</h4></td><td><input type="text"/> </td></tr>
		<tr><td><h4>eBay User ID</h4></td><td><input type="text"/> </td></tr>
		<tr><td><a href="#" class="button">Submit</a> </td></tr>
		</table>
		</form>
	</div> -->

<!-- 	<div id="three-column" class="container">
		
		<div class="title">
				<h2>My wishlist</h2>
			</div>
		<div id="tbox1">
			<div class="title">
				<h2>Maecenas luctus</h2>
			</div>
		</div>
		<div id="tbox2">
			<div class="title">
				<h2>Integer gravida</h2>
			</div>
		</div>
		<div id="tbox3">
			<div class="title">
				<h2>Praesent mauris</h2>
			</div>
		</div>
	</div> -->
	<h2>friends <%= friends %> <br/></h2>
	<div><span class="arrow-down"></span></div>
	<div id="portfolio" class="container">
		<!-- <div class="column1">
			<div class="box">
			  <h3>Vestibulum venenatis</h3>
				<p>Fermentum nibh augue praesent a lacus at urna congue rutrum.</p>
		  <a href="#" class="button button-small">Etiam posuere</a>
		  <a id="img1" href="" />
		  <a id="link1" href=""/>
		   </div>
		</div>
		<div class="column2">
			<div class="box">
			  <h3>Praesent scelerisque</h3>
				<p>Vivamus fermentum nibh in augue praesent urna congue rutrum.</p>
		  <a href="#" class="button button-small">Etiam posuere</a> 
		  <a id="img2" href="" />
		  <a id="link2" href=""/>
		  </div>
		</div>
		<div class="column3">
			<div class="box">
			  <h3>Donec dictum metus</h3>
				<p>Vivamus fermentum nibh in augue praesent urna congue rutrum.</p>
		  <a href="#" class="button button-small">Etiam posuere</a>
		  <a id="img3" href="" />
		  <a id="link3" href=""/>
		   </div>
		   
		</div>
		<div class="column4">
			<a id="more" href=""/>
		   
		</div> -->
		<%=output %>
	</div>
</div>
<div id="footer">
	<div class="container">
		<div class="fbox1">
		<span class="icon icon-map-marker"></span>
			<span>1234 Fictional Road Suite #789
			<br />Nashville TN 00000</span>
		</div>
		<div class="fbox1">
			<span class="icon icon-phone"></span>
			<span>
				Telephone: +1 800 123 4657
			</span>
		</div>
		<div class="fbox1">
			<span class="icon icon-envelope"></span>
			<span>businessname@business.com</span>
		</div>
	</div>
</div>
<!-- <div id="copyright">
	<p>&copy; Untitled. All rights reserved. | Photos by <a href="http://fotogrph.com/">Fotogrph</a> | Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>.</p>
	<ul class="contact">
		<li><a href="#" class="icon icon-twitter"><span>Twitter</span></a></li>
		<li><a href="#" class="icon icon-facebook"><span></span></a></li>
		<li><a href="#" class="icon icon-dribbble"><span>Pinterest</span></a></li>
		<li><a href="#" class="icon icon-tumblr"><span>Google+</span></a></li>
		<li><a href="#" class="icon icon-rss"><span>Pinterest</span></a></li>
	</ul>
</div> -->
</body>
</html>
