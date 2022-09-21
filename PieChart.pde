// steve
class PieChart {
  float[] angles;
  float diameter=500;
  float posx;
  float posy;
  color[] arrayColors;
 
  // the commented code below can be used to display a pie chart with gray colors
  // instead of random colors, Steve @ 28.03.2022
  color[] show() {
    float lastAngle = 0;
    for (int i = 0; i < angles.length; i++) {
      fill( arrayColors[ i ] );
      noStroke();
      float gray = map( i, 0, angles.length,50,255);
      arrayColors[ i ] = color( gray, gray, gray );
      fill(gray, gray, gray );
      arc(padding + diameter/2, posy, diameter, diameter, lastAngle, lastAngle+radians(angles[i]));
      //text()
      lastAngle += radians(angles[i]);
    }
    return arrayColors;
  }
 
  // this function maps the values in the data[] array to values between 0 and 360,
  // would be better to use a map function instead?
  // Steve @ 28.03.2022
  PieChart(int[] data, float x, float y) {
    float sum = 0;
    for( int i = 0; i < data.length;  i++ ){
       sum = sum + data[ i ];
    }
    angles = new float[ data.length ];
    for( int i = 0; i < data.length; i++ ){
      angles[ i ] = data[ i ]/sum*360;
    }
    posx = x;
    posy = y;
   
    // the code below creates an array of fixed random colors, Steve @ 28.03.2022
    arrayColors = new color[ data.length ];
    for( int i =0; i< data.length; i++){
      arrayColors[ i ] = color( (int)random(0,255), (int)random(0,255), (int)random(0,255) );
    }
   
  }
  
  float getDiameter(){
    return diameter;
  }
}
