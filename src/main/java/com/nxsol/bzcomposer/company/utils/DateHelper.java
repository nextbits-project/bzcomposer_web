package com.nxsol.bzcomposer.company.utils;

import java.time.Instant;
import java.time.OffsetDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import lombok.NoArgsConstructor;

@NoArgsConstructor
public class DateHelper {

	public static  OffsetDateTime convertDateToOffsetDateTime(Date utilDate) {
		Instant instant = utilDate.toInstant();
		return instant.atOffset(ZoneOffset.UTC);
		// You can replace ZoneOffset.UTC with the desired time zone offset
	}

	public static OffsetDateTime StringToOffsetDateTime(String date) {
		// Define the date format that matches your input string
		DateTimeFormatter formatter = DateTimeFormatter.ISO_OFFSET_DATE_TIME;

		// Parse the string into an OffsetDateTime object
		OffsetDateTime offsetDateTime = OffsetDateTime.parse(date, formatter);

		// If you want to convert it to a specific time zone, you can use
		// withOffsetSameInstant method
		OffsetDateTime convertedDateTime = offsetDateTime.withOffsetSameInstant(ZoneOffset.UTC);
		return convertedDateTime;
	}
	
	
	public static String dateFormatter(OffsetDateTime dateAdded) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd-yyyy");
		return dateAdded.format(formatter);
	}
}
