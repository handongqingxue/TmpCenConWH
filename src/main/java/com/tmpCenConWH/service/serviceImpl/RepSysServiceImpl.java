package com.tmpCenConWH.service.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tmpCenConWH.entity.*;
import com.tmpCenConWH.dao.*;
import com.tmpCenConWH.service.*;

@Service
public class RepSysServiceImpl implements RepSysService {

	@Autowired
	private RepSysMapper repSysDao;

	@Override
	public int addPrintRec(PrintRec pr) {
		// TODO Auto-generated method stub
		return repSysDao.addPrintRec(pr);
	}

	@Override
	public PrintRec selectPrintRecByTime(String time) {
		// TODO Auto-generated method stub
		return repSysDao.selectPrintRecByTime(time);
	}
}
