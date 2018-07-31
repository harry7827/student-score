package com.sc.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormatUtils {
	//转换格式yyyy-MM-dd
	public static long parse(String src) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = sdf.parse(src);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date.getTime();
	}
}
