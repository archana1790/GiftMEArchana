package com.giftme.properties;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;

public class WishlistGen {

	
	public static String[] getWishList(String ebayId) throws IOException{
		Client client = Client.create();
		 
		WebResource webResource = client
		   .resource("http://my.ebay.com/wishlist/?userid="+ebayId);
 
		ClientResponse response = webResource.accept("application/json")
                   .get(ClientResponse.class);
		InputStream is = response.getEntityInputStream();
		String result = getStringFromInputStream(is);
		is.close();
		//List<Map<String, String>> witems = getImages(result);
		String[] out = getImages(result);
	    System.out.print(out.length);
	    System.out.print(out[0]);
		return out;
	}
	
	
	private static String[] getImages(String res){
	       
	       String[] items = new String[3];
	       StringBuilder b = new StringBuilder();
	       int i = 0;
	              String price = "";
	              
	       Document doc = Jsoup.parse(res);
	       
	       Elements eles = doc.select("span.nbid-itm");
	                           
	              Elements images = doc.select("img[src~=(?i)\\.(png|jpe?g|gif)]");
	              for (Element image : images) {

	                     if(i>2){
	                           break;
	                           }      
	                     
	                     
	                     if(!image.attr("alt").isEmpty()){
	                           
	                           Elements links = doc.select("a[href]");
	                           for (Element link : links) {
	                          if(image.attr("alt").equalsIgnoreCase(link.text())){
	                            // get the value from href attribute
	                                  /* System.out.println("\nlink : " + link.attr("href"));
	                                   System.out.println("\ntext : " + link.text());
	                                   System.out.println("\nsrc : " + image.attr("src"));
	                                   System.out.println("\nprice : " + eles.get(i).text());*/
	          items[i] = b.append(link.attr("href")).append("|").append(link.text()).append("|").append(image.attr("src")).append("|").append(eles.get(i).text()).toString();
	          System.out.println("ITEM:"+items[i]);
                    i++;
	                          }
	                                  
	              
	                           }
	                           
	                           
	                     }
	                     
	              }
	              
	              return items;
	              }













    private static String getStringFromInputStream(InputStream is) {

		BufferedReader br = null;
		StringBuilder sb = new StringBuilder();

		String line;
		try {

			br = new BufferedReader(new InputStreamReader(is));
			while ((line = br.readLine()) != null) {
				sb.append(line);
			}

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		return sb.toString();

	}

}
