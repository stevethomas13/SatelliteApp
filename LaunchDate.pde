// rob created class and navigation
// harry added all dates and system for queries :)
// query algorithm developed by Steve
// mariam textwidgets 
class LaunchDate
{
  ArrayList widgetSearch;
  ArrayList myWidgets;
  TextWidget text1;
  TextWidget text2;
  int BarChartNumber=3;
  PFont myFontForBarChart;
  Text theText;
  ArrayList<String> queriesD;
  ArrayList<Integer> countQueriesD;
  ArrayList<String> queriesM;
  ArrayList<Integer> countQueriesM;
  ArrayList<Integer> queriesY;
  ArrayList<Integer> countQueriesY;
  Button theButton;
  String[] daysA;
  String[] monthsA;
  Integer [] yearsIA; 
  ArrayList widgetList;
  DateSorting myDate = new DateSorting();
  DateCut cuttingDate = new DateCut(myDate);
  BarChartForDate myBarD = new BarChartForDate();
  BarChartForDate myBarM = new BarChartForDate();
  BarChartForDate myBarY = new BarChartForDate();
  //harry sorts the months, days,years for the barchart
  
  
  LaunchDate(Controller myController){  
    myController.createData();
    String [] date =myController.getDates(null);
    myDate.setUp(date);
    myDate.makeDays();
    myFontForBarChart=loadFont("Arial-Black-12.vlw");
    ArrayList <String>days=myDate.getDays();
    ArrayList <String>monthSt=myDate.getMonthSt();
    ArrayList <String> years= myDate.getYears();
    ArrayList <Integer> yearsI= myDate.getYearsI();
    daysA = days.toArray(new String[0]);
    monthsA = monthSt.toArray(new String[0]);
    yearsIA = yearsI.toArray(new Integer[0]);
    queryD(daysA);
    queryM(monthsA);
    queryY(yearsIA);
    int size = queriesY.size();
    quickSort(queriesY,countQueriesY,0,size-1);
    daysSort();
    sortMonths();
    ArrayList<String> queriesSY=intToString(queriesY);
    myBarD.setup(queriesD,countQueriesD,myFontForBarChart,"Day");
    myBarM.setup(queriesM,countQueriesM,myFontForBarChart,"Month");
    myBarY.setup(queriesSY,countQueriesY,myFontForBarChart,"Year");
    theText = new Text();
    theButton = new Button();
    widgetList = new ArrayList();
    Widget widget1 = new Widget(100, 100, 90, 40,"Name", color(100), myFont, HOME);
    Widget widget2 = new Widget(40,"Days", myFont, 1);
    Widget widget3 = new Widget(60,"Months",myFont, 2);
    Widget widget4 = new Widget(50,"Years", myFont, 3);
    //Widget widget5 = new Widget(80,"change", myFont, 4);
    text1=new TextWidget(150, "", myFont, EVENT_TEXT5, 4, "From date:"); 
    text2=new TextWidget(150, "", myFont, EVENT_TEXT6, 4, "To date:"); 
    Widget widget6 = new Widget(90,"Search", myFont, SEARCH);
    myWidgets = new ArrayList();
    myWidgets.add(text1); myWidgets.add(text2);
    widgetSearch = new ArrayList();
    widgetSearch.add(widget6);
    //widgetList.add(widget1);
    widgetList.add(widget1);
    widgetList.add(widget2);
    widgetList.add(widget3);
    widgetList.add(widget4);
    //widgetList.add(widget5);
  }
 //harry draws the barchart on the lanchScreen
 // rob displays buttons
  void show(){
    theText.title("Launch Date");
    theButton.title();
    int w = padding;
    int height = 140;

    if (BarChartNumber==1)
    {
      ((Widget)widgetList.get(1)).btnUnderlineActive(w, height);
      w = w + ((Widget)widgetList.get(1)).width() + 20;
      myBarD.drawBar();
    }
    if (BarChartNumber==2)
    {
      w = w + 40 + 20;
      ((Widget)widgetList.get(2)).btnUnderlineActive(w, height);
      myBarM.drawBar();
    }
    if (BarChartNumber==3)
    {
      w = w + 40+ 20 + 20 + 60;
      ((Widget)widgetList.get(3)).btnUnderlineActive(w, height);
      myBarY.drawBar();
    }
    
    w = padding;
    for(int i = 1; i < widgetList.size(); i++){ 
      ((Widget)widgetList.get(i)).btnUnderline(w, height);
      w = w + ((Widget)widgetList.get(i)).width() + 20;
    }
    
    // rob
   w = padding + 620;
   for(int i = 0; i < myWidgets.size(); i++){
     String title = ((Widget)myWidgets.get(i)).getTitle();
     ((Widget)myWidgets.get(i)).inputBox(w, height + 10, title);
     w = w + ((Widget)myWidgets.get(i)).width() + 30;
   }
   for(int i = 0; i<widgetSearch.size(); i++){ 
     Widget aWidget = (Widget) widgetSearch.get(i); 
     aWidget.btnPrimary(w, height + 10);
   }


  }
  //harry the widgets for changing the barChart
  void click(){
    int event = 0;
    for(int i = 0; i < widgetList.size(); i++){ 
      Widget aWidget = (Widget) widgetList.get(i);
      event = aWidget.getEvent(); 
      switch(event) {
        case HOME:
          ////println("forward"); 
          currentPage = 0;
          break;
        case 1:
          ////println("day");
          BarChartNumber=1;
          break;
        case 2:
          ////println("month");
          BarChartNumber=2;
          break;
        case 3:
          ////println("year");
          BarChartNumber=3;
          break;
        case 4:
          ////println("cut");
          cutDate(1960,1965);
          break;
    //    case SEARCH3:
    //      searchButton3 = true;
    //  //  changeBarChart();
    //      break;
      }
      } 
      
       int eventWidget = 0;
    for(int b = 0; b < myWidgets.size(); b++){ 
      Widget aWidget2 = (Widget) myWidgets.get(b);
      eventWidget = aWidget2.getEvent(); 
      switch(eventWidget) {
         case EVENT_TEXT5:
          ////println("clicked on a text widget!"); 
         focus= (TextWidget)aWidget2;
         generalCount = 1;
         return; 
        case EVENT_TEXT6:
          ////println("clicked on text widget2");
          focus = (TextWidget)aWidget2;
          generalCount = 2;
          return;
        default:
        focus = null;
      } 
    }
    int event2 = 0;
    for(int i = 0; i < widgetSearch.size(); i++){ 
      Widget aWidget = (Widget) widgetSearch.get(i);
      event2 = aWidget.getEvent(); 
      switch(event2) {
        case SEARCH: //<>// //<>//
          searchButton = true;
          int pass1 = Integer.parseInt(name1GeneralQuery);
          int pass2 = Integer.parseInt(name2GeneralQuery);
          cutDate(pass1,pass2);
          break;
      }
    }
    }


  
  //harry allows for the date to be cut down to a range 
  void cutDate(int minYear, int maxYear)
  {
    String [] daysS=cuttingDate.setUp(daysA,minYear,maxYear);
    queryD(daysS);
    daysSort();
    String [] monthsS=cuttingDate.setUp(monthsA,minYear,maxYear);
    queryM(monthsS);
    sortMonths();
    Integer [] yearsS=cuttingDate.setUpI(yearsIA,minYear,maxYear);
    queryY(yearsS);
    int size = queriesY.size();
    quickSort(queriesY,countQueriesY,0,size-1);
    ArrayList<String> queriesSY=intToString(queriesY);
    myBarD.setup(queriesD,countQueriesD,myFontForBarChart,"Day");
    myBarM.setup(queriesM,countQueriesM,myFontForBarChart,"Months");
    myBarY.setup(queriesSY,countQueriesY,myFontForBarChart,"Years");
  }
  //harry changed the query a bit so that the only things can be included are days of the week 
 void queryD( String[] queryData ){
    queriesD = new ArrayList<String>();
    countQueriesD = new ArrayList<Integer>();
    queriesD.addAll(Arrays.asList("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"));
    countQueriesD.addAll(Arrays.asList(0,0,0,0,0,0,0));
    for ( String query: queryData ){
        for ( int i = 0; i < queriesD.size(); i++ ) {
          if ( query.equalsIgnoreCase( queriesD.get( i ) ) ) {
          int count = countQueriesD.get( i );
          count = count + 1;
          countQueriesD.set( i, count );
         }
      }
    }
    int[] array = new int[ countQueriesD.size() ];
    for( int i = 0; i < array.length; i++ ) {
      array[ i ] = countQueriesD.get( i );
    }
  }
  
