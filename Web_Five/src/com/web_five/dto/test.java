package com.web_five.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;

import com.sun.java.swing.plaf.motif.resources.motif;

public class test {
	public static void main(String[] args) {
	
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

        Calendar c1 = Calendar.getInstance();

        String strToday = sdf.format(c1.getTime());



        System.out.println("Today=" + strToday);





	}
}
