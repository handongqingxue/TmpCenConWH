package com.tmpCenConWH.service;

import java.util.List;

import com.alibaba.fastjson.*;
import com.tmpCenConWH.entity.*;

public interface ForkliftTrackService {

	int addFromJA(JSONArray ja);

	List<ForkliftTrack> getYestList();

}
