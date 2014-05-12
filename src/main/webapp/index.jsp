<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by TEMPLATED
http:eleased for free under the Creative Commons Attribution License//templated.co
R

Name       : Sumit Bala 
Description: GiftME App index page.
Version    : 1.0
Released   : 20140512

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

</head>
<body>
<script>
  window.fbAsyncInit = function() {
	FB.init({
	  appId      : '754065517957462',
	  xfbml      : true,
	  version    : 'v2.0'
	});
	FB.getLoginStatus(function(response) {
	  if (response.status === 'connected') {
		console.log('Logged in.');
		testAPI();
	  }
	  else {
		//FB.login();
		FB.login(function (response) {
		if (response.authResponse) {
			// authorized
		} else {
			// canceled
		}
		}, {scope: 'email,user_birthday,public_profile,user_friends'});
	  }
	});
  };

  (function(d, s, id){
	 var js, fjs = d.getElementsByTagName(s)[0];
	 if (d.getElementById(id)) {return;}
	 js = d.createElement(s); js.id = id;
	 js.src = "//connect.facebook.net/en_US/sdk.js";
	 fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));

  function testAPI() {
  
	var myId = 0;
	FB.api('/me', function(response) {
		myId = response.id;
		document.getElementById('id-fbname').value = response.name;
		document.getElementById('id-fbdob').value = response.birthday;
		document.getElementById('id-fbprofileid').value = response.id;
		
	FB.api('/me/friends', function(response) {
	var str = "";
	var friends = "";
	for(var i = 0; i < Math.min(response.data.length, 10); i++) {
     //str = str + response.data[i].name;
	 if(i > 0) {
	   friends = friends + ":";
	 }
	 friends = friends + response.data[i].id;
     }
     //alert(str);
	 document.getElementById('id-fbfriends').value = friends;
	});
	});
  }
</script>
</script>
<!--fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
</fb:login-button-->
<fb:profile-pic uid="loggedinuser" size="square" facebook-logo="true"></fb:profile-pic>
<fb:login-button 
    autologoutlink="true" 
    onlogin="OnRequestPermission();">
</fb:login-button>
<fb:name uid="loggedinuser" use-you="no"></fb:name>
<div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo">
        	<img src="images/cutoutlogo.jpg" alt="some_text">
		</div>
		<div id="menu">
			<ul>
				<li class="active"><a href="index.jsp" accesskey="1" title="">My Home</a></li>
				<li><a href="friends.jsp" accesskey="2" title="">Friends Wishes</a></li>
				<!-- <li><a href="#" accesskey="3" title="">About Us</a></li>
				<li><a href="#" accesskey="4" title="">Careers</a></li>
				<li><a href="#" accesskey="5" title="">Contact Us</a></li> -->
			</ul>
		</div>
	</div>
</div>
<div class="wrapper">
	<!-- <div id="banner" class="container"><img src="images/banner.jpg" width="1200" height="500" alt="" /></div> -->
	<div id="welcome" class="container">
    	
     <div class="title">
	  <h2>Welcome to our website</h2>
		</div>
		<form action="main.jsp" method="post">
		<table align="center">
		<tr><td><h4>Name</h4></td><td><input type="text" id="id-fbname" name="fbname"/> </td></tr>
		<tr><td><h4>Date-Of-Birth</h4></td><td><input type="text" id="id-fbdob" name="fbdob"/> </td></tr>
		<tr><td><h4>eBay User ID</h4></td><td><input type="text" name="ebayUserId"/> </td></tr>
		<tr><td><h4></h4></td><td><input id="id-fbprofileid" name="fbprofileid" type="hidden"/> </td></tr>
		<tr><td><h4></h4></td><td><input id="id-fbfriends" name="fbfriends" type="hidden"/> </td></tr>
		<tr><td><input type="submit" class="button"/> </td></tr>
		</table>
		</form>
	</div>
	<div id="welcome" class="container" style="display:none;">
	
		<h2>Welcome user</h2>
	</div>
	<div id="three-column" class="container">
		<div><span class="arrow-down"></span></div>
		<div class="title">
				<h2>My wishlist</h2>
			</div>
		<div id="tbox1">
			<div class="title">
				<h2>Maecenas luctus</h2>
			</div>
			<p>Nullam non wisi a sem semper eleifend. Donec mattis libero eget urna. Duis pretium velit ac suscipit mauris. Proin eu wisi suscipit nulla suscipit interdum.</p>
			<a href="#" class="button">Learn More</a> </div>
		<div id="tbox2">
			<div class="title">
				<h2>Integer gravida</h2>
			</div>
			<p>Proin eu wisi suscipit nulla suscipit interdum. Nullam non wisi a sem semper suscipit eleifend. Donec mattis libero eget urna. Duis  velit ac mauris.</p>
			<a href="#" class="button">Learn More</a> </div>
		<div id="tbox3">
			<div class="title">
				<h2>Praesent mauris</h2>
			</div>
			<p>Donec mattis libero eget urna. Duis pretium velit ac mauris. Proin eu wisi suscipit nulla suscipit interdum. Nullam non wisi a sem suscipit  eleifend.</p>
			<a href="#" class="button">Learn More</a> </div>
	</div>
<!-- 	<div id="portfolio" class="container">
		<div class="column1">
			<div class="box">
			  <h3>Vestibulum venenatis</h3>
				<p>Fermentum nibh augue praesent a lacus at urna congue rutrum.</p>
		  <a href="#" class="button button-small">Etiam posuere</a> </div>
		</div>
		<div class="column2">
			<div class="box">
			  <h3>Praesent scelerisque</h3>
				<p>Vivamus fermentum nibh in augue praesent urna congue rutrum.</p>
		  <a href="#" class="button button-small">Etiam posuere</a> </div>
		</div>
		<div class="column3">
			<div class="box">
			  <h3>Donec dictum metus</h3>
				<p>Vivamus fermentum nibh in augue praesent urna congue rutrum.</p>
		  <a href="#" class="button button-small">Etiam posuere</a> </div>
		</div>
		<div class="column4">
			<div class="box">
			  <h3>Mauris vulputate dolor</h3>
				<p>Rutrum fermentum nibh in augue praesent urna congue rutrum.</p>
		  <a href="#" class="button button-small">Etiam posuere</a> </div>
		</div>
	</div> -->
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
