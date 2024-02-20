package com.tmpCenConWH.service;

import com.tmpCenConWH.entity.*;

public interface RepSysService {

	int addPrintRec(PrintRec pr);

	PrintRec selectPrintRecByTime(String time);
}
