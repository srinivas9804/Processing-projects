PImage img, img1, img2, img3, img4,img5;
int x, y, r;
int flag;//to rotate the board. 1 is the bottom,2 is the left row, 3 upper row,4 right row
int flag1[]={1,1,1,1};//stores the flag(which row the player is on) of each player.
int price[]={0,60,60,200,100,0,120,0,140,0,160,200,180,180,0,220,240,200,260,0,280,0,300,300,200,0,350,400};//0 is for properties which cannot be bought
int ctax1[]={5,10,15,20,25,30,35,40,45,50};//carbon tax permits for player 1
int ctax2[]={5,10,15,20,25,30,35,40,45,50};
int ctax3[]={5,10,15,20,25,30,35,40,45,50};
int ctax4[]={5,10,15,20,25,30,35,40,45,50};
int ctaxCtr[]={0,0,0,0};
int moneyCtr=0;//if a player's balance goes below 0 this variable increases by 1
int rent[]=new int[28];//rent = 1/3 the price.
int money[]={1000,1000,1000,1000};//stores the money each player has
int owned[]={-1,0,0,0,0,-1,0,-1,0,-1,0,0,0,0,-1,0,0,0,0,-1,0,-1,0,0,0,0,-1,0};//-1-cannot be bought.0-unsold. 1-sold to player1,2-sold to player2,....
int jail[]={0,0,0,0};//0-not in jail.1-in jail/go to jail.
int jailctr[]={0,0,0,0};//to count 3 moves if in jail.
int rolldice[]={0,0,0,0};//to make sure the dice is pressed only once.
int plotsOwned[]={0,0,0,0};//plots Owned by each player
color c[]={color(255,0,0),color(0,255,0),color(0,0,255),color(255,255,0)};
int moveOrder[]={0,0,0,0};//to make sure buttons are pressed in a sequential order. 0 represents roll dice. 1 represents buyLocation. 2 represents endMove.
int xx=780;//keep constant
int yy[]={900,900,900,900};//reduce yy value to traverse from right to left, 900 is the rightmost block and 120 is the leftmost. 110 reduction per box.
int yy1[]={900,900,900,900};
int theSize=50;
int playerPosition[]={0,0,0,0};
int playerChance;//1 represents player 1's turn, 2 represents player 2's turn....
PFont font1,font2;
String chance[]={"Advance to Go (Collect 200k hkd)","Bank pays you dividend of 50k hkd","Go Back 3 Spaces","Pay poor tax of 15k hkd ","Your building loan matures – Collect 150k hkd"};
String CC[]={"Advance to Go (Collect 200k hkd)","Bank error in your favor – Collect 200k hkd","Doctor's fees – Pay 50k hkd","From sale of stock you get 50k hkd","Go to JAIL"};
int chanceCtr[]={0,0,0,0};
int ctr=0;//to print chance cards
int ctr1=0;//to print community chest cards
int ran=0;//random number generator
int time=0;//to print chance/community cards for a 5 second interval

