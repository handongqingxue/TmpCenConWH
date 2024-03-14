package com.tmpCenConWH.util;

import java.io.*;
import java.util.Date;

import org.apache.commons.lang.StringUtils;

public class LogUtil {

	public static String getHisTra() {
		String preSBStr = null;
		try {
			FileInputStream fis = null;
			File eventFile=new File("D:/resource/TmpCenConWH/aaa.txt");
			StringBuffer preSB=new StringBuffer();
				fis = new FileInputStream(eventFile);
	        int data;
	        while ((data = fis.read()) != -1) {
	        	preSB.append((char)data);
	        }
	        
	        // 关闭输入流
	        fis.close();
	        
	        preSBStr = preSB.toString();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			return preSBStr;
		}
	}
	
	public static void createHisTra(String fileName, String msg) {
		FileOutputStream fos=null;
		try {
			//File eventFile=new File("D:/resource/TmpCenConWH/aaa.txt");
			File eventFile=new File(fileName);
			if(!eventFile.exists())
				eventFile.createNewFile();
			
			byte bytes[]=new byte[512];
			bytes=msg.getBytes();
			int b=bytes.length; //是字节的长度，不是字符串的长度
			fos=new FileOutputStream(eventFile);
			fos.write(bytes,0,b);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				fos.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public static void addHisTra(String msg) {
		FileInputStream fis = null;
		FileOutputStream fos=null;
		try {
			File eventFile=new File("D:/resource/TmpCenConWH/aaa.txt");
			if(!eventFile.exists())
				eventFile.createNewFile();
			
			StringBuffer preSB=new StringBuffer();
			fis = new FileInputStream(eventFile);
            int data;
            while ((data = fis.read()) != -1) {
            	preSB.append((char)data);
            }
            
            // 关闭输入流
            fis.close();
            
            String preSBStr = preSB.toString();
            
            StringBuffer currMsgSB=new StringBuffer();
            if(StringUtils.isEmpty(preSBStr)) {
                currMsgSB.append("[");
            }
            else {
                System.out.println("+++"+preSBStr.substring(0, preSBStr.lastIndexOf("}]")+1));
                currMsgSB.append(preSBStr.substring(0, preSBStr.lastIndexOf("}]")+1));
                currMsgSB.append(",");
            }
            currMsgSB.append(msg);
            currMsgSB.append("]");
            
            String currMsg = currMsgSB.toString();
			
			byte bytes[]=new byte[512];
			bytes=currMsg.getBytes();
			int b=bytes.length; //是字节的长度，不是字符串的长度
			fos=new FileOutputStream(eventFile);
			fos.write(bytes,0,b);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				fos.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
