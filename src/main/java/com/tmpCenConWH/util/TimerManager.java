package com.tmpCenConWH.util;

import java.util.Calendar;
import java.util.Date;
import java.util.Timer;

public class TimerManager {

	//延迟时间(一天)
	private static final int DELAY_DAY =1;
	
	public static void schedule() {
		Calendar calendar=Calendar.getInstance();
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 10);
		calendar.set(Calendar.SECOND, 0);
		
		Date date = calendar.getTime();//第一次执行定时任务的时间
        //在第一次执行定时任务的时间加一天，以便此任务在下个时间点执行。如果不加一周，任务会立即执行。
		date=DateUtil.dayOper(DateUtil.getDate(new Date(), "yyyy-MM-dd"),DELAY_DAY);
		
		Timer timer = new Timer();
		timer.schedule(new ForkTrackTask(), date);
	}
}