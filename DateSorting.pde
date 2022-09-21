// harry this does a lot it sorts date,month and year it will also get the day of the week :) ("zellers rule" for days of the week)
// steve helped will handling edge cases and error handling
class DateSorting
{
  ArrayList <String> dates = new ArrayList<String>();
  ArrayList <Integer> months = new ArrayList<Integer>();
  ArrayList <String> years = new ArrayList<String>();
  ArrayList <Integer> yearsI = new ArrayList<Integer>();
  ArrayList <String> days = new ArrayList<String>();
  ArrayList <String> monthSt = new ArrayList<String>();
  //set up the data and sorts the date, months and years
  public void setUp (String [] data) {

    String [] monthsForThing = {"Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec", "Jan", "Feb"};
    for (int i = 0; data.length>i; i++)
    {
      String launchDate=data[i];
      String [] LData = launchDate.split("\\s+");
      String date;
      String month;
      if ( LData.length == 1 ) {
        date = "0";
        month = "0";
      } else {
        date = LData[2];
        month = LData[1];
      }
      int number =0;
      for (int j=0; monthsForThing.length>j; j++)
      {
        String test = monthsForThing[j];
        boolean isTrue = month.equals(test);
        if (isTrue)
        {
          number = j +1;
        }
      }
      String year = LData[0];
      int yearI;
      try {
        yearI =Integer.parseInt(LData[0]);
      }
      catch( Exception e ) {
        yearI = 1960;
      }
      yearsI.add(yearI);
      dates.add(date);
      months.add(number);
      monthSt.add(month);
      years.add(year);
    }
  }
  // gets passed a date and than transfroms into a day of the week (using zellers rule)
  public void makeDays ()
  {
    for (int i =0; i<dates.size(); i++)
    {
      //int k = Integer.parseInt(dates.get(i));
      int k;
      try{
        k = Integer.parseInt( dates.get( i ) );
      }
      catch( Exception error ){
        ////println( error );
        k = 0;
      }
      int  m = months.get(i);
      int year;
      try {
        year = Integer.parseInt(years.get(i));
      }
      catch( Exception error ) {
        ////println( error );
        year = 1960;
      }
      if (m>=11)
      {
        year=year-1;
      }
      int d = year%100;
      int c= year/100;

      int number=k+(((13*m)-1)/5)+d+(d/4)+(c/4)-(2*c);

      if (number>=0) number=number%7;
      else
      {
        boolean loop =false;
        int orginalNumber = number;
        while (!loop)
        {
          if (number%7==0)
          {
            loop=true;
            number = number*-1;
            number = number + orginalNumber;
          } else {
            number--;
          }
        }
      }
      switch (number)
      {
      case 0:
        days.add("Sunday");
        break;
      case 1:
        days.add("Monday");
        break;
      case 2:
        days.add("Tuesday");
        break;
      case 3:
        days.add("Wednesday");
        break;
      case 4:
        days.add("Thursday");
        break;
      case 5:
        days.add("Friday");
        break;
      case 6:
        days.add("Saturday");
        break;
      }
    }
  }
  // all methods to return arrayList
  public ArrayList <String> getDays()
  {
    return days;
  }

  public ArrayList <Integer> getMonths()
  {
    return months;
  }

  public ArrayList <String> getYears()
  {
    return years;
  }
  public ArrayList <String> getMonthSt()
  {
    return monthSt;
  }
  public ArrayList <Integer> getYearsI()
  {
    return yearsI;
  }
}