  void daysSort()
  {
    String [] daysForThing = {"Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"};
    for (int i =0; i<daysForThing.length;i++)
    {
      String day = daysForThing[i];
      for (int j =0; j<queriesD.size();j++)
      {
        String testDay = queriesD.get(j);
        boolean isSame=day.equals(testDay);
        if (isSame)
        {
          String tmp = queriesD.get(i);
          int tmpInt = countQueriesD.get(i);
          int newInt = countQueriesD.get(j);
          queriesD.set(i,day);
          queriesD.set(j,tmp);
          countQueriesD.set(i,newInt);
          countQueriesD.set(j,tmpInt);
        }
      }
    }
  }
  //harry changed the query a bit so that the only things can be included are months of the year
void queryM( String[] queryData ){
    queriesM = new ArrayList<String>();
    countQueriesM = new ArrayList<Integer>();
    queriesM.addAll(Arrays.asList("Jan","Feb","Mar", "Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"));
    countQueriesM.addAll(Arrays.asList(0,0,0,0,0,0,0,0,0,0,0,0));
    for ( String query: queryData ){
        for ( int i = 0; i < queriesM.size(); i++ ) {
          if ( query.equalsIgnoreCase( queriesM.get( i ) ) ) {
          int count = countQueriesM.get( i );
          count = count + 1;
          countQueriesM.set( i, count );
         }
      }
    }
    int[] array = new int[ countQueriesM.size() ];
    for( int i = 0; i < array.length; i++ ) {
      array[ i ] = countQueriesM.get( i );
    }
  }
  void sortMonths()
  {
    String [] monthsForThing = {"Jan","Feb","Mar", "Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};

    for (int i =0; i<monthsForThing.length;i++)
    {
      String month = monthsForThing[i];
      for (int j =0; j<queriesM.size();j++)
      {
        String testMonth = queriesM.get(j);
        boolean isSame=month.equals(testMonth);
        if (isSame)
        {
          String tmp = queriesM.get(i);
          int tmpInt = countQueriesM.get(i);
          int newInt = countQueriesM.get(j);
          queriesM.set(i,month);
          queriesM.set(j,tmp);
          countQueriesM.set(i,newInt);
          countQueriesM.set(j,tmpInt);
        }
      }
    }
  }
  
    void queryY( Integer [] queryData ){
    queriesY = new ArrayList<Integer>();
    countQueriesY = new ArrayList<Integer>();
    for ( int query: queryData ){
        if ( !queriesY.contains( query ) ) {
          queriesY.add( query );
          countQueriesY.add( 0 );
        }
        for ( int i = 0; i < queriesY.size(); i++ ) {
          if ( query ==( queriesY.get( i ) ) ) {
          int count = countQueriesY.get( i );
          count = count + 1;
          countQueriesY.set( i, count );
         }
      }
    }
    int[] array = new int[ countQueriesY.size() ];
    for( int i = 0; i < array.length; i++ ) {
      array[ i ] = countQueriesY.get( i );
    }
  }
  //harry quicksort for years
  public void quickSort(ArrayList<Integer> array,ArrayList<Integer> arrayCount ,int low, int high)
  {
    if (high>low )
    {
      int pi = paration(array,arrayCount,low,high);
      quickSort(array,arrayCount,low,pi-1);
      quickSort(array,arrayCount,pi+1,high);
    }
  }
  
  public int paration(ArrayList<Integer> array, ArrayList<Integer> arrayCount,int low,int high)
  {
    int pivot = array.get(high);
    int i = low;
    for (int j =low; j<=high; j++)
    {
      int valueJ = array.get(j);
      if (valueJ<pivot)
      {
        swap(array,arrayCount ,i,j);
        i++;
      }
    }
    swap(array,arrayCount,i,high); //swap
    return i;
  }
  
  public void swap(ArrayList<Integer> array, ArrayList<Integer> arrayCount, int i, int j)
  {
    int swapI= array.get(i);
    int swapNI = arrayCount.get(i);
    int swapNJ = arrayCount.get(j);
    int swapJ=array.get(j);
    array.set(i,swapJ);
    arrayCount.set(i,swapNJ);
    array.set(j,swapI);
    arrayCount.set(j,swapNI);
  }
  ArrayList<String> intToString(ArrayList<Integer> array)
  {
    ArrayList<String> newArray = new ArrayList<String>();
    for (Integer i: array )
    {
      newArray.add(String.valueOf(i));
    }
    return newArray;
  }
}
