PImage img;
PImage backPicture;
//int[] opaques = new int[1];
IntList backIndexes;

int p =1;
int np = p+1;
String angle="side";
String current = angle + "#" +p+ ".jpg";
String next = angle + "#" +np+ ".jpg";



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

}

void draw(){
  background(200); //next image
  image(img,0,0);
    
  img.loadPixels();
  
    
    int rand = int(random(backIndexes.size()));
    int k = backIndexes.get(rand);
    
    float r = red(backPicture.pixels[k]);
    float g = green(backPicture.pixels[k]);
    float b = blue(backPicture.pixels[k]);
   
    color tr = color(r,g,b);
   
 
    img.pixels[k] = tr; //make transparent;
  
    
    println(backIndexes.size());
    
    backIndexes.remove(rand);
   
    img.updatePixels();
    
    //saveFrame(); //export frames
    
    if(backIndexes.size()==0){
      p=p+1;
      np=p+1;
      current = angle + "#" +p+ ".jpg";
      next = angle + "#" +np+ ".jpg";
      
      img = loadImage(current);
      backPicture = loadImage(next);
      
      
      backPicture.loadPixels();
  for (int i=0; i < backPicture.pixels.length; i++){
    
    backIndexes.append(i);
    
  }
 
 
    };
    
}
