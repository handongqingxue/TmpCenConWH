package com.tmpCenConWH.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tmpCenConWH.entity.*;

public interface ForkliftTrackFileMapper {

	int addFromList(@Param("ftfList") List<ForkliftTrackFile> ftfList);

	List<ForkliftTrackFile> getList(@Param("tagId") String tagId, @Param("day") Integer day);
}
