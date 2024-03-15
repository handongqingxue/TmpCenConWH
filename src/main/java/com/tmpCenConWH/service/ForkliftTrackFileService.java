package com.tmpCenConWH.service;

import java.util.List;

import com.tmpCenConWH.entity.*;

public interface ForkliftTrackFileService {

	int addFromList(List<ForkliftTrackFile> ftfList);

	List<ForkliftTrackFile> getList(String tagId, String startDate, String endDate);
}
