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
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.ebay.giftme.CSVDBUtil" %>
<%@ page import="java.util.StringTokenizer" %>
<%String[] output=null; %>
<%String[] ele1, ele2, ele3;%>
<%Map<String, String[]> myMap = new HashMap<String, String[]>();%> 

<%String name="";String[] vals;String friendname="";String[] splits;String link="";String imgg="";String price="";String desc="";%> 

<%

String ebayID = request.getParameter("ebayUserId");
String profID = request.getParameter("fbprofileid");
//String profID = "716882961707040";

String dob = request.getParameter("fbdob");

String finalS = profID+","+ebayID+","+dob;

CSVDBUtil.appendItem(finalS);


%>

<%-- </head>
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

	<div><span class="arrow-down"></span></div>
	<div id="portfolio" class="container">
	<table> -->
	 
	 <%
		 
	String ebayID = request.getParameter("ebayUserId");
	//String profID = request.getParameter("fbprofileid");
	 String profID = "716882961707040";
	
	String dob = request.getParameter("fbdob");
	
	String friends = request.getParameter("fbfriends");
	String friendsnames = request.getParameter("fbfriends");
	String[] str = friends.split(":");
	 String[] strname = friendsnames.split(":"); 
	myMap.clear();
	
	
	
	
	System.out.println("friends id "+friends);
	
	if(str.length>1){
		
		for(String friend : str) {
			System.out.println("friends id "+friend);
		}
	
	for(int i=0;i<str.length;i=i+1){
		String val = str[i];
		System.out.println("friends id "+val);
		ele1 = null; ele2 = null; ele3 = null;
	    if(ebayID == null||ebayID.isEmpty()){
	    	ebayID = EbayFBSync.checkifexists(str[i]);
	    	 output= WishlistGen.getWishList(ebayID);
	    	 myMap.put(val, output);
	    
	    
	    	 
	    }
	
		
		
	}
	}
	else{
	if(ebayID == null||ebayID.isEmpty()){
		ebayID = EbayFBSync.checkifexists(str[0]);
		 
		 System.out.println(ebayID);
		  output= WishlistGen.getWishList(ebayID);
		  myMap.put(str[0], output);
		 
	}
	}

for (Map.Entry<String, String[]> entry : myMap.entrySet()) {
	 name= entry.getKey();
	String[] test = entry.getValue();
	friendname=name;
	%>
	<div id="welcome"><%=friendname %>
	<%
	for(int g=0;g<test.length;g++){
	String value = test[g];
	System.out.println(value);
	 splits = value.split("\\|");
		link=splits[0];
		desc=splits[1];
		imgg=splits[2];
		System.out.println(splits[3]); 
		
	/* 	StringTokenizer tokenizer = new StringTokenizer(value, "|");
	
		link= tokenizer.nextToken();
		desc = tokenizer.nextToken();
		imgg= tokenizer.nextToken();
		System.out.println(link+" "+desc+" "+imgg); */
	     
	}
		
	%>

	<div class="column" style="position:relative;float:left;">
			<div class="box">
			 <a id="img1" href="<%=link %>"> ><img src="<%=imgg %>"/></a>
				<p><%=desc %></p>
		  <a href="<%=link %>" class="button button-small">Buy it</a>
		  
		 
		   </div>
		</div>
		
	 --%>

	<div id="three-column" class="container">
	<div><span class="arrow-down"></span></div>
	<div class="title">
			<h2>Sumi's Birthday is coming up...Here is here wish list</h2>
		</div>
	<div id="tbox1">
		<div class="title">
			<a href="#"><img src="http://thumbs.ebaystatic.com/pict/1111928071534040_1.jpg"/></a>
		</div>
		<p>AOC 32" LCD TV inch HD Ready USB 3 Yrs Manufacturer Warranty Full LED Remote IPS</p>
		<a href="http://www.ebay.in/itm/111192807153?ssPageName=STRK:MESINDXX:IT&_trksid=p3984.m1436.l2648" class="button">Learn More</a>
		 </div>
	<div id="tbox2">
		<div class="title">
			<a href="#"><img src="http://thumbs.ebaystatic.com/pict/1713195088394040_1.jpg"/></a>
		</div>
		<p>Philips 20" LCD TV with Digital Crystal Clear Image - 20PFL4122/98 - Sealed Pack</p>
		<a href="http://www.ebay.in/itm/171319508839?ssPageName=STRK:MESINDXX:IT&_trksid=p3984.m1436.l2649" class="button">Learn More</a>
		 </div>
	<div id="tbox3">
		<div class="title">
			<a href="#"><img src="http://thumbs.ebaystatic.com/pict/3011765099284040_1.jpg"/></a>
		</div>
		<p>BEAUTY for Women by CALVIN KLEIN EDP SPRAY 3.4 oz ~ NEW IN TESTER BOX/p>
		<a href="http://www.ebay.com/itm/BEAUTY-Women-CALVIN-KLEIN-EDP-SPRAY-3-4-oz-NEW-TESTER-BOX-/331146818208" class="button">Learn More</a>
		 </div>
</div>


}
   %>


</table>

	
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
