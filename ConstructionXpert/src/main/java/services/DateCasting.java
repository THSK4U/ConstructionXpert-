package services;

import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Date;

public  class DateCasting {


        public static java.sql.Date ToSqlDate(Date javaDate) {
            long milliseconds = javaDate.getTime(); // Get the milliseconds since January 1, 1970, 00:00:00 GMT
            return new java.sql.Date(milliseconds);
        }


    public static Date TojavaData(java.sql.Date sqlDate) {
        long milliseconds = sqlDate.getTime(); // Get the milliseconds since January 1, 1970, 00:00:00 GMT
        return new Date(milliseconds);
    }


    public static Date convertStringToDate(String dateString, String pattern ) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);
        try {
            LocalDate localDate = LocalDate.parse(dateString, formatter);
            return Date.from(localDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
        } catch (DateTimeParseException e) {
            e.printStackTrace();
            return null;
        }
    }





}