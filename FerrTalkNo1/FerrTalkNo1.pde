PImage img;
PImage backPicture;
IntList backIndexes;

int p =1;
int np = p+1;
String angle="side";
String current = angle + "#" +p+ ".jpg";
String next = angle + "#" +np+ ".jpg";

void makeTransparent(){
    int rand = int(random(backIndexes.size()));
    int k = backIndexes.get(rand);
    
    float r = red(backPicture.pixels[k]);
    float g = green(backPicture.pixels[k]);
    float b = blue(backPicture.pixels[k]);
   
    color tr = color(r,g,b);
   
 
    img.pixels[k] = tr; //make transparent;
    
        backIndexes.remove(rand);
   }


void setup(){
  size(307, 720);
  img = loadImage(current);
  backPicture = loadImage(next);
  backIndexes = new IntList();
  frameRate(60000);

 
 backPicture.loadPixels();
  for (int i=0; i < backPicture.pixels.length; i++){
    
    backIndexes.append(i);
    
  }
  
  img.loadPixels();
  for(int j=0; j< backPicture.pixels.length*27/100; j++ ){
    
    makeTransparent();
  
  }
  
  img.updatePixels();

}

void draw(){
  background(200); //next image
  image(img,0,0);
    
 
   makeTransparent();
  
    
   println(backIndexes.size());
    

   
    img.updatePixels();
    
    //saveFrame("movie/" + angle + "#########.jpg"); //export frames
    
    if(backIndexes.size() < backPicture.pixels.length*30/100){
      p=p+1;
      np=p+1;
      current = angle + "#" +p+ ".jpg";
      next = angle + "#" +np+ ".jpg";
      
      //img = loadImage(current);
      backPicture = loadImage(next);
      
      
      backPicture.loadPixels();
  for (int i=0; i < backPicture.pixels.length; i++){
    
    backIndexes.append(i);
    
  }
 
 
    };
    
}
