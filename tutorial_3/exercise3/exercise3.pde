size(400,400);

//--------------------------------------------EXERCISE 3
////Draw Yin-Yang (outline :3)
circle(width/2,height/2,width/2);
beginShape();
vertex(width/4,height/2);
bezierVertex(width/2,height-(height/4),width/2,height/4,(width/4)*3,height/2);
endShape();
circle(width/2 - width/10,height/2 - height/14, 50);
circle(width/2 + width/10,height/2 + height/14, 50);
