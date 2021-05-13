package com.bkc.utils;

import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;


public class DateUtils {
    public static final String FULL_YEAR ="yyy-MM-dd";

    /**
     * YYYY-MM-dd HH:mm:ss
     * @param dateFormat
     * @return
     */
    public static String getNowTimeToString(String dateFormat) throws Exception {
        return LocalDateTime.now().format(DateTimeFormatter.ofPattern(dateFormat));
    }

    /**
     * YYYY-MM-dd HH:mm:ss
     * @param date
     * @param dateFormat
     * @return
     */
    public static LocalDateTime getStringToDate(String date, String dateFormat) throws Exception  {
        LocalDateTime d = LocalDateTime.parse(date,  DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        return d;
    }

    public static LocalDate getStringToTime(String date, String dateFormat) throws Exception  {
        LocalDate d = LocalDate.parse(date,  DateTimeFormatter.ofPattern(dateFormat));
        return d;
    }

    public static String getBeforeDayFromDate(String date, int dayBefore, String dateFormat) throws Exception  {
        LocalDateTime d = LocalDateTime.parse(date+" 00:00:00",  DateTimeFormatter.ofPattern(dateFormat +" HH:mm:ss"));
        return   d.minusDays(dayBefore).format(DateTimeFormatter.ofPattern(dateFormat));
    }

    public static String  getBeforeDayFromMonth(String date, long monthBefore, String dateFormat) throws Exception  {
        LocalDateTime d = LocalDateTime.parse(date +" 00:00:00", DateTimeFormatter.ofPattern(dateFormat +" HH:mm:ss"));
        return d.minusMonths(monthBefore).format(DateTimeFormatter.ofPattern(dateFormat));
    }

    public static String  getBeforeDayFromYears(String date, long monthBefore, String dateFormat) throws Exception  {
        LocalDate d = LocalDate.parse(date , DateTimeFormatter.ofPattern(dateFormat));
        return d.minusYears(monthBefore).format(DateTimeFormatter.ofPattern(dateFormat));
    }

    public static String changeDateFormat(String date, String nowFormat, String nextFormat) throws Exception {
        LocalDate d = LocalDate.parse(date,  DateTimeFormatter.ofPattern(nowFormat));
        return d.format(DateTimeFormatter.ofPattern(nextFormat));
    }


    public static String getDayBeforMonth(long dayBefore, String dateFormat) throws Exception  {
        return LocalDateTime.now().minusMonths(dayBefore).format(DateTimeFormatter.ofPattern(dateFormat));
    }

    public static String getDayBeforeDate(long dayBefore, String dateFormat) throws Exception  {
        return LocalDateTime.now().minusDays(dayBefore).format(DateTimeFormatter.ofPattern(dateFormat));
    }

    public static String getaddSecondDate(long second, String dateFormat)  throws Exception  {
        return LocalDateTime.now().plusSeconds(second).format(DateTimeFormatter.ofPattern(dateFormat));
    }


    //시간차이 구하기
    public static long getDefferentTime(String validTime)  throws Exception  {

        LocalDateTime targetTime = LocalDateTime.parse(validTime, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        LocalDateTime endTime = LocalDateTime.parse( LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")),
                                                     DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

        long remindSec = Duration.between(endTime, targetTime).getSeconds();
        return remindSec;

    }


    // 두날짜사이의 날짜를 구하기
    public static  List<String> getBetweenDays(String start, String end, String dateFormatter) throws Exception   {

        LocalDate startDate = LocalDate.parse(start, DateTimeFormatter.ofPattern(dateFormatter));
        LocalDate endDate = LocalDate.parse(end, DateTimeFormatter.ofPattern(dateFormatter));

        List<String> dateList = new ArrayList<>();


        while (!startDate.isAfter(endDate)) {
            dateList.add(startDate.format(DateTimeFormatter.ofPattern(dateFormatter)));
            startDate  = startDate.plusDays(1);
        }
        return dateList;
    }

    public static List<String> getTotalMonth(String month)throws Exception {
        YearMonth  yearMonth = YearMonth.parse(month, DateTimeFormatter.ofPattern("yyyy-MM"));

        LocalDate startDate = LocalDate.parse(yearMonth.atDay(1).toString(), DateTimeFormatter.ofPattern(FULL_YEAR));
        LocalDate endDate = LocalDate.parse(yearMonth.atEndOfMonth().toString(), DateTimeFormatter.ofPattern(FULL_YEAR));

        List<String> dateList = new ArrayList<>();

        while (!startDate.isAfter(endDate)) {
            dateList.add(startDate.format(DateTimeFormatter.ofPattern(FULL_YEAR)));
            startDate  = startDate.plusDays(1);
        }
        return dateList;

    }


    public static String firstDayOfMonth(String days, String dateFormatter)  throws Exception {
        YearMonth yearMonth = YearMonth.from(LocalDate.parse(days, DateTimeFormatter.ofPattern(dateFormatter)));
        return yearMonth.atDay(1).format(DateTimeFormatter.ofPattern(dateFormatter));
    }

    public static String lastDayOfMonth(String days, String dateFormatter)  throws Exception {
        YearMonth yearMonth = YearMonth.from(LocalDate.parse(days, DateTimeFormatter.ofPattern(dateFormatter)));
        return yearMonth.atEndOfMonth().format(DateTimeFormatter.ofPattern(dateFormatter));
    }

    public static int dayofWeek(String days, String dateFormatter) throws  Exception{
        LocalDate d = LocalDate.parse(days,  DateTimeFormatter.ofPattern(dateFormatter));
        return d.getDayOfWeek().getValue();
    }


    public static List<String> makeTime()  throws Exception{
        List<String> dateList = new ArrayList<>();
        String time = null;

        for(int i= 0 ;i < 24 ; i++ ) {

            if(i < 10) {
                time = "0" + i;
            }else  {
                time = String.valueOf(i);
            }
            dateList.add(time);
        }

        return dateList;
    }
}
