//Mariam 
class TextWidget extends Widget { 
  int maxlen;
  String title;
//Mariam
TextWidget(int x, int y, int width, String label, PFont font, int event, int maxlen){
  //height = 30;
  super( x,  y,  width,  30,  label,  background,  font,  event);
  this.x=x; this.y=y; this.width = width; this.label=label; this.event=event; 
  this.widgetFont=font; labelColor=color(0); this.maxlen=maxlen;
}


//rob
TextWidget(int width, String label, PFont font, int event, int maxlen, String title){
  //height = 30;
  super( width,  label,  font,  event);
  this.width = width; this.label=label; this.event=event; 
  this.widgetFont=font; labelColor=color(0); this.maxlen=maxlen;
  this.title = title;
}

//rob
@Override
String getTitle(){
  return title;
}
//Mariam
void append(char s){
    if(s==BACKSPACE){
      if(!label.equals("")) label=label.substring(0,label.length()-1); 
    }
    else if (label.length() < maxlen) label=label+str(s);
}
//Mariam
String getLabel(){
 return label; 
}

}
