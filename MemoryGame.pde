import javax.swing.*;
class Sqr {

  int x;
  int y;
  int size;
  int identity;
  
  int[] col=new int[3];
  Sqr(int x1, int y1, int size1, int[] col1, int identity1) {
    x=x1;
    y=y1;
    size=size1;
    identity=identity1;
    for (int i=0; i<3; i++) {
      col[i]=col1[i];
    }
  }
}
int blinks;
  int stage;
  int correct;
int[] indexs=new int[2];
Sqr[] grid=new Sqr[36];
int[] id=new int[36];
int xmin=20;
ArrayList<Integer>x=new ArrayList<Integer>();
//x max is 620
int ymin=20;

//y max is 620;
//Sqr Sqrs= new Sqr[18];
int[] num= new int[18];
int again;
void setup() {
  blinks=0;
  textSize(20);
  textAlign(CENTER);
  correct=0;
  indexReset();
 int xstart=xmin;
 int ystart=ymin;
  int[] colors={0,0,0};
  fillID();
  for(int i=0;i<grid.length;i++){
    grid[i]=new Sqr(xstart,ystart,100,colors,id[i]);
    for(int a=0;a<colors.length;a++){
       colors[a]=(int)random(125);
    }
    xstart+=100;
    if(xstart>=620){
      xstart=20;
      ystart+=100;
    }
    //ystart+=100;
  }
  strokeWeight(5);
 // //println(colors);
  background(255);
  ////println(num);
 
  size(640, 700);
  xmin=20;
  ymin=20;
  for (int i=0; i<18; i++) {
    //Sqrs.push(new Sqr(xstart,ystart,10))
  }
 
  frameRate(1);
  drawGrid();
  println(id);
  
}
void draw(){
//  if(blinks==0){
//    blinks++;
//    blink();
//  
//  }
busy();

  if(blinks>=6){
    good();
    frameRate(60);
      if(stage==2){
        busy();
        ////println(grid[indexs[0]].identity);
         if(grid[indexs[0]].identity==grid[indexs[1]].identity){
           correct++;
           for(int i=0;i<2;i++){
             grid[indexs[i]].identity=-999;
             for(int a=0;a<3;a++){
               grid[indexs[i]].col[a]=255;   
             }
           }
         }
         afterReset();
      }
      if(correct==18){
        println("CONGRATS");
        again= JOptionPane.showConfirmDialog(null,"Would You Like to Play Again?","CONGRATS!",JOptionPane.YES_NO_OPTION);
        if(again==JOptionPane.YES_OPTION){
          masterReset();
        }else{
          noLoop();
        }
        
      }
    }else{
      blinks++;
      if(blinks%2==0){
        drawGrid();
      }else{
        drawAnsGrid();
      }
    
    }
}
void indexReset(){
  indexs[0]=-1;
  indexs[1]=-1;
}
void busy(){
  
  fill(255);
  rect(-15,620,width+20,200);
  textSize(30);
fill(255,0,0);
text("BUSY",width/2,660);
textSize(20);
strokeWeight(5);
}
void good(){
  fill(255);
  rect(-15,620,width+20,200);
  textSize(30);
fill(0,255,0);
text("CLICK",width/2,660);
textSize(20);
strokeWeight(5);

}
void drawGrid() {
  strokeWeight(5);
  for(int i=0;i<grid.length;i++){
    fill(grid[i].col[0],grid[i].col[1],grid[i].col[2]);
    rect(grid[i].x,grid[i].y,grid[i].size,grid[i].size);
  }
};
void drawAnsGrid(){
  strokeWeight(5);
  for(int i=0;i<grid.length;i++){
    fill(255);
    rect(grid[i].x,grid[i].y,grid[i].size,grid[i].size);
    fill(0);
    text(grid[i].identity,grid[i].x+50,grid[i].y+50+textDescent());
  }

}
void masterReset(){
  blinks=0;
  textSize(20);
  textAlign(CENTER);
  correct=0;
  indexReset();
 int xstart=xmin;
 int ystart=ymin;
  int[] colors={0,0,0};
  fillID();
  for(int i=0;i<grid.length;i++){
    grid[i]=new Sqr(xstart,ystart,100,colors,id[i]);
    for(int a=0;a<colors.length;a++){
       colors[a]=(int)random(150);
    }
    xstart+=100;
    if(xstart>=620){
      xstart=20;
      ystart+=100;
    }
    //ystart+=100;
  }
  strokeWeight(5);
 // //println(colors);
  background(255);
  ////println(num);
 
  xmin=20;
  ymin=20;
  for (int i=0; i<18; i++) {
    //Sqrs.push(new Sqr(xstart,ystart,10))
  }
  drawGrid();
  frameRate(1);
  println(id);
}



void afterReset(){
     indexReset();
     stage=0;
     delay(2000);
     drawGrid();
}
void mousePressed(){
  boolean clrsqr=true;
  int index=0;
 
    while(clrsqr){
       if(index>=grid.length){
         index=-1;
         break;
       }
       if(mouseX>grid[index].x && mouseX<grid[index].x+100 && mouseY>grid[index].y && mouseY<grid[index].y+100){
         if(!(grid[index].identity==-999)){
           clrsqr=false;
           indexs[stage]=index;
           stage++;
         }else{
           break;
         }
         
       }else{
         index++;
       }
    
  }
  if(stage==2){
  busy();
  
  }
  if(index>=0 && (!(grid[index].identity==-999))){
    //println(index);
    fill(255,255,255);
    rect(grid[index].x,grid[index].y,100,100);
    fill(0);
    text(grid[index].identity,grid[index].x+50,grid[index].y+50+textDescent());
  }
}
void fillID(){ //<>//
  int l=0;
  for(int i=1;i<=18;i++){
    for(int a=0;a<2;a++){
       x.add(i);
    }
  }
  for(int i=0;i<id.length;i++){
    l=(int)random(0,x.size());
    id[i]=x.remove(l);
  } //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
} //<>//