package com.cuit.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	/**
     * 获取当前时间
     * @return
     */
    public static String getNowTime(){
    	//获取当前日期
		Date currentTime = new Date();
		//将日期转化为指定格式
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String getNowTimeString = formatter.format(currentTime);
    	return getNowTimeString;
    }
}
