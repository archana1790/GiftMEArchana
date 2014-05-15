package com.ebay.giftme;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

public class CSVDBUtil {

	public static boolean isUpcomingBirthday(String birthdayStr) {
		
		Date date = new Date();
		GregorianCalendar currDate = new GregorianCalendar();
		currDate.setTime(date);
		GregorianCalendar nextMonthDate = new GregorianCalendar();
		nextMonthDate.setTime(date);
		nextMonthDate.add(GregorianCalendar.MONTH, 1);
		
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy"); 
		Date birthday;
		try {
			birthday = (Date)formatter.parseObject(birthdayStr);
		} catch (ParseException e) {
			return false;
		}
		GregorianCalendar bothdayCalendar = new GregorianCalendar();
		bothdayCalendar.setTime(birthday);
		if (bothdayCalendar.get(GregorianCalendar.MONTH) < currDate
				.get(GregorianCalendar.MONTH)
				|| bothdayCalendar.get(GregorianCalendar.MONTH) > nextMonthDate
						.get(GregorianCalendar.MONTH)) {
			return false;
		}
		return true;

	}

	/*public static void main(String[] args) {
		// TODO Auto-generated method stub

		try {
			//writeFile();
			String getrow = getrow("100008349545093");
			System.out.println("GetRow:" + getrow);
			List<String> l = getList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}*/

	public static void writeFile() throws Exception {
		File file = new File("fb_ebay.csv");
		if (!file.exists()) {
			file.createNewFile();
		}
		FileWriter fw = new FileWriter(file, true);
		BufferedWriter bw = new BufferedWriter(fw);
		PrintWriter pw = new PrintWriter(bw);

		
		pw.println("1393455164275112, janetleo14, 16-05-1990");
		pw.println("888459007847623, archana1790, 26-01-1989");
		pw.println("716882961707040, sumit.eb , 26-01-1989");
		pw.println("1395212624098701, summim, 15-09-1992");
//		pw.println("100008349545093, wishllym, 16-12-2000");
//		pw.println("100008311606591, shesellm, 26-01-1989");
//		pw.println("100008332869903, pennylay2014, 15-05-1985");
		
		pw.close();
	}
	
	
    public static void appendItem(String line) throws Exception{
        
        try{
         
        System.out.println(line);
        URL resourceUrl = CSVDBUtil.class.getResource("/fb_ebay123.csv");
        File file = new File(resourceUrl.toURI());

        //if file doesnt exists, then create it
        if(!file.exists()){
        	System.out.println("FILE PATH:"+file.getAbsolutePath());
        	
               file.createNewFile();
        }

        
        if(!getrow(line)){
        	System.out.println("FILE PATH:"+file.getAbsolutePath());
               //true = append file
               FileWriter fileWritter = new FileWriter(file,true);
                BufferedWriter bufferWritter = new BufferedWriter(fileWritter);
                bufferWritter.write("\n");
                bufferWritter.write(line);
                bufferWritter.close();
               
        }


}catch(IOException e){
        e.printStackTrace();
}
}

	
	

	@SuppressWarnings("resource")
	public static boolean getrow(String fbid) throws Exception {

		InputStream fstream = CSVDBUtil.class.getResourceAsStream("/fb_ebay123.csv");
        
		DataInputStream in = new DataInputStream(fstream);
		BufferedReader br = new BufferedReader(new InputStreamReader(in));
		String strLine;

		while ((strLine = br.readLine()) != null) {
			if (strLine.contains(fbid)) {
				System.out.println(strLine);
				in.close();
				return true;
			}
		}

		in.close();
		return false;

	}

	public static List<String> getList() throws Exception {

		InputStream fstream = CSVDBUtil.class.getResourceAsStream("/fb_ebay123.csv");

		DataInputStream in = new DataInputStream(fstream);
		BufferedReader br = new BufferedReader(new InputStreamReader(in));
		List<String> strLines = new ArrayList<String>();
		String line;

		while ((line = br.readLine()) != null) {
			strLines.add(line);
		}

		in.close();
		return strLines;

	}

}
