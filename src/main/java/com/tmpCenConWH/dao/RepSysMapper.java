package com.tmpCenConWH.dao;

import org.apache.ibatis.annotations.Param;

import com.tmpCenConWH.entity.*;

public interface RepSysMapper {

	int addPrintRec(PrintRec pr);

	PrintRec selectPrintRecByTime(@Param("time") String time);
}
