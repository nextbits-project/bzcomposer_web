package com.nxsol.bzcomposer.company.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.OffsetDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import com.avibha.common.log.Loger;

import lombok.NoArgsConstructor;

@NoArgsConstructor
public class DateHelper {

	public static OffsetDateTime convertDateToOffsetDateTime(Date utilDate) {
		if (utilDate == null) {
			return null; // or handle it based on your requirement
		}

		// Convert Date to Calendar, then to Instant, and finally to OffsetDateTime
		Calendar calendar = GregorianCalendar.getInstance();
		calendar.setTime(utilDate);
		return calendar.toInstant().atOffset(ZoneOffset.UTC);
	}
//	public static  OffsetDateTime convertDateToOffsetDateTime(Date utilDate) {
//		Instant instant = utilDate.toInstant();
//		return instant.atOffset(ZoneOffset.UTC);
//		// You can replace ZoneOffset.UTC with the desired time zone offset
//	}

	public static OffsetDateTime StringToOffsetDateTime(String date) {
		String pattern="yyyy-MM-dd HH:mm:ss";
		// Define the date format that matches your input string
//		DateTimeFormatter formatter = DateTimeFormatter.ISO_OFFSET_DATE_TIME;
//
//		// Parse the string into an OffsetDateTime object
//		OffsetDateTime offsetDateTime = OffsetDateTime.parse(date, formatter);
//
//		// If you want to convert it to a specific time zone, you can use
//		// withOffsetSameInstant method
//		OffsetDateTime convertedDateTime = offsetDateTime.withOffsetSameInstant(ZoneOffset.UTC);
//		return convertedDateTime;
		 DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);
	        return OffsetDateTime.parse(date, formatter);
	}
	
	public static OffsetDateTime string2OffsetDateTime(String d) {
	    SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy HH:mm:ss");
	    Date date = null;
	    try {
	        // Assuming the time is 00:00:00 if not provided
	        date = sdf.parse(d + " 00:00:00");
	    } catch (ParseException e) {
	        Loger.log(2, "ParseException" + e.getMessage());
	    }

	    if (date != null) {
	        Instant instant = date.toInstant();
	        ZoneId zoneId = ZoneId.systemDefault();
	        return OffsetDateTime.ofInstant(instant, zoneId);
	    } else {
	        // Handle the case when parsing fails
	        return OffsetDateTime.now(); // or throw an exception, or return a default value
	    }
	}

	

	
	public static String dateFormatter(OffsetDateTime dateAdded) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd-yyyy");
		return dateAdded.format(formatter);
	}
}
