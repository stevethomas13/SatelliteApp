// Mariam 
class BarChartHorizontal
{
  PFont myFont44;
  int size;
  float maxValueOfData;
  float maxValue2;
  float maxValue;
  float spaceing1;
  int maxValueQat;
  int maxValueHal;
  int maxValueQat3;
  int barAmount = 6;
  int barSpacing;
  int barSpacing2;
  int space = 50;
  int space2 = 75;
  float spaceing2;
  int x = 900; 
  int y = 240;
  ArrayList<Float> internalCount = new ArrayList<Float>();
//  ArrayList<Integer> count = new ArrayList<Integer>();
  ArrayList <Integer> howBig = new ArrayList <Integer>();  
  void setUp(ArrayList <Float> count,PFont myNewFont)
  {
      howBig.removeAll(howBig);
      internalCount.removeAll(internalCount);
      myFont44=myNewFont;
      size = count.size();
      ////println(size);
    
    // finds the highest value in the bar chart
    maxValue2 = getMax(count);
    barSpacing = round(maxValue2 / barAmount);
    internalCount = countQueries(count);
    maxValue = getMax(internalCount);
    ////println(maxValue);
    barSpacing2 = round (maxValue / barAmount);
    maxValueQat= round(maxValue/4);
    maxValueHal= round(maxValue/2);
    maxValueQat3= maxValueQat*3;
    spaceing1=(1000/size) + space;
    spaceing2 = (1000/size) + space2;
    
    
    //////println("This is " + spaceing);
    //gets a pixel sized value for each respective state
    //////println(count);
    for (int i =0; i <internalCount.size(); i++)
    {
      ////println(internalCount.get(i));
       howBig.add((round(((internalCount.get(i))*600)/maxValue)));
       //////println(howBig.get(i));
    }
  }
  
  void drawBar ()
  {
    strokeWeight(1.5);
    fill(text);
    stroke(grapLabelColor);
    line (x,y,x,y+350);
    textAlign(CENTER);
    textSize(30);
    text(round(maxValue), 900,640);
    //strokeWeight(2);
    line(x-150,y,x-150,y+350);
    textSize(30);
    text(round(maxValueQat3), 755,640);
    //strokeWeight(2);
    line(x-300,y,x-300,y+350); 
    textSize(30);
    text(round(maxValueHal), 600,640);
    //strokeWeight(2);
    line (x-450,y,x-450,y+350);
    textSize(30);
    text(round(maxValueQat), 450,640);
    //strokeWeight(2);
    line (x-600,y,x-600,y+350);
    textSize(30);
    text("0", 300, 640);
    textAlign(LEFT);
    int b = 0;
          int constantTakeAway = 485;
          int constantTakeAway2 = 485;
    for (int i =0; i< howBig.size(); i++, b +=barSpacing)
    {
      fill(text);
      String range = b/1000 + "-" + (b + barSpacing)/1000 ;
      text(range,150,(i*spaceing2) + spaceing2+ constantTakeAway );
      //////println("hi");
      int heightValue=howBig.get(i);
      //////println(heightValue);
      fill(primary);
      stroke(primary);
      rect( 300  + 1.5 , (i*spaceing1)+spaceing1 + constantTakeAway2 ,heightValue ,30);
      fill(text);
      constantTakeAway -= 120;
      constantTakeAway2 -= 95; 
      
    }
    

    fill(text);
    textSize(48);
    pushMatrix();
    float angle1 = radians(270);
    translate(100, 180);
    rotate(angle1);
    textSize(25);
    textAlign(CENTER);
    // need the center of graph value for the first int below
    text("Altitude of Rockets (Km)", -240,0);
    popMatrix();
    textAlign(CENTER);
    text("Quantity",600,700);

  }
  
  ArrayList<Float> countQueries(ArrayList<Float> generalData){
    int b = 0;
    ArrayList<Float> countQueries = new ArrayList<Float>();
    for (int a = 0; a < maxValue2 + 1; a+=barSpacing){
      countQueries.add(0.0);
      for(Float numbers: generalData){
        if (numbers >= a && numbers < a + barSpacing){
          if (countQueries.size() == 0){
            countQueries.add(0.0);
          }
          //////println(countQueries);
          float count = countQueries.get(b);
          count = count + 1;
          countQueries.set(b, count );
      }
    }b++;
    }
    return countQueries;
  }
  
  Float getMax(ArrayList<Float> data){
      for (int i =0; i <data.size(); i++)
    { 
      //////println(test);
      //print(data.size()+"  ");
      float testValue=0;
      try{
        testValue = data.get(i);
      }
      catch (Exception e) {
        testValue = 0;
      }
      if (i==0)
      {
        maxValueOfData = testValue;
      }
      if (testValue>maxValueOfData)
      {
        maxValueOfData = testValue;
      }
      //print(i +" ");
    }
    return maxValueOfData;
  }
  
}