void setup()
{
  size(1450, 960);
  background(212, 232, 205);
  stroke(0, 0, 0);
  strokeWeight(2);
  img = loadImage("Jail.jpg");
  img1 = loadImage("sro.jpg");
  img2 = loadImage("airport.jpg");
  img3 = loadImage("disneyland.jpg");
  img4 = loadImage("ifc.jpg");
  img5 = loadImage("chest.jpg");
  x=0;
  y=0;
  r=0;
  flag=1;
  playerChance=1;
  font1=createFont("FlowersKingdom.ttf",64);
  font2=createFont("ArialNarrow-14.vlw",14);
  for(int i=0;i<28;i++)
  {
    int temp=price[i]/3;//nearest multiple of ten 
    int rem=temp%10;
    if(rem>=5)
      temp=temp+(10-rem);
    else
      temp=temp-rem;
    rent[i]=temp;
  }
  for(int i=0;i<28;i++)
  {
    System.out.print(rent[i]+" ");
  }
}
void draw()
{

  stroke(0, 0, 0);
  strokeWeight(2);
  background(212, 232, 205);
  frameRate(60);
  
  //Chance
  fill(255, 165, 0);
  quad(600, 780, 500, 680, 680, 510, 780, 610);
  pushMatrix();
  textAlign(CENTER);
  translate(690,650);
  fill(0);
  textSize(40);
  rotate(radians(315));
  text("CHANCE",-30,-30);
  popMatrix();
  
  //CC
  fill(9, 203, 213);
  quad(280, 460, 180, 360, 360, 190, 460, 290);
  pushMatrix();
  textAlign(CENTER);
  translate(280,270);
  fill(0);
  textSize(36);
  rotate(radians(137));
  text("COMMUNITY",10,-80);
  text("CHEST",0,-30);
  popMatrix();
  
  
  pushMatrix();//places on the board
  translate(x, y);
  rotate(radians(r));
  fill(212, 232, 205);
  quad(150, 810, 260, 810, 260, 960, 150, 960);
  quad(260, 810, 370, 810, 370, 960, 260, 960);
  quad(370, 810, 480, 810, 480, 960, 370, 960);
  quad(480, 810, 590, 810, 590, 960, 480, 960);
  quad(590, 810, 700, 810, 700, 960, 590, 960);
  quad(700, 810, 810, 810, 810, 960, 700, 960);


  //RED
  fill(255, 0, 0);
  quad(590, 810, 700, 810, 700, 845, 590, 845);
  quad(700, 810, 810, 810, 810, 845, 700, 845);

  strokeWeight(1);
  pushMatrix();//T.S.T
  translate(755, 870);
  textAlign(CENTER);
  fill(0, 0, 0);
  stroke(0, 0, 0);
  textSize(13);
  text("Tsim Sha Tsui", 0, 0);  
  text("60K HKD",0,60);
  textSize(18);
  if(owned[1]>0)
  {
    printPlayer(owned[1]);
    text(owned[1],0,35);
  }
  fill(0,0,0);
  textSize(11);
  text("30 Tonnes of",0,75);
  textSize(9);
  text("Carbon-dioxide",0,85);
  popMatrix();

  pushMatrix();//Prince_Ed
  translate(645, 870);
  textAlign(CENTER);
  fill(0, 0, 0);
  stroke(0, 0, 0);
  textSize(13);
  text("Prince Edward", 0, 0);
  text("60K HKD",0,60);
  textSize(18);
  if(owned[2]>0)
  {
    printPlayer(owned[2]);
    text(owned[2],0,35);
  }
  fill(0,0,0);
  textSize(11);
  text("15 Tonnes of",0,75);
  textSize(9);
  text("Carbon-dioxide",0,85);
  popMatrix();

  //L.Green
  strokeWeight(2);
  fill(50, 205, 50);
  quad(150, 810, 260, 810, 260, 845, 150, 845);
  quad(370, 810, 480, 810, 480, 845, 370, 845);

  pushMatrix();//Mong_Kok
  translate(205, 870);
  textAlign(CENTER);
  fill(0, 0, 0);
  stroke(0, 0, 0);
  textSize(13);
  text("Mong Kok", 0, 0);
  text("120K HKD",0,60);
  textSize(18);
  if(owned[6]>0)
  {
    printPlayer(owned[6]);
    text(owned[6],0,35);
  }
  fill(0,0,0);
  textSize(11);
  text("40 Tonnes of",0,75);
  textSize(9);
  text("Carbon-dioxide",0,85);
  popMatrix();

  pushMatrix();//Kowloon_Tong
  translate(425, 870);
  textAlign(CENTER);
  fill(0, 0, 0);
  stroke(0, 0, 0);
  textSize(13);
  text("Kowloon Tong", 0, 0);
  text("100K HKD",0,60);
  textSize(18);
  if(owned[4]>0)
  {
    printPlayer(owned[4]);
    text(owned[4],0,35);
  }
  fill(0,0,0);
  textSize(11);
  text("25 Tonnes of",0,75);
  textSize(9);
  text("Carbon-dioxide",0,85);
  popMatrix();

  fill(212, 232, 205);//JAIL
  quad(0, 810, 150, 810, 150, 960, 0, 960);
  fill(249, 150, 31);
  quad(50, 810, 150, 810, 150, 910, 50, 910);
  fill(0, 0, 0);
  line(70, 810, 70, 910);
  line(90, 810, 90, 910);
  line(110, 810, 110, 910);
  line(130, 810, 130, 910);
  line(150, 810, 150, 910);
  textSize(20);
  text("IN", 100, 840);
  text("JAIL", 100, 890);
  pushMatrix();
  translate(20, 860);
  rotate(radians(90));
  text("JUST", 0, 0);
  popMatrix();
  text("VISTING", 100, 940);

  fill(212, 232, 205);//GO
  quad(810, 810, 960, 810, 960, 960, 810, 960);
  pushMatrix();
  stroke(0, 0, 0);
  fill(0, 0, 0);
  translate(845, 845);
  textSize(13);
  rotate(radians(315));
  text("COLLECT", 0, 0);
  text("200K hkd SALARY", 0, 15);
  text("AS YOU PASS", 0, 30);
  textSize(60);
  text("GO", 0, 80);
  popMatrix();
  stroke(0, 0, 0);
  fill(255, 0, 0);
  beginShape();
  vertex(932, 927);
  vertex(925, 935);
  vertex(932, 941);
  vertex(915, 941);
  vertex(913, 938);
  vertex(858, 938);
  vertex(857, 944);
  vertex(839, 935);
  vertex(855, 927);
  vertex(857, 931);
  vertex(911, 932);
  vertex(915, 927);
  endShape(CLOSE);
  textSize(13);
  image(img1, 481, 810, 108, 115);
  
  pushMatrix();
  translate(535,935);
  fill(0,0,0);
  text("CityU SRO",0,0);
  text("200K HKD",0,20);
  textSize(18);
  if(owned[3]>0)
  {
    printPlayer(owned[3]);
    text(owned[3],0,35);
  }
  fill(0,0,0);
  textSize(11);
  text("10 Tonnes of",0,75);
  textSize(9);
  text("Carbon-dioxide",0,85);
  popMatrix();//end of bottom block
  
  //Chance
  fill(196,19,118);
  stroke(0,0,0);
  pushMatrix();
  translate(250,775);//-10,-35
  beginShape();
  vertex(45,110);
  vertex(36,91);
  vertex(39,76);
  vertex(52,64);
  vertex(69,57);
  vertex(85,58);
  vertex(92,66);
  vertex(101,75);
  vertex(104,93);
  vertex(100,106);
  vertex(86,121);
  vertex(68,137);
  vertex(66,147);
  vertex(73,147);
  vertex(79,146);
  vertex(73,165);
  vertex(60,162);
  vertex(48,149);
  vertex(52,137);
  vertex(73,112);
  vertex(87,97);
  vertex(84,76);
  vertex(65,71);
  vertex(53,81);
  vertex(53,93);
  vertex(60,98);
  endShape(CLOSE);
  textSize(20);
  ellipse(70,175,15,15);
  fill(0,0,0);
  text("CHANCE",65,55);
  popMatrix();
  textSize(13);
   
  //left Hand Side
  fill(212, 232, 205);
  quad(150, 810, 0, 810, 0, 700, 150, 700);
  quad(0, 700, 150, 700, 150, 590, 0, 590);
  quad(150, 590, 0, 590, 0, 480, 150, 480);
  quad(0, 480, 150, 480, 150, 370, 0, 370);
  quad(150, 370, 0, 370, 0, 260, 150, 260);
  quad(0, 260, 150, 260, 150, 150, 0, 150);
  quad(150, 150, 0, 150, 0, 0, 150, 0);

  //darkgreen
  fill(45, 85, 23);
  quad(150, 700, 115, 700, 115, 810, 150, 810);
  quad(150, 480, 115, 480, 115, 590, 150, 590);

  //darkpink
  fill(229, 79, 202);
  quad(115, 150, 115, 260, 150, 260, 150, 150);
  quad(115, 260, 150, 260, 150, 370, 115, 370);

  fill(0, 0, 0);
  textAlign(LEFT);
  pushMatrix();
  translate(100, 706);
  rotate(radians(90));
  text("Asia World Expo", 0, 0);
  text("140K HKD",15,60);
  textSize(18);
  if(owned[8]>0)
  {
    printPlayer(owned[8]);
    text(owned[8],50,35);
  }
  fill(0,0,0);
  textSize(11);
  text("20 Tonnes of",15,75);
  textSize(9);
  text("Carbon-dioxide",15,85);
  popMatrix();
  pushMatrix();
  translate(100, 510);
  rotate(radians(90));
  textSize(13);
  text("Lai King", 0, 0);
  text("160K HKD",-10,60);
  textSize(18);
  if(owned[10]>0)
  {
    printPlayer(owned[10]);
    text(owned[10],25,35);
  }
  fill(0,0,0);
  textSize(11);
  text("15 Tonnes of",-10,75);
  textSize(9);
  text("Carbon-dioxide",-10,85);
  popMatrix();

  fill(0, 0, 0);
  pushMatrix();
  translate(100, 300);
  rotate(radians(90));
  textSize(13);
  text("Austin", 0, 0);
  text("180K HKD",-17,60);
  textSize(18);
  if(owned[12]>0)
  {
    printPlayer(owned[12]);
    text(owned[12],20,35);
  }
  fill(0,0,0);
  textSize(11);
  text("20 Tonnes of",-17,75);
  textSize(9);
  text("Carbon-dioxide",-17,85);
  popMatrix();
  pushMatrix();
  translate(100, 177);
  rotate(radians(90));
  textSize(13);
  text("Hung Hom", 0, 0);
  text("180K HKD",-3,60);
  textSize(18);
  if(owned[13]>0)
  {
    printPlayer(owned[13]);
    text(owned[13],25,35);
  }
  fill(0,0,0);
  textSize(11);
  text("20 Tonnes of",-3,75);
  textSize(9);
  text("Carbon-dioxide",-3,85);
  popMatrix();

  //free wifi
  textAlign(CENTER);
  textSize(33);
  text("FREE", 75, 40);
  text("WiFi", 75, 130);
  fill(0);
  quad(45, 55, 105, 55, 105, 60, 45, 60);
  quad(55, 65, 95, 65, 95, 70, 55, 70);
  quad(65, 75, 85, 75, 85, 80, 65, 80);
  quad(70, 85, 80, 85, 80, 90, 70, 90);
  image(img2, 35, 370, 115, 110);
  pushMatrix();
  translate(25,425);
  fill(0,0,0);
  textSize(13);
  rotate(radians(90));
  text("Airport",0,0);
  text("200K HKD",0,20);
  popMatrix();

  //Shyla doing Sab's part  
  fill(212, 232, 205);
  quad(150, 0, 260, 0, 260, 150, 150, 150);
  quad(260, 0, 370, 0, 370, 150, 260, 150);
  quad(370, 0, 480, 0, 480, 150, 370, 150);
  quad(480, 0, 590, 0, 590, 150, 480, 150);
  quad(590, 0, 700, 0, 700, 150, 590, 150);
  quad(700, 0, 810, 0, 810, 150, 700, 150);

  //Inner colored boxes- still no thanks to sabharwal
  fill(204, 204, 0);
  quad(150, 110, 260, 110, 260, 150, 150, 150);
  quad(260, 110, 370, 110, 370, 150, 260, 150);

  fill(0, 255, 255);
  quad(480, 110, 590, 110, 590, 150, 480, 150);
  quad(700, 110, 810, 110, 810, 150, 700, 150);

  //Srinivas doing sab's part
  pushMatrix();//Olympic
  translate(205, 90);
  textAlign(CENTER);
  fill(0, 0, 0);
  stroke(0, 0, 0);
  rotate(radians(180));
  textSize(13);
  text("Olympic", 0, 0);
  text("220K HKD",0,60);
  textSize(18);
  if(owned[15]>0)
  {
    printPlayer(owned[15]);
    text(owned[15],0,35);
  }
  fill(0,0,0);
  textSize(11);
  text("30 Tonnes of",0,75);
  textSize(9);
  text("Carbon-dioxide",0,85);
  popMatrix();

  pushMatrix();//Tung_chung
  translate(315, 90);
  textAlign(CENTER);
  fill(0, 0, 0);
  stroke(0, 0, 0);
  rotate(radians(180));
  textSize(13);
  text("Tung Chung", 0, 0);
  text("240K HKD",0,60);
  textSize(18);
  if(owned[16]>0)
  {
    printPlayer(owned[16]);
    text(owned[16],0,35);
  }
  fill(0,0,0);
  textSize(11);
  text("30 Tonnes of",0,75);
  textSize(9);
  text("Carbon-dioxide",0,85);
  popMatrix();

  pushMatrix();//Sha_tin
  translate(535, 90);
  textAlign(CENTER);
  fill(0, 0, 0);
  stroke(0, 0, 0);
  rotate(radians(180));
  textSize(13);
  text("Sha Tin", 0, 0);
  text("260K HKD",0,60);
  textSize(18);
  if(owned[18]>0)
  {
    printPlayer(owned[18]);
    text(owned[18],0,35);
  }
  fill(0,0,0);
  textSize(11);
  text("25 Tonnes of",0,75);
  textSize(9);
  text("Carbon-dioxide",0,85);
  popMatrix();

  pushMatrix();//Tai_wai
  translate(755, 90);
  textAlign(CENTER);
  fill(0, 0, 0);
  stroke(0, 0, 0);
  rotate(radians(180));
  textSize(13);
  text("Tai Wai", 0, 0);
  text("280K HKD",0,60);
  textSize(18);
  if(owned[20]>0)
  {
    printPlayer(owned[20]);
    text(owned[20],0,35);
  }
  fill(0,0,0);
  textSize(11);
  text("15 Tonnes of",0,75);
  textSize(9);
  text("Carbon-dioxide",0,85);
  popMatrix();

  quad(810, 0, 960, 0, 960, 150, 810, 150);
  image(img, 811, 1, 149, 149);//jail
  image(img3, 372, 35, 108, 115);
  pushMatrix();
  translate(425,25);
  fill(0,0,0);
  textSize(13);
  rotate(radians(180));
  text("Disney Land",0,0);
  text("200K HKD",0,20);
  textSize(18);
  if(owned[17]>0)
  {
    printPlayer(owned[17]);
    text(owned[17],0,35);
  }
  fill(0,0,0);
  popMatrix();

  //Chance
  fill(196,19,118);
  stroke(0,0,0);
  pushMatrix();
  translate(710,185);//-10,-35
  rotate(radians(180));
  beginShape();
  vertex(45,110);
  vertex(36,91);
  vertex(39,76);
  vertex(52,64);
  vertex(69,57);
  vertex(85,58);
  vertex(92,66);
  vertex(101,75);
  vertex(104,93);
  vertex(100,106);
  vertex(86,121);
  vertex(68,137);
  vertex(66,147);
  vertex(73,147);
  vertex(79,146);
  vertex(73,165);
  vertex(60,162);
  vertex(48,149);
  vertex(52,137);
  vertex(73,112);
  vertex(87,97);
  vertex(84,76);
  vertex(65,71);
  vertex(53,81);
  vertex(53,93);
  vertex(60,98);
  endShape(CLOSE);
  textSize(20);
  ellipse(70,175,15,15);
  fill(0,0,0);
  text("CHANCE",65,55);
  popMatrix();
  textSize(13);
  
  //Image printing for CC1- Shyla
  image(img5,20,595,120,100);
  
  //shyla's part
  //just the box outline with monopoly board color
  fill(212, 232, 205);

  quad(810, 150, 960, 150, 960, 260, 810, 260);
  quad(810, 260, 960, 260, 960, 370, 810, 370);
  quad(810, 370, 960, 370, 960, 480, 810, 480);
  quad(810, 480, 960, 480, 960, 590, 810, 590);
  quad(810, 590, 960, 590, 960, 700, 810, 700);
  quad(810, 700, 960, 700, 960, 810, 810, 810);

  //Inner purple boxes
  fill(184, 64, 211);
  quad(810, 150, 845, 150, 845, 260, 810, 260);
  quad(810, 260, 845, 260, 845, 370, 810, 370);

  //Text in the purple boxes
  textAlign(LEFT);
  fill(0, 0, 0);
  pushMatrix();
  translate(870, 225);
  rotate(radians(270));
  textSize(13);
  text("Po Lam", 0, 0);
  text("300K HKD",-10,60);
  textSize(18);
  if(owned[22]>0)
  {
    printPlayer(owned[22]);
    text(owned[22],15,35);
  }
  fill(0,0,0);
  textSize(11);
  text("35 Tonnes of",-10,75);
  textSize(9);
  text("Carbon-dioxide",-10,85);
  popMatrix();
  pushMatrix();
  translate(870, 350);
  rotate(radians(270));
  textSize(13);
  text("Quarry Bay", 0, 0);
  text("300K HKD",0,60);
  textSize(18);
  if(owned[23]>0)
  {
    printPlayer(owned[23]);
    text(owned[23],25,35);
  }
  fill(0,0,0);
  textSize(11);
  text("10 Tonnes of",0,75);
  textSize(9);
  text("Carbon-dioxide",0,85);
  popMatrix();

  //Inner blue boxes
  fill(0, 0, 255);
  quad(810, 480, 845, 480, 845, 590, 810, 590);
  quad(810, 700, 845, 700, 845, 810, 810, 810);

  //Text in the blue boxes
  fill(0, 0, 0);
  pushMatrix();
  translate(870, 580);
  rotate(radians(270));
  textSize(13);
  text("Causeway Bay", 0, 0);
  text("350K HKD",10,60);
  textSize(18);
  if(owned[25]>0)
  {
    printPlayer(owned[25]);
    text(owned[25],35,35);
  }
  fill(0,0,0);
  textSize(11);
  text("5 Tonnes of",10,75);
  textSize(9);
  text("Carbon-dioxide",10,85);
  popMatrix();
  pushMatrix();
  translate(870, 780);
  rotate(radians(270));
  textSize(13);
  text("Central", 0, 0);
  text("400K HKD",-10,60);
  textSize(18);
  if(owned[27]>0)
  {
    printPlayer(owned[27]);
    text(owned[27],20,35);
  }
  fill(0,0,0);
  textSize(11);
  text("50 Tonnes of",-10,75);
  textSize(9);
  text("Carbon-dioxide",-10,85);
  popMatrix();
  
  image(img4, 810, 372, 115, 107);
  pushMatrix();
  textAlign(CENTER);
  translate(935,425);
  fill(0,0,0);
  textSize(13);
  rotate(radians(270));
  text("IFC",0,0);
  text("200K",0,20);
  textSize(18);
  if(owned[24]>0)
  {
    printPlayer(owned[24]);
    text(owned[24],35,35);
  }
  fill(0,0,0);
  popMatrix();
  
  //Image printing for CC1- Shyla
  pushMatrix();
  translate(940,695);
  rotate(radians(180));
  image(img5,0,0,120,100);
  popMatrix();
  
  
  //Board design ends here
  
  popMatrix();//used to rotate
  
  //Monopoly text
  textFont(font1,68);
  stroke(0);
  strokeWeight(3);
  pushMatrix();
  translate(width/2,height/2);
  rotate(radians(317));
  fill(255);
  text("M O N O P O L Y",-180,-100);
  textFont(font1);
  fill(255,0,0);
  text("M O N O P O L Y",-180,-100);
  popMatrix();
  strokeWeight(1);
  
  textFont(font2,14);
  if(playerChance==1)
  {
    if(money[0]>0)
    {
      drawCar(xx,yy[0],c[0]);
      
      if(mousePressed)
      {
        if(jail[0]==0)
        {
          if(moveOrder[0]==0 && mouseX>=1130 && mouseX<=1260 && mouseY>=280 && mouseY<=340)// ROLL DICE BUTTON LOGIC
          {
            int r=rolldice();
            yy1[0]-=(115*r);
            playerPosition[0]+=r;
            if(playerPosition[0]==21)
            {
              playerPosition[0]=7;
              jail[0]=1;
            }
            if(playerPosition[0]>27)
            {
              int temp=playerPosition[0]%28;
              playerPosition[0]=temp;
            }
            if(playerPosition[0]>=0&&playerPosition[0]<8)
            {
               flag1[0]=1;
               yy1[0]=900-(playerPosition[0])*115;
            }
            if(playerPosition[0]>7&&playerPosition[0]<15)
            {
               flag1[0]=2;
               yy1[0]=900-(playerPosition[0]-7)*115;
            }
            if(playerPosition[0]>14&&playerPosition[0]<22)
            {
               flag1[0]=3;
               yy1[0]=900-(playerPosition[0]-14)*115;
            }
            if(playerPosition[0]>21&&playerPosition[0]<28)
            {
               flag1[0]=4;
               yy1[0]=900-(playerPosition[0]-21)*115;
            }
            if(yy[0]<yy1[0])
            {
              for(int i=yy[0];i<=yy1[0];i++)
              {
                yy[0]=i;
                drawCar(xx,yy[0],c[0]);
              }
            }
            else
            {
              for(int i=yy[0];i>=yy1[0];i--)
              {
                yy[0]=i;
                drawCar(xx,yy[0],c[0]);            
              }
            }
            moveOrder[0]++;
            if(owned[playerPosition[0]]>0)
            {
              money[0]-=rent[playerPosition[0]];
              money[owned[playerPosition[0]]-1]+=rent[playerPosition[0]];
            }
            
          }
          if(moveOrder[0]==1 && mouseX>=180 && mouseX<=450 && mouseY>=190 && mouseY<=460 && ((playerPosition[0]==9) || (playerPosition[0]==26)))//COMUNITY CHEST LOGIC
          {
            ran=Chance_CC();
            if(ran==0)
            {
              playerPosition[0]=0;
              yy[0]=900;
              money[0]+=200;
              flag1[0]=1;
            }
            if(ran==1)
            {
              money[0]+=200;
            }
            if(ran==2)
            {
              money[0]-=50;
            }
            if(ran==3)
            {
              money[0]+=50;
            }
            if(ran==4)
            {
              playerPosition[0]=7;
              jail[0]=1;
              yy[0]=900-(115*7);
              flag1[0]=0;
            }
            time=millis()+5000;
            moveOrder[0]++;
            ctr1++;
          }
          if(moveOrder[0]==1 && mouseX>=500 && mouseX<=780 && mouseY>=510 && mouseY<=780 && ((playerPosition[0]==5) || (playerPosition[0]==19)))//CHANCE LOGIC
          {
            ran=Chance_CC();
            if(ran==0)
            {
              playerPosition[0]=0;
              yy[0]=900;
              money[0]+=200;
              flag1[0]=1;
            }
            if(ran==1)
            {
              money[0]+=50;
            }
            if(ran==2)
            {
              playerPosition[0]-=3;
              yy[0]+=(115*3);
            }
            if(ran==3)
            {
              money[0]-=15;
            }
            if(ran==4)
            {
              money[0]+=150;
            }
            time=millis()+5000;
            moveOrder[0]++;
            ctr++;
          }
          if(moveOrder[0]==1 &&mouseX>=980 && mouseX<=1110 && mouseY>=280 && mouseY<=340 && owned[playerPosition[0]]==0)//BUY LOCATION BUTTON LOGIC
          {
            money[0]-=price[playerPosition[0]];
            owned[playerPosition[0]]=1;
            ctaxCtr[0]=(int)random(1,9);
            plotsOwned[0]++;
            moveOrder[0]++;
          }
          if(moveOrder[0]>=1 && mouseX>=1280 && mouseX<=1410 && mouseY>=280 && mouseY<=340)//end turn
          {
            moveOrder[0]=0;
            playerChance++;
          }
        }
        else if(jail[0]==1)
        {
          if(jailctr[0]==2)
          {
            jail[0]=0;
            jailctr[0]=0;
          }
          else
            jailctr[0]++;
          playerChance++;
        }
      }
    }
    else
    {
      playerChance++;
    }
  }
  if(playerChance==2)
  {
    if(money[1]>0)
    {
      drawCar(xx,yy[1],c[1]);
      if(mousePressed)
      {
        if(jail[1]==0)
        {
          if(moveOrder[1]==0 && mouseX>=1130 && mouseX<=1260 && mouseY>=470 && mouseY<=530)
          {
            int r=rolldice();
            yy1[1]-=(115*r);
            playerPosition[1]+=r;
            if(playerPosition[1]==21)
            {
              jail[1]=1;
              playerPosition[1]=7;
            }
            if(playerPosition[1]>27)
            {
              int temp=playerPosition[1]%28;
              playerPosition[1]=temp;
            }
            if(playerPosition[1]>=0&&playerPosition[1]<8)
            {
               flag1[1]=1;
               yy1[1]=900-(playerPosition[1])*115;
            }
            if(playerPosition[1]>7&&playerPosition[1]<15)
            {
               flag1[1]=2;
               yy1[1]=900-(playerPosition[1]-7)*115;
            }
            if(playerPosition[1]>14&&playerPosition[1]<22)
            {
               flag1[1]=3;
               yy1[1]=900-(playerPosition[1]-14)*115;
            }
            if(playerPosition[1]>21&&playerPosition[1]<28)
            {
               flag1[1]=4;
               yy1[1]=900-(playerPosition[1]-21)*115;
            }
            if(yy[1]<yy1[1])
            {
              for(int i=yy[1];i<=yy1[1];i++)
              {
                yy[1]=i;
                drawCar(xx,yy[1],c[1]);
              }
            }
            else
            {
              for(int i=yy[1];i>=yy1[1];i--)
              {
                yy[1]=i;
                drawCar(xx,yy[1],c[1]);            
              }
            }
            if(owned[playerPosition[1]]>0)
            {
              money[1]-=rent[playerPosition[1]];
              money[owned[playerPosition[1]]-1]+=rent[playerPosition[1]];
            }
            moveOrder[1]++;
          }
          if(moveOrder[1]==1 && mouseX>=180 && mouseX<=450 && mouseY>=190 && mouseY<=460 && ((playerPosition[1]==9) || (playerPosition[1]==26)))
          {
            ran=Chance_CC();
            if(ran==0)
            {
              playerPosition[1]=0;
              yy[1]=900;
              money[1]+=200;
              flag1[1]=1;
            }
            if(ran==1)
            {
              money[1]+=200;
            }
            if(ran==2)
            {
              money[1]-=50;
            }
            if(ran==3)
            {
              money[1]+=50;
            }
            if(ran==4)
            {
              playerPosition[1]=7;
              jail[1]=1;
              yy[1]=900-(115*7);
              flag1[1]=0;
            }
            time=millis()+5000;
            moveOrder[1]++;
            ctr1++;
          }
          if(moveOrder[1]==1 && mouseX>=500 && mouseX<=780 && mouseY>=510 && mouseY<=780 && ((playerPosition[1]==5) || (playerPosition[1]==19)))
          {
            ran=Chance_CC(); 
            if(ran==0)
            {
              playerPosition[1]=0;
              yy[1]=900;
              money[1]+=200;
              flag1[1]=0;
            }
            if(ran==1)
            {
              money[1]+=50;
            }
            if(ran==2)
            {
              playerPosition[1]-=3;
              yy[1]+=(115*3);
              
            }
            if(ran==3)
            {
              money[1]-=15;
            }
            if(ran==4)
            {
              money[1]+=150;
            }
            time=millis()+5000;
            moveOrder[1]++;
            ctr++;
          }
          if(moveOrder[1]==1 &&mouseX>=980 && mouseX<=1110 && mouseY>=470 && mouseY<=530 && owned[playerPosition[1]]==0)
          {
            money[1]-=price[playerPosition[1]];
            owned[playerPosition[1]]=2;
            plotsOwned[1]++;
            moveOrder[1]++;
            ctaxCtr[1]=(int)random(0,9);
          }
          
          if(moveOrder[1]>=1 && mouseX>=1280 && mouseX<=1410 && mouseY>=470 && mouseY<=530)
          {
            moveOrder[1]=0;
            playerChance++;
          }
        }
        else if(jail[1]==1)
        {
          if(jailctr[1]==2)
          {
            jail[1]=0;
            jailctr[1]=0;
          }
          else
            jailctr[1]++;
          playerChance++;
        }
      }
    }
    else
    {
      playerChance++;
    }
  }
  if(playerChance==3)
  {
    if(money[2]>0)
    {
      drawCar(xx,yy[2],c[2]);
      if(mousePressed)
      {
        if (jail[2]==0)
        {
          if(moveOrder[2]==0 && mouseX>=1130 && mouseX<=1260 && mouseY>=670 && mouseY<=730)
          {
            int r=rolldice();
            yy1[2]-=(115*r);
            playerPosition[2]+=r;
            if(playerPosition[2]==21)
            {
              playerPosition[2]=7;
              jail[2]=1;
            }
            if(playerPosition[2]>27)
            {
              int temp=playerPosition[2]%28;
              playerPosition[2]=temp;
            }
            if(playerPosition[2]>=0&&playerPosition[2]<8)
            {
               flag1[2]=1;
               yy1[2]=900-(playerPosition[2])*115;
            }
            if(playerPosition[2]>7&&playerPosition[2]<15)
            {
               flag1[2]=2;
               yy1[2]=900-(playerPosition[2]-7)*115;
            }
            if(playerPosition[2]>14&&playerPosition[2]<22)
            {
               flag1[2]=3;
               yy1[2]=900-(playerPosition[2]-14)*115;
            }
            if(playerPosition[2]>21&&playerPosition[2]<28)
            {
               flag1[2]=4;
               yy1[2]=900-(playerPosition[2]-21)*115;
            }
            if(yy[2]<yy1[2])
            {
              for(int i=yy[2];i<=yy1[2];i++)
              {
                yy[2]=i;
                drawCar(xx,yy[2],c[2]);
              }
            }
            else
            {
              for(int i=yy[2];i>=yy1[2];i--)
              {
                yy[2]=i;
                drawCar(xx,yy[2],c[2]);            
              }
            }
            if(owned[playerPosition[2]]>0)
            {
              money[2]-=rent[playerPosition[2]];
              money[owned[playerPosition[2]]-1]+=rent[playerPosition[2]];
            }
            moveOrder[2]++;
          }
          
          if(moveOrder[2]==1 && mouseX>=180 && mouseX<=450 && mouseY>=190 && mouseY<=460 && ((playerPosition[2]==9) || (playerPosition[2]==26)))
          {
            ran=Chance_CC();
            if(ran==0)
            {
              playerPosition[2]=0;
              yy[2]=900;
              money[2]+=200;
              flag1[2]=1;
            }
            if(ran==1)
            {
              money[2]+=200;
            }
            if(ran==2)
            {
              money[2]-=50;
            }
            if(ran==3)
            {
              money[2]+=50;
            }
            if(ran==4)
            {
              playerPosition[2]=7;
              jail[2]=1;
              yy[2]=900-(115*7);
              flag1[2]=0;
            }
            time=millis()+5000;
            moveOrder[2]++;
            ctr1++;
          }
          if(moveOrder[2]==1 && mouseX>=500 && mouseX<=780 && mouseY>=510 && mouseY<=780 && ((playerPosition[2]==5) || (playerPosition[2]==19)))
          {
            ran=Chance_CC();     
            if(ran==0)
            {
              playerPosition[2]=0;
              yy[2]=900;
              money[2]+=200;
              flag1[2]=0;
            }
            if(ran==1)
            {
              money[2]+=50;
            }
            if(ran==2)
            {
              playerPosition[2]-=3;
              yy[2]+=(115*3);
            }
            if(ran==3)
            {
              money[2]-=15;
            }
            if(ran==4)
            {
              money[2]+=150;
            }
            time=millis()+5000;
            moveOrder[2]++;
            ctr++;
          }
          if(moveOrder[2]==1 &&mouseX>=980 && mouseX<=1110 && mouseY>=670 && mouseY<=730 && owned[playerPosition[2]]==0)
          {
            money[2]-=price[playerPosition[2]];
            owned[playerPosition[2]]=3;
            plotsOwned[2]++;
            moveOrder[2]++;
            ctaxCtr[2]=(int)random(0,9);
          }
          if(moveOrder[2]>=1 && mouseX>=1280 && mouseX<=1410 && mouseY>=670 && mouseY<=730)
          {
            moveOrder[2]=0;
            playerChance++;
          }
        }
        else if(jail[2]==1)
        {
          if(jailctr[2]==2)
          {
            jail[2]=0;
            jailctr[2]=0;
          }
          else
            jailctr[2]++;
          playerChance++;
        }
      }
    }
    else
    {
      playerChance++;
    }
  }
  if(playerChance==4)
  {
    if(money[3]>0)
    {
      drawCar(xx,yy[3],c[3]);
      if(mousePressed)
      {
        if(jail[3]==0)
        {
          if(moveOrder[3]==0 && mouseX>=1130 && mouseX<=1260 && mouseY>=870 && mouseY<=930)
          {
            int r=rolldice();
            yy1[3]-=(115*r);
            playerPosition[3]+=r;
            if(playerPosition[3]==21)
            {
              jail[3]=1;
              playerPosition[3]=7;
            }
            if(playerPosition[3]>27)
            {
              int temp=playerPosition[3]%28;
              playerPosition[3]=temp;
            }
            if(playerPosition[3]>=0&&playerPosition[3]<8)
            {
               flag1[3]=1;
               yy1[3]=900-(playerPosition[3])*115;
            }
            if(playerPosition[3]>7&&playerPosition[3]<15)
            {
               flag1[3]=2;
               yy1[3]=900-(playerPosition[3]-7)*115;
            }
            if(playerPosition[3]>14&&playerPosition[3]<22)
            {
               flag1[3]=3;
               yy1[3]=900-(playerPosition[3]-14)*115;
            }
            if(playerPosition[3]>21&&playerPosition[3]<28)
            {
               flag1[3]=4;
               yy1[3]=900-(playerPosition[3]-21)*115;
            }
            if(yy[3]<yy1[3])
            {
              for(int i=yy[3];i<=yy1[3];i++)
              {
                yy[3]=i;
                drawCar(xx,yy[3],c[3]);
              }
            }
            else
            {
              for(int i=yy[3];i>=yy1[3];i--)
              {
                yy[3]=i;
                drawCar(xx,yy[3],c[3]);            
              }
            }
            if(owned[playerPosition[3]]>0)
            {
              money[3]-=rent[playerPosition[3]];
              money[owned[playerPosition[3]]-1]+=rent[playerPosition[3]];
            }
            moveOrder[3]++;
          }
          if(moveOrder[3]==1 && mouseX>=180 && mouseX<=450 && mouseY>=190 && mouseY<=460 && ((playerPosition[3]==9) || (playerPosition[3]==26)))
          {
            ran=Chance_CC();
            if(ran==0)
            {
              playerPosition[3]=0;
              yy[3]=900;
              money[3]+=200;
              flag1[3]=1;
            }
            if(ran==1)
            {
              money[3]+=200;
            }
            if(ran==2)
            {
              money[3]-=50;
            }
            if(ran==3)
            {
              money[3]+=50;
            }
            if(ran==4)
            {
              playerPosition[3]=7;
              jail[3]=1;
              yy[3]=990-(115*7);
              flag1[3]=0;
            }
            time=millis()+5000;
            moveOrder[3]++;
            ctr1++;
          }
          if(moveOrder[3]==1 && mouseX>=500 && mouseX<=780 && mouseY>=510 && mouseY<=780 && ((playerPosition[3]==5) || (playerPosition[3]==19)))
          {
            ran=Chance_CC();   
            if(ran==0)
            {
              playerPosition[3]=0;
              yy[3]=900;
              money[3]+=200;
              flag1[3]=0;
            }
            if(ran==1)
            {
              money[3]+=50;
            }
            if(ran==2)
            {
              playerPosition[3]-=3;
              yy[3]+=(115*3);
            }
            if(ran==3)
            {
              money[3]-=15;
            }
            if(ran==4)
            {
              money[3]+=150;
            }
            time=millis()+5000;
            moveOrder[3]++;
            ctr++;
          }
          if(moveOrder[3]==1 &&mouseX>=980 && mouseX<=1110 && mouseY>=870 && mouseY<=930 && owned[playerPosition[3]]==0)
          {
            money[3]-=price[playerPosition[3]];
            owned[playerPosition[3]]=4;
            plotsOwned[3]++;
            ctaxCtr[3]=(int)random(0,9);
            moveOrder[3]++;
          }
          if(moveOrder[3]>=1 && mouseX>=1280 && mouseX<=1410 && mouseY>=870 && mouseY<=930)
          {
            moveOrder[3]=0;
            playerChance=1;
          }
        }
        else if(jail[3]==1)
        {
          if(jailctr[3]==2)
          {
            jail[3]=0;
            jailctr[3]=0;
          }
          else
            jailctr[3]++;
          playerChance=1;
        }
      }
    }
    else
    {
      playerChance=1;
    }
  }
  
  if(playerChance==1)
    flag=flag1[0];
  if(playerChance==2)
    flag=flag1[1];
  if(playerChance==3)
    flag=flag1[2];
  if(playerChance==4)
    flag=flag1[3];
  if (flag==1)
  {
    x=0;
    y=0;
    r=0;
  }
  if (flag==2)
  {
    x=0;
    y=960;
    r=270;
  }
  if (flag==4)
  {
    x=960;
    y=0;
    r=90;
  }
  if (flag==3)
  {
    x=960;
    y=960;
    r=180;
  }
  //Calling user interface
  userInterface();
  //save("img.jpeg");
  
  if(ctr==1)
  {
      fill(255,255,255);
      quad(150,370,810,370,810,590,150,590);
      fill(0,0,0);
      textAlign(CENTER);
      textSize(25);
      text(chance[ran],480,480); 
      if(millis()>time)
      {
        ctr=0;
      }
  }
  if(ctr1==1)
  {
      fill(255,255,255);
      quad(150,370,810,370,810,590,150,590);
      fill(0,0,0);
      textAlign(CENTER);
      textSize(25);
      text(CC[ran],480,480); 
      if(millis()>time)
      {
        ctr1=0;
      }
  }
}
int Chance_CC()
{
  
  int r=(int)random(0,5);
  return r;
}
int rolldice()
{
  int r= (int)random(0,8);
  return r;
}
void printPlayer(int arr)
{
    if(arr==1)
      fill(255,0,0);
    else if(arr==2)
      fill(0,255,0);
    else if(arr==3)
      fill(0,0,255);
    else if(arr==4)
      fill(255,255,0);
  
}
//Shyla- Car drawing function- call whenever a car needs to be drawn on screen, please see initialization to move the cars around
void drawCar(int x1,int y1,color c)
{
    int offset = theSize / 4;
    rectMode(CENTER);
    stroke(0);
    strokeWeight(1);
    pushMatrix();
    translate(0,840*2);
    rotate(radians(-90));
    // wheel
    fill(0);
    rect(x1 - offset, y1 - offset, offset / 2, offset);
    rect(x1 + offset, y1 - offset, offset / 2, offset);
    rect(x1 - offset, y1 + offset, offset / 2, offset);
    rect(x1 + offset, y1 + offset, offset / 2, offset);

    // body
    fill(c);
    rect(x1, y1, theSize / 2, theSize);

    //F1 Hood
    quad(x1 - theSize / 4, y1 - theSize / 2, x1 - theSize / 4 + theSize / 6, y1 - theSize / 2 - theSize / 2, x1 - theSize / 4 + theSize / 6 * 2, y1 - theSize / 2 - theSize / 2, x1 + theSize / 4, y1 - theSize / 2);

    //DriverSeat
    fill(0, 0, 0);
    rect(x1, y1, theSize / 5, theSize / 3);
    
    popMatrix();
}
//Shyla doing the user interface. Add variables and shit
void userInterface()
{
  //Background and setup
  fill(50, 25, 47);
  quad(960, 0, 1450, 0, 1450, 960, 960, 960);
  textSize(22);
  fill(255, 0, 0);
  text("GAME STATISTICS", 1205, 25);
  textSize(18);
  fill(0, 255, 0);
  text("Number of unowned plots: ", 1090, 55);
  int unOwned=20;
  for(int i=0;i<4;i++)
  {
    unOwned-=plotsOwned[i];
  }
    text(unOwned,1240, 55);
  text("Current player: ", 1040, 95);
  text(playerChance,1135,95);
  text("Player with the most plots: ", 1090, 140);
  int max=plotsOwned[0];
  int index=0;
  for(int i=1;i<4;i++)
  {
    if(max<plotsOwned[i])
    {
      max=plotsOwned[i];
      index=i;
    }
  }
  text(index+1, 1240, 140);


  //Player1
  textSize(22);
  fill(255, 0, 0);
  text("Player 1", 1205, 180);
  textSize(18);
  fill(0, 255, 0);
  text("Money: ", 1010, 210);
  text(money[0]+"k",1100,210);
  text("Carbon tons: ", 1190, 210);
  textSize(16);
  if(ctaxCtr[0]==0)
  {
    for(int i=0, j=0;i<ctax1.length;i++,j=j+20)
    {
      text(ctax1[i]+",",1250+j,210);
    }
  }
  else
  {
    for(int i=0, j=0;i<ctax1.length;i++,j=j+20)
    {
      if(ctaxCtr[0]!=i)
        text(ctax1[i]+",",1250+j,210);
    }
  }
  textSize(18);
  text("Number of plots owned: ", 1075, 250);
  text(plotsOwned[0],1175,250);
  fill(20, 150, 20);
  rectMode(CENTER);
  rect(1045, 310, 130, 60);
  fill(0);
  textSize(15);
  text("BUY LOCATION", 1045, 315);
  fill(255, 20, 20);
  rect(1195, 310, 130, 60);
  fill(0);
  text("ROLL DICE", 1195, 315);
  fill(0,255,255);
  rect(1345, 310, 130, 60);
  fill(0);
  text("END TURN", 1345, 315);

  //Player2
  textSize(22);
  fill(255, 0, 0);
  text("Player 2", 1205, 380);
  textSize(18);
  fill(0, 255, 0);
  text("Money: ", 1010, 410);
  text(money[1]+"k",1100,410);
  text("Carbon tons: ", 1190, 410);
  textSize(16);
  if(ctaxCtr[1]==0)
  {
    for(int i=0, j=0;i<ctax1.length;i++,j=j+20)
    {
      text(ctax2[i]+",",1250+j,410);
    }
  }
  else
  {
    for(int i=0, j=0;i<ctax1.length;i++,j=j+20)
    {
      if(ctaxCtr[1]!=i)
        text(ctax2[i]+",",1250+j,410);
    }
  }
  textSize(18);
  text("Number of plots owned: ", 1075, 450);
  text(plotsOwned[1],1175,450);
  fill(20, 150, 20);
  rectMode(CENTER);
  rect(1045, 500, 130, 60);
  fill(0);
  textSize(15);
  text("BUY LOCATION", 1045, 505);
  fill(255, 20, 20);
  rect(1195, 500, 130, 60);
  fill(0);
  text("ROLL DICE", 1195, 505);
  fill(0,255,255);
  rect(1345, 500, 130, 60);
  fill(0);
  text("END TURN", 1345, 505);

  //Player3
  textSize(22);
  fill(255, 0, 0);
  text("Player 3", 1205, 580);
  textSize(18);
  fill(0, 255, 0);
  text("Money: ", 1010, 610);
  text(money[2]+"k",1100,610);
  text("Carbon tons: ", 1190, 610);
  textSize(16);
  if(ctaxCtr[2]==0)
  {
    for(int i=0, j=0;i<ctax1.length;i++,j=j+20)
    {
      text(ctax3[i]+",",1250+j,610);
    }
  }
  else
  {
    for(int i=0, j=0;i<ctax1.length;i++,j=j+20)
    {
      if(ctaxCtr[2]!=i)
        text(ctax3[i]+",",1250+j,610);
    }
  }
  textSize(18);
  text("Number of plots owned: ", 1075, 650);
  text(plotsOwned[2],1175,650);
  fill(20, 150, 20);
  rectMode(CENTER);
  rect(1045, 700, 130, 60);
  fill(0);
  textSize(15);
  text("BUY LOCATION", 1045, 705);
  fill(255, 20, 20);
  rect(1195, 700, 130, 60);
  fill(0);
  text("ROLL DICE", 1195, 705);
  fill(0,255,255);
  rect(1345, 700, 130, 60);
  fill(0);
  text("END TURN", 1345, 705);

  //Player4
  textSize(22);
  fill(255, 0, 0);
  text("Player 4", 1205, 780);
  textSize(18);
  fill(0, 255, 0);
  text("Money: ", 1010, 810);
  text(money[3]+"k",1100,810);
  text("Carbon tons: ", 1190, 810);
  textSize(16);
  if(ctaxCtr[3]==0)
  {
    for(int i=0, j=0;i<ctax1.length;i++,j=j+20)
    {
      text(ctax4[i]+",",1250+j,810);
    }
  }
  else
  {
    for(int i=0, j=0;i<ctax1.length;i++,j=j+20)
    {
      if(ctaxCtr[3]!=i)
        text(ctax4[i]+",",1250+j,810);
    }
  }
  textSize(18);
  text("Number of plots owned: ", 1075, 850);
  text(plotsOwned[3],1175,850);
  fill(20, 150, 20);
  rectMode(CENTER);
  rect(1045, 900, 130, 60);
  fill(0);
  textSize(15);
  text("BUY LOCATION", 1045, 905);
  fill(255, 20, 20);
  rect(1195, 900, 130, 60);
  fill(0);
  text("ROLL DICE", 1195, 905);
  fill(0,255,255);
  rect(1345, 900, 130, 60);
  fill(0);
  text("END TURN", 1345, 905);
}
