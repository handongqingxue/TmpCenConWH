package com.tmpCenConWH.util;

import java.util.TimerTask;

import org.json.JSONException;
import org.json.JSONObject;

public class ForkTrackTask extends TimerTask {

	@Override
	public void run() {
		// TODO Auto-generated method stub
		try {
			JSONObject cfhtfJO = APIUtil.doHttp("createForkHisTraFile",null);
			String status = cfhtfJO.getString("status");
			if(APIUtil.OK.equals(status)) {
				System.out.println("qqqqqqqqqqqqqqqq");
			}
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
