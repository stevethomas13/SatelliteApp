// harry this is a class that will be able to draw vertical bar charts :)))))))
class BarChartForDate
{
   int space=30;
  int extraSpace=0;
  int fontSize=0;
  int textSpace=0;
  PFont myFont44;
  int size;
  int maxValue=1;
  float spaceing;
  int maxValueQat;
  int maxValueHal;
  int maxValueQat3;
  String properName;
  ArrayList <Integer> howBig= new ArrayList <Integer>();
  ArrayList<String> names2;
  void setup(ArrayList <String> names, ArrayList <Integer> count,PFont myNewFont,String name)
  {
      howBig.removeAll(howBig);
      properName=name;
      myFont44=myNewFont;
      size = names.size();
      names2= (ArrayList<String>)names.clone();
    
    // finds the highest value in the bar chart
    for (int i =0; i <count.size(); i++)
    {
      int testValue = count.get(i);
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
    spaceing=1000/size;
    //gets a pixel sized value for each respective state
    for (int i =0; i <count.size(); i++)
    {
       howBig.add((((count.get(i))*400)/maxValue));
       ////println(howBig.get(i));
    }
    int size =howBig.size();
    if(size>15)
    {
      space=5;
      textSpace=5;
      extraSpace=70;
      fontSize=20;
    }
    else
    {
      space=30;
      extraSpace=0;
      textSpace=0;
      fontSize=25;
    }
  }
//harry draws the bar chart  
  void drawBar ()
  {
    strokeWeight(1);
    textSize(48);
    pushMatrix();
    float angle1 = radians(270);
    translate(100, 180);
    rotate(angle1);
    textSize(25);
    textAlign(CENTER);
    // need the center of graph value for the first int below
    text("No. of Rockets Launched", -200,0);
    popMatrix();
    
    textAlign(CENTER);
    text(properName,630,700);
    //textSize(24);
    line (200,600,1200,600);
    text(maxValueQat, 165,505);
    line(200,500,1200,500);
    text(maxValueHal,165,405);
    line(200,400,1200,400); 
    text(maxValueQat3, 165,305);
    line (200,300,1200,300);
    text(maxValue, 165,205);
    line (200,200,1200,200);
    for (int i =0; i<howBig.size(); i++)
    {
      String nameOfState =names2.get(i);
      int size =howBig.size();
      if(size>21)
      {
        int year=Integer. parseInt(nameOfState);
        if (year%10!=0)
        {
          nameOfState="";
        }
      }
      text(nameOfState,(i*spaceing)+spaceing+120 +extraSpace+5,630);
      int heightValue=howBig.get(i);
      fill(primary);
      stroke(primary);
      rect((i*spaceing)+spaceing+120+extraSpace,600-heightValue,space,heightValue);
      fill(text);
      stroke(text);
    }
  }
}
