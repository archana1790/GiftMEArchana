package com.giftme.properties;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.applet.Applet;

/**
 * Servlet implementation class WrapperServlet
 */
public class WrapperApplet extends Applet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public WrapperApplet() {
        // TODO Auto-generated constructor stub
    }
    
    public static String check(String prof){
    	return EbayFBSync.checkifexists(prof);
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
}
