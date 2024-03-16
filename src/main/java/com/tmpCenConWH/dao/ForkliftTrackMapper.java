package com.tmpCenConWH.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tmpCenConWH.entity.*;

public interface ForkliftTrackMapper {

	int addFromList(@Param("ftList") List<ForkliftTrack> ftList);

	int deleteYestList();

	List<ForkliftTrack> getYestList();
}
