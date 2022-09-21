PFont myFont2;
class BarChart
{
  int numberOfStates;
  int maxValue;
  int maxValueQat;
  int maxValueHal;
  int maxValueQat3;
  ArrayList <Integer> howBig= new ArrayList <Integer>();

  void setupBarChart(ArrayList <String> states, ArrayList <Integer> countStates, PFont myNewFont)
  {
    myFont2=myNewFont;
    numberOfStates = states.size();
    
    // finds the highest value in the bar chart
    for (int i =0; i <countStates.size(); i++)
    {
      int testValue = countStates.get(i);
      if (i==0)
      {
        maxValue = testValue;
      }
      if (testValue>maxValue)
      {
        maxValue = testValue;
      }
    }
    maxValueQat= maxValue/4;
    maxValueHal=maxValue/2;
    maxValueQat3=maxValueQat*3;
    //gets a pixel sized value for each respective state
    for (int i =0; i <countStates.size(); i++)
    {
       howBig.add((((countStates.get(i))*PIXEL_SIZE)/maxValue));
       ////println(howBig.get(i));
    }
  }
  
  void drawBarChart(ArrayList <String> states)
  {
    line (500,100,500,600);
    line (500,600,numberOfStates*100 +600,600);
    fill(color(255,0,0));
    text(maxValueQat, 490,500);
    text(maxValueHal, 490,400);
    text(maxValueQat3, 490,300);
    text(maxValue, 490,200);
    for  (int i =0; i <states.size(); i++)
    {
      fill(color(255,0,0));
      String nameOfState =states.get(i);
      text(nameOfState,(i*100)+605,620);
      int heightValue=howBig.get(i);
      rect((i*100)+600,600-heightValue,30,heightValue);
    }
  }
}
