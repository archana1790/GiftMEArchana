package com.ebay.giftme;

import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;



public class Scheduler implements ServletContextListener {

	private Timer metricsTimer;

	//public final static long METRICS_SCHEDULE = 1000 * 60 * 60 * 24;
	
	public final static long METRICS_SCHEDULE = 1000 * 60 * 4;

	//public final static long test_schedule = 1000 * 60 * 4;

	public void contextDestroyed(ServletContextEvent arg0) {
		if (metricsTimer != null) {
			metricsTimer.cancel();
		}
	}

	public void contextInitialized(ServletContextEvent arg0) {
	//	System.out.println("Context Initialized");
		scheduleFirst();
	}

	private void scheduleFirst() {
		metricsTimer = new Timer("Metrics Cache updater");
		// Schedule repeated job starting from tomorrow
		Date nextDate = getFutureDate(1);
	//	System.out.println(slf.getCache().getMetricSize() + " Date is "
		//		+ nextDate);

		metricsTimer.scheduleAtFixedRate(new MetricsTimerTask(), 10000,
				METRICS_SCHEDULE);
		System.out.println("Init processing done");
		//metricsTimer.scheduleAtFixedRate(new MetricsTimerTask(), 1000*60*3,
			//	test_schedule);
	}

	private Date getFutureDate(int days) {
		Calendar start = Calendar.getInstance();
		//System.out.println(start.getTime());
		start.set(Calendar.HOUR_OF_DAY, 0);
		start.set(Calendar.MINUTE, 0);
		start.set(Calendar.SECOND, 0);
		start.set(Calendar.MILLISECOND, 0);



		int hourstoadd = days * 24;
		start.set(Calendar.HOUR_OF_DAY, hourstoadd);
		//System.out.println(start.getTime());
		return start.getTime();

	}




	private Date getPastDate(int days) {
		Calendar start = Calendar.getInstance();

		start.set(Calendar.HOUR_OF_DAY, 0);
		start.set(Calendar.MINUTE, 0);
		start.set(Calendar.SECOND, 0);
		start.set(Calendar.MILLISECOND, 0);



		int hourstosub = days * 24;
		start.set(Calendar.HOUR_OF_DAY, -hourstosub);
		//System.out.println(start.getTime());
		return start.getTime();

	}

	private class MetricsTimerTask extends TimerTask {

		public void run() {
			AppNotofication appNotofication = new AppNotofication();
			try {
				appNotofication.testAppRequest();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}