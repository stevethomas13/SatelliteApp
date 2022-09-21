// harry proudce a array with only the data in the range 
class DateCut
{
  DateSorting Date;
  DateCut(DateSorting myDate)
  {
    Date=myDate;
  }
  
  String [] setUp(String [] data, int minYear, int maxYear)
  {
    ArrayList <Integer> yearsI= Date.getYearsI();
    ArrayList <String> dateInRange= new ArrayList<String>();
    for (int i =0; i<yearsI.size(); i++)
    {
      int year = yearsI.get(i);
      if (year>=minYear && year<=maxYear)
      {
        String item = data[i];
        dateInRange.add(item);
      }
    }
    String[] array = dateInRange.toArray(new String[0]);
    return array;
  }
  
  Integer [] setUpI(Integer[] data, int minYear, int maxYear)
  {
    ArrayList <Integer> yearsI= Date.getYearsI();
    ArrayList <Integer> dateInRange= new ArrayList<Integer>();
    for (int i =0; i<yearsI.size(); i++)
    {
      int year = yearsI.get(i);
      if (year>=minYear && year<=maxYear)
      {
        int item = data[i];
        dateInRange.add(item);
      }
    }
    Integer[] array = dateInRange.toArray(new Integer[0]);
    return array;
  }
  
   Float [] setUpF(Float[] data, int minYear, int maxYear)
  {
    ArrayList <Integer> yearsI= Date.getYearsI();
    ArrayList <Float> dateInRange= new ArrayList<Float>();
    for (int i =0; i<yearsI.size(); i++)
    {
      int year = yearsI.get(i);
      if (year>=minYear && year<=maxYear)
      {
        Float item = data[i];
        dateInRange.add(item);
      }
    }
    Float[] array = dateInRange.toArray(new Float[0]);
    return array;
  }
}
