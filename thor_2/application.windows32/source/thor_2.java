import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class thor_2 extends PApplet {

public void setup()
{
  
  background(254,242,220);
}
public void draw() 
{
  background(254,242,220);
  fill(0,0,0);  
  noStroke();//quad1
  fill(0,0,0);  
  beginShape();
  vertex(230,280);
  vertex(320,280);
  vertex(355,241);
  vertex(318,175);
  vertex(210,236);
  endShape();
  
  
  fill(229,74,42);
  beginShape();//red hammer
  vertex(237,260);
  vertex(287,231);
  vertex(278,212);
  vertex(281,205);
  vertex(302,193);
  vertex(312,193);
  vertex(320,204);
  vertex(323,203);
  vertex(337,227);
  vertex(335,230);
  vertex(340,238);
  vertex(339,246);
  vertex(312,263);
  vertex(303,261);
  vertex(293,243);
  vertex(242,269);
  endShape();
  stroke(229,74,42);
  strokeWeight(2);
  line(239,263,233,271);
  line(233,271,231,278);
  line(241,269,240,272);
  line(240,272,235,279);
  noStroke();
  
  
  fill(254,242,220);
  beginShape();//hand
  vertex(217,250);
  vertex(252,240);
  vertex(266,245);
  vertex(262,251);
  vertex(267,254);
  vertex(264,254);
  vertex(256,249);
  vertex(238,261);
  vertex(238,263);
  vertex(226,270);
  vertex(215,250);
  endShape();
  
  //fingers in block 1
  
  pushMatrix();//1st finger from the left
  translate(248,262); 
  rotate(radians(-25));
  fill(254,242,220);  
  rect(0,0,4,6); 
  popMatrix();
  
  pushMatrix();//2nd finger from the left
  translate(253,261); 
  rotate(radians(-25));
  fill(254,242,220);  
  rect(0,0,4,6); 
  popMatrix();
  
  pushMatrix();//3rd finger from the left
  translate(257,258); 
  rotate(radians(-25));
  fill(254,242,220);  
  rect(0,0,4,6); 
  popMatrix();
  
  beginShape();//last finger
  vertex(261,255);
  vertex(264,255);
  vertex(267,258);
  vertex(263,260);  
  endShape(); 
  
  //quad 2
  fill(0,0,0);
  quad(324,284,390,212,390,263,374,283);  
  strokeWeight(1);
  stroke(229,74,38);
  line(336,280,342,273);
  line(338,269,348,280);
  line(348,280,353,274);
  line(353,274,354,265);
  line(354,265,360,264);
  line(360,264,369,253);
  line(352,255,369,271);
  line(369,253,372,257);
  line(372,257,378,253);
  line(378,253,375,265);
  line(375,265,389,263);
  line(369,271,359,276);
  line(388,229,378,239); 
  line(378,239,384,240);
  line(384,240,368,243);
  line(377,249,368,243);
  line(377,249,378,250);
  
  
  //quad 3
  noStroke();
  fill(229,74,38);
  beginShape();
  vertex(226,281);
  vertex(178,175);
  vertex(141,221);
  vertex(142,237);
  vertex(144,240);
  vertex(147,263);
  vertex(163,281);
  endShape();
  
  fill(255,255,255);//Face(white part)
  beginShape();
  vertex(214,282);
  vertex(205,270);
  vertex(193,253);
  vertex(192,249);
  vertex(190,240);
  vertex(194,237);
  vertex(198,234);
  vertex(197,231);
  vertex(194,230);
  vertex(194,227);
  vertex(194,224);
  vertex(192,223);
  vertex(191,221);
  vertex(192,218);
  vertex(189,215);
  //vertex(186,215);
  vertex(184,214);
  vertex(182,212);
  vertex(180,209);
  vertex(176,206);
  vertex(165,205);
  vertex(158,211);
  vertex(152,215);
  vertex(169,252);
  vertex(162,284);
  endShape();
  
  fill(0,0,0);//hair of person in quad3
  beginShape();  
  vertex(155,270);
  curveVertex(152,273);
  curveVertex(158,263);
  curveVertex(162,258);
  curveVertex(163,251);
  curveVertex(160,242);
  curveVertex(158,239);
  curveVertex(155,234);
  curveVertex(151,231);
  vertex(148,227);
  vertex(150,219);
  vertex(153,213);
  vertex(157,209);
  vertex(160,207);
  vertex(162,206);
  vertex(165,204);
  vertex(170,203);
  vertex(173,203);
  vertex(174,205);
  vertex(165,206);
  vertex(158,212);
  vertex(160,214);
  vertex(172,213);
  vertex(173,218);
  vertex(163,220);
  vertex(160,225);
  vertex(160,229);
  vertex(164,231);
  vertex(168,231);
  vertex(169,234);
  vertex(172,237);
  vertex(175,237);
  vertex(179,235);
  vertex(181,229);
  vertex(184,228);
  vertex(183,238);
  vertex(182,240);
  vertex(175,243);
  vertex(171,245);
  vertex(170,247);
  vertex(169,250);
  vertex(170,253);
  vertex(172,256);
  vertex(172,259);
  vertex(169,261);
  vertex(172,263);
  vertex(174,264);
  vertex(175,267);
  vertex(178,267);
  vertex(172,273);
  vertex(170,278);
  vertex(165,280);
  vertex(162,280);
  endShape();
  
  //eye
  strokeWeight(3);
  stroke(0);
  point(179,215);
  
  //accents
  strokeWeight(0.5f);
  stroke(0);
  line(159,212,165,207);
  line(165,207,172,206);
  line(161,223,166,220);
  line(166,220,172,220);
  line(161,226,167,222);
  line(167,222,171,222);
  line(169,249,176,250);
  line(176,250,184,253);
  line(169,251,176,252);
  line(176,252,184,255);
  line(169,253,176,254);
  line(176,254,184,257);
  strokeWeight(1);
  line(173,282,172,274);
  line(172,274,179,269);
  line(175,282,174,274);
  line(174,274,181,269);
  noStroke();
  
  //quad4
  fill(229,74,42);
  quad(142,213,138,166,160,137,202,135);
  fill(255,255,255);//white_face
  beginShape();
  vertex(154,161);
  vertex(154,164);
  vertex(147,167);
  vertex(148,169);
  vertex(147,171);
  vertex(146,173);
  vertex(146,175);
  vertex(144,176);
  vertex(144,178);
  vertex(146,181);
  vertex(153,171);
  vertex(158,172);
  vertex(163,171);
  vertex(165,164);
  vertex(159,161);
  vertex(157,160);
  endShape();
  fill(0,0,0);
  beginShape();//Helmet
  vertex(142,213);
  vertex(184,158);
  vertex(175,154);
  vertex(175,147);
  vertex(176,143);
  vertex(178,140);
  vertex(180,137);
  vertex(173,136);
  vertex(167,145);
  vertex(168,137);
  vertex(164,137);
  vertex(161,143);
  vertex(159,154);
  vertex(152,160);
  vertex(161,163);
  vertex(162,165);
  vertex(162,169);
  vertex(159,171);
  vertex(153,171);
  vertex(147,181);
  vertex(149,184);
  vertex(140,190);
  endShape();
  
  //Accents
  stroke(0,0,0);
  curve(187,119,189,137,186,146,162,148);
  quad(190,136,196,136,198,138,195,142);
  
  //quad5
  noStroke();
  fill(229,74,42);
  beginShape();
  vertex(209,231);
  vertex(317,170);
  vertex(294,126);
  vertex(215,127);
  vertex(215,132);
  vertex(209,132);  
  vertex(182,168);
  endShape();
  
  fill(255,255,255);//Face
  beginShape();
  vertex(210,181);
  vertex(212,193);
  vertex(216,190);
  vertex(218,197);
  vertex(221,196);
  vertex(225,205);
  vertex(239,192);
  vertex(223,170);
  endShape();
  
  stroke(229,74,42);//eye
  strokeWeight(3);
  fill(229,74,42);
  point(213,177);
  noStroke();
  
  fill(0,0,0);//Helmet
  beginShape();
  smooth();
  vertex(241,212);
  vertex(317,170);
  vertex(312,161);
  vertex(296,159);
  vertex(295,146);
  curveVertex(294,159);
  curveVertex(295,147);
  curveVertex(289,159);
  curveVertex(290,151);
  curveVertex(290,144);
  curveVertex(288,138);
  curveVertex(286,134);
  curveVertex(286,141);
  curveVertex(286,148);
  curveVertex(283,152);
  curveVertex(278,156);
  curveVertex(272,158);
  curveVertex(265,158);
  curveVertex(260,157);
  curveVertex(257,155);
  curveVertex(253,152);
  curveVertex(250,150);
  curveVertex(249,147);
  curveVertex(243,143);
  curveVertex(235,145);
  curveVertex(239,142);
  vertex(229,147);
  vertex(219,147);
  vertex(214,147);
  vertex(209,151);
  vertex(206,154);
  vertex(203,157);
  vertex(201,162);
  curveVertex(200,168);
  curveVertex(200,172);
  curveVertex(201,176);
  curveVertex(201,179);
  curveVertex(203,182);
  vertex(204,185);
  vertex(217,175);
  vertex(217,181);
  vertex(221,180);
  vertex(221,188);
  vertex(224,187);
  vertex(226,205);
  vertex(237,197);
  vertex(241,199);
  vertex(243,202);
  vertex(243,206);
  vertex(242,212);
  endShape();
  //top of the helmet
  quad(228,150,237,142,236,138,223,149);
  quad(203,149,204,156,232,128,226,128);
  quad(214,148,236,128,239,132,219,151);
  
  //quad_6
  fill(229,74,42);//background1
  beginShape();
  vertex(299,126);
  vertex(328,126);
  vertex(329,130);
  vertex(361,130);
  vertex(361,127);
  vertex(374,127);
  vertex(375,130);
  vertex(378,130);
  vertex(391,145);
  vertex(391,202);
  vertex(358,234);
  endShape();
  
  fill(0,0,0);//background2
  quad(358,234,319,163,391,187,391,202);
  
  fill(255,255,255);//hammer
  quad(365,163,368,164,361,186,357,186);
  beginShape();
  vertex(349,182);
  vertex(351,181);
  vertex(366,187);
  vertex(367,190);
  vertex(364,198);
  vertex(362,199);
  vertex(359,197);
  vertex(358,199);
  vertex(350,196);
  vertex(350,194);
  vertex(347,193);
  vertex(345,191);
  endShape();
  
  //1st person in block 6
  fill(0,0,0);
  beginShape();
  vertex(303,126);
  vertex(328,126);
  vertex(329,130);
  vertex(325,134);
  vertex(317,160);
  vertex(312,150);
  vertex(314,137);
  vertex(309,145);
  vertex(301,131);
  endShape();
  
  //2nd person in block 6
  beginShape();
  vertex(330,168);
  vertex(334,157);
  vertex(333,155);
  vertex(333,152);
  vertex(333,149);
  vertex(339,137);
  vertex(343,136);
  vertex(345,132);
  vertex(349,132);
  vertex(348,136);
  vertex(347,137);
  vertex(350,138);
  vertex(349,150);
  vertex(348,153);
  vertex(348,156);
  vertex(347,160);
  vertex(345,157);
  vertex(344,155);
  vertex(343,158);
  vertex(340,171);
  vertex(337,170);
  vertex(338,157);
  vertex(334,168);
  endShape();
  
  //arm in block 6
  beginShape();
  vertex(374,127);
  vertex(361,127);
  vertex(361,130);
  vertex(364,146);
  vertex(361,149);
  vertex(360,153);
  vertex(361,157);
  vertex(362,157);
  vertex(363,154);
  vertex(365,152);
  vertex(367,153);
  vertex(368,156);
  vertex(369,158);
  vertex(371,161);
  vertex(372,162);
  vertex(371,159);
  vertex(372,155);
  vertex(374,156);
  vertex(375,159);
  vertex(376,161);
  vertex(376,157);
  vertex(375,153);
  vertex(377,154);
  vertex(378,157);
  vertex(380,157);
  vertex(379,154);
  vertex(377,151);
  vertex(379,151);
  vertex(381,152);
  vertex(379,148);
  vertex(376,146);
  vertex(372,145);
  vertex(374,130);
  vertex(374,127);
  endShape();
  
  //3rd person in block 6
  beginShape();
  vertex(382,184);
  vertex(382,179);
  vertex(382,174);
  vertex(383,177);
  vertex(384,175);
  vertex(385,171);
  vertex(385,169);
  vertex(384,167);
  vertex(384,165);
  vertex(383,163);
  vertex(381,166);
  vertex(379,166);
  vertex(375,172);
  vertex(375,174);
  vertex(378,171);
  vertex(378,174);
  vertex(372,182);
  vertex(376,183);
  vertex(378,177);
  vertex(379,184);
  endShape();
  
  //4th person in block 6
  beginShape();
  vertex(388,175); 
  vertex(390,175);
  vertex(390,178);
  vertex(390,181);
  vertex(389,183);
  vertex(388,187);
  vertex(384,186);
  vertex(386,182);
  vertex(386,180);
  vertex(387,177);
  endShape();
  
  //Handle_1
  fill(244,67,38);
  quad(249,329,249,285,299,285,299,336);
  
  fill(0,0,0);//Helmet
  beginShape();
  vertex(272,332);
  vertex(270,314);
  vertex(261,308);
  vertex(265,298);
  vertex(272,298);
  vertex(273,301);
  vertex(279,301);
  vertex(280,298);
  vertex(285,298);
  vertex(290,304);
  vertex(284,313);
  vertex(287,334);
  vertex(294,323);
  vertex(296,311);
  vertex(297,297);
  vertex(297,283);
  vertex(292,283);
  vertex(291,292);
  vertex(288,285);
  vertex(261,285);
  vertex(259,294);
  vertex(256,290);
  vertex(256,286);
  vertex(254,284);
  vertex(251,285);
  vertex(252,300);
  vertex(262,325);
  vertex(272,332);
  endShape();
  
  //accents
  triangle(256,329,260,324,267,331);
  quad(289,334,294,324,298,325,299,336);
  stroke(0,0,0);
  strokeWeight(2.5f);
  line(280,307,285,305);
  stroke(255,255,255);
  line(278,303,284,301);
  noStroke();
  fill(255,255,255);
  quad(261,308,272,310,273,304,265,301);
  quad(299,325,294,323,296,312,299,315);
  
  beginShape();//moustache
  vertex(271,321);
  vertex(275,316);
  vertex(276,318);
  vertex(279,318);
  vertex(280,316);
  vertex(285,318);
  vertex(285,318);
  vertex(286,324);
  vertex(278,321);
  vertex(272,326);
  endShape();
  
  beginShape();//beard
  vertex(273,329);
  vertex(278,326);
  vertex(286,328);
  vertex(287,334);
  vertex(273,332);
  endShape();
  
  beginShape();
  vertex(249,326);
  vertex(249,330);
  vertex(255,329);
  vertex(261,325);
  vertex(256,313);
  vertex(254,320);
  endShape();
  
  //Handle_2
  fill(244,67,38);
  beginShape();
  vertex(250,402);
  vertex(296,389);
  vertex(295,341);
  vertex(246,335);
  vertex(247,366);
  vertex(249,367);
  endShape();
  
  fill(0,0,0);//Top part
  beginShape();
  vertex(253,342);
  vertex(255,341);
  vertex(261,342);
  vertex(259,339);
  vertex(287,346);
  vertex(294,348);
  vertex(293,350);
  vertex(284,350);
  endShape();
  
  for(float i=0;i<=18;i=i+5.4f)
  {
    quad(260,346+i,265,346+i,265,350+i,261,350+i);
  }
  for(float j=0,k=0;j<=18;j=j+5.4f,k=k+2)
  {
    quad(266,347+j,285+k-1,350+j,287+k,355+j,266,351+j);
  }
  quad(258,366,264,368,264,373,254,370);
  quad(265,368,284,371,284,377,265,373);
  
  quad(251,374,253,371,262,374,259,376);
  quad(265,374,286,379,289,384,260,377);
  
  quad(250,375,256,377,253,381,250,380);
  beginShape();
  vertex(255,381);
  vertex(258,378);
  vertex(289,385);
  vertex(293,389);
  vertex(289,391);
  endShape();
  
  triangle(250,387,252,382,249,381);
  quad(252,387,254,383,285,391,277,394);
  
  quad(250,389,274,395,264,398,250,394);
  triangle(251,402,251,396,260,399);
  
  fill(255,255,255);//eye
  triangle(271,348,275,352,283,350);
  
  //Handle_3
  fill(244,67,38);
  beginShape();//background
  vertex(254,457);
  vertex(253,406);
  vertex(299,394);
  vertex(300,425);
  vertex(302,425);
  vertex(302,470);
  endShape();

  fill(255,255,255);//shirt
  beginShape();
  vertex(269,436);
  vertex(279,437);
  vertex(286,430);
  vertex(298,469);
  vertex(279,464);
  endShape();
  
  fill(0,0,0);//suit
  quad(254,457,254,451,271,440,279,464);
  quad(302,470,299,469,288,434,302,434);
  beginShape();//tie
  vertex(279,441);
  vertex(280,439);
  vertex(283,439);
  vertex(284,443);
  vertex(296,468);
  vertex(285,466);
  vertex(282,445);
  endShape();
  
  beginShape();//sunglasses
  vertex(262,419);
  vertex(269,414);
  vertex(272,416);
  vertex(272,421);
  vertex(269,424);
  vertex(265,424);
  endShape();
  beginShape();
  vertex(274,415);
  vertex(276,412);
  vertex(282,411);
  vertex(285,414);
  vertex(284,418);
  vertex(279,420);
  endShape();
  stroke(0,0,0);
  strokeWeight(1);
  line(269,414,272,412);
  line(272,412,275,413);
  line(272,416,274,415);
  noStroke();
  
  beginShape();//hair
  vertex(288,413);
  vertex(286,413);
  vertex(282,405);
  vertex(269,406);
  vertex(260,415);
  vertex(262,425);
  vertex(260,423);
  vertex(257,416);
  vertex(258,414);
  vertex(254,409);
  vertex(255,406);
  vertex(276,399);
  vertex(279,399);
  vertex(282,400);
  vertex(284,402);
  endShape();
  
  //handle_4
  fill(0,0,0);
  quad(253,523,252,462,300,475,301,519);
  fill(255,255,255);
  quad(277,516,270,505,284,499,290,510);
  quad(279,521,279,519,292,512,296,519);
  stroke(0,0,0);
  strokeWeight(2);
  line(282,502,276,505);
  line(276,505,277,508);
  line(277,508,285,506);
  line(285,506,285,508);
  line(285,508,279,512);
  line(282,521,282,519);
  line(282,519,285,518);
  line(285,518,286,520);
  line(286,520,288,520);
  line(287,520,289,517);
  line(289,517,292,516);
  line(292,516,294,519);
  noStroke();
  
  fill(244,67,38);
  beginShape();
  vertex(269,492);
  vertex(267,512);
  vertex(264,511);
  vertex(265,489);
  vertex(252,505);
  vertex(252,499);
  vertex(259,490);
  vertex(253,492);
  vertex(252,488);
  vertex(261,484);
  vertex(252,473);
  vertex(264,478);
  vertex(265,465);
  vertex(269,467);
  vertex(270,476);
  vertex(276,470);
  vertex(279,470);
  vertex(277,474);
  vertex(283,472);
  vertex(290,473);
  vertex(272,482);
  vertex(290,486);
  vertex(291,488);
  vertex(275,487);
  vertex(284,493);
  vertex(282,495);
  vertex(274,490);
  vertex(277,501);
  vertex(275,501);
  vertex(271,493);
  endShape();
  
  //Thor
  fill(0,0,0);//letter_O
  quad(258,555,257,530,305,525,306,553);
  beginShape();
  vertex(276,554);
  vertex(277,570);
  vertex(261,611);
  vertex(257,650);
  vertex(259,653);
  vertex(281,662);
  vertex(297,661);
  vertex(306,647);
  vertex(304,622);
  vertex(296,592);
  vertex(290,574);
  vertex(289,553);
  endShape();
  fill(254,242,220);
  beginShape();
  vertex(281,596);
  vertex(276,599);
  vertex(267,620);
  vertex(266,647);
  vertex(276,652);
  vertex(290,652);
  vertex(295,649);
  vertex(297,643);
  vertex(296,622);
  vertex(293,606);
  vertex(288,597);
  endShape();
  
  //letter_T
  fill(0,0,0);
  quad(156,602,156,594,233,590,233,598);
  quad(184,599,184,662,191,662,191,599);
  
  //letter_H
  quad(203,607,214,607,214,662,203,661);
  quad(213,630,213,638,240,638,240,630);
  quad(239,669,239,591,250,590,248,669);
  
  //letter_R
  quad(316,674,317,592,325,592,325,673);
  beginShape();
  vertex(324,592);
  vertex(330,592);
  vertex(340,592);
  vertex(351,599);
  vertex(354,609);
  vertex(352,616);
  vertex(341,620);
  vertex(332,621);
  vertex(324,621);
  endShape();
  fill(254,242,220);
  beginShape();
  vertex(325,597);
  vertex(338,597);
  vertex(345,602);
  vertex(347,606);
  vertex(346,611);
  vertex(340,614);
  vertex(325,614);
  endShape();
  fill(0,0,0);
  quad(333,620,341,620,353,636,345,640);
  quad(345,639,353,635,360,657,351,659);
  
  //text
  textSize(10);
  text("Lorem ipsum dolor sit amet,consectetur",175,717);
  text("adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna",87,727);
  text("aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut",74,737);
  text("aliquip ex ea commodo consequat. Duis aute irure",140,747);
  text("dolor in reprehenderit velit",203,757);
  
  textSize(9);
  text("Whosoever holds this hammer,",205,62);
  text("if he be worthy, shall possess the power of Thor",170,73);
  save("Srinivas.jpeg");
}
  public void settings() {  size(535,802); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "thor_2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
