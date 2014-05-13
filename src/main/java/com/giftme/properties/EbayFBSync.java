package com.giftme.properties;
 
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;
 
public class EbayFBSync {
  public static void add(String profID, String ebayID) {
 
	Properties prop = new Properties();
	OutputStream output = null;
	 
	try {
 
		output = new FileOutputStream("profileIDEbayID.properties");
 
		// set the properties value
		if(checkifexists(profID).equalsIgnoreCase("N")){
		prop.setProperty(profID, ebayID);
		
		// save properties to project root folder
		prop.store(output, null);
		}
		
 
	} catch (IOException io) {
		io.printStackTrace();
	} finally {
		if (output != null) {
			try {
				output.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
 
	}
  }

  public static void addDOB(String profID, String dob) {
	  
		Properties prop = new Properties();
		OutputStream output = null;
		 
		try {
	 
			output = new FileOutputStream("profileIDDOB.properties");
	 
			// set the properties value
			if(checkifDOBexists(profID).equalsIgnoreCase("N")){
			prop.setProperty(profID, dob);
			
			// save properties to project root folder
			prop.store(output, null);
			}
			
	 
		} catch (IOException io) {
			io.printStackTrace();
		} finally {
			if (output != null) {
				try {
					output.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
	 
		}
	  }

  
  public static String checkifexists(String propval){
	  InputStream input = null;
	  Properties prop = new Properties();
	  OutputStream output = null;
		try {
	 
			input = new FileInputStream("profileIDEbayID.properties");
	 
			// load a properties file
			prop.load(input);
	        if(!(prop.getProperty(propval)==null ||prop.getProperty(propval).isEmpty()) ){
			// get the property value and print it out
			return prop.getProperty(propval);
	        }
	        else return "N";
		} catch (IOException io) {
			io.printStackTrace();
		} finally {
 			if (output != null) {
				try {
					output.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		 return "N";

  }
  
  public static String checkifDOBexists(String propval){
	  InputStream input = null;
	  Properties prop = new Properties();
	  OutputStream output = null;
		try {
	 
			input = new FileInputStream("profileIDDOB.properties");
	 
			// load a properties file
			prop.load(input);
	        if(!(prop.getProperty(propval)==null ||prop.getProperty(propval).isEmpty()) ){
			// get the property value and print it out
			return prop.getProperty(propval);
	        }
	        else return "N";
		} catch (IOException io) {
			io.printStackTrace();
		} finally {
 			if (output != null) {
				try {
					output.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		 return "N";

  }
}