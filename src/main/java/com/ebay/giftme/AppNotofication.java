package com.ebay.giftme;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.RequestEntity;

import com.restfb.DefaultFacebookClient;
import com.restfb.Facebook;
import com.restfb.FacebookClient;
import com.restfb.Parameter;
import com.restfb.types.FacebookType;
import com.restfb.types.User;

public class AppNotofication
{
	
	public static void main(String[] args) {
		AppNotofication appNotofication = new AppNotofication();
		try {
			appNotofication.testAppRequest();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

    public void testAppRequest() throws Exception
    {
        String appId = "754065517957462";
        String appSecret = "0c85e841cf1d57fbe1939ae52331cdd9";
        String tokenUrl = "https://graph.facebook.com/oauth/access_token?client_id=" + appId + "&client_secret=" + appSecret
                + "&grant_type=client_credentials";
        HttpClient client = new HttpClient();
        HttpMethod method = new GetMethod(tokenUrl);

        client.executeMethod(method);
        String rawAccessToken = new String(method.getResponseBody());

        String accessToken = rawAccessToken.split("=")[1];
        
        String orgUserId = "716882961707040";
        
        List<String> friends = findFacebookFriendsUsingRest(orgUserId,accessToken);
        
        for(String friend: friends) {
        	postAppRequest(accessToken,friend,orgUserId);
        }
        
        //FacebookClient facebookClient = new DefaultFacebookClient(accessToken);

//        String apprequestCall = "888459007847623/apprequests";

//        AppRequestResponse apprequest = facebookClient.publish(apprequestCall,
//                                                               AppRequestResponse.class,
//                                                               Parameter.with("message", "BANANAMSG"),
//                                                               Parameter.with("data", "BANANADATA"));
//        
//        System.out.println(apprequest.request);
//        System.out.println(apprequest.to);

    }
    
    public List<String> findFacebookFriendsUsingRest(String userId, String facebookAccessToken){
    	  List<String> myFacebookFriendList= new ArrayList<String>();
    	  final FacebookClient facebookClient;
    	  facebookClient = new DefaultFacebookClient(facebookAccessToken);
    	  User user = facebookClient.fetchObject(userId, User.class);
    	  String userName =   user.getFirstName();
    	  com.restfb.Connection<User> myFriends = facebookClient.fetchConnection(userId + "/friends", User.class);
    	  System.out.println("Count of my friends: " + myFriends.getData().size());
    	  for(User friend: myFriends.getData()){
    	  System.out.println("Friends id and name: "+friend.getId()+" , "+friend.getName());   
    	    myFacebookFriendList.add(friend.getId());
    	  }
    	  System.out.println("All Friends : "+myFacebookFriendList); 
    	  return myFacebookFriendList;
    	}
    
    public static void postAppRequest(String accessToken, String userid, String orgUserId) {
    	
    	String url =  "https://graph.facebook.com/" + userid + "/notifications?access_token=" + accessToken + "&href=index.jsp&template=Friends%20Birthday%20Today%20Send%20a%20Gift";
    	//String url =  "https://graph.facebook.com/" + userid + "/notifications?access_token=" + accessToken + "&href=index.jsp&template=@[" + orgUserId + "] Birthday Today, Send a Gift";
    	//String url =  "https://graph.facebook.com/" + userid + "/apprequests?access_token=" + accessToken + "&message=GiftMe";
        HttpClient httpClient = new HttpClient();

        PostMethod postMethod = new PostMethod(url);
//		NameValuePair[] data = new NameValuePair[2];
//		data[0] = new NameValuePair("section", "sports");
//		data[1] = new NameValuePair("page", "euro cup");
//		postMethod.setRequestBody(data);
		try
		{
			httpClient.executeMethod(postMethod);
			System.out.println("responseString:"+postMethod.getResponseBodyAsString());
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		finally 
		{
			postMethod.releaseConnection();
		}
    }

    /**
     * Couldn't find any beans that would acomodate this response on restfb so we create our own here
     * Looks like "to" is an array but this works well enough for the sake of the example 
     */
    public static class AppRequestResponse extends FacebookType
    {
        private static final long serialVersionUID = 1L;

        public AppRequestResponse()
        {
            // Empty
        }

        @Facebook
        public String request;

        @Facebook
        public String to;
    }
}