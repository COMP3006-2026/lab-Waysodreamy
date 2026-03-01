
void setup() {
  size(400, 400);
  smooth();
  background(255);
  smooth();
  ellipseMode(CENTER);
  rectMode(CENTER);
}

void draw() {
  //drawHuman(x, y, width, heigt)
  drawHuman(120, 180, 60, 180);   // small
  drawHuman(300, 200, 90, 220);   // medium
}


void drawHuman(float x, float y, float w, float h) {
  // Body height & head diameter ratio
  float headDiam = 0.30 * h;            // ~30% of total height
  float bodyH    = 0.5 * h;            // ~50% of total height
  float bodyW    = max(0.2 * w, 6);   // ~20% of total width (min clamp)

  // Limb lengths
  float armLen   = 0.3 * h;
  float legLen   = 0.35 * h;

  // Line weights (scale with size for consistency)
  float SW    = max(2, 0.01 * (w + h));

  //Centered Point (Body & Head)
  float bodyCX = x;
  float bodyCY = y + (h/2 - bodyH/2);    // body centered in lower area
  float headCX = x;
  float headCY = bodyCY - (bodyH/2 + headDiam/2);

  // --- Body ---
  stroke(0);
  strokeWeight(SW);
  fill(150);
  rect(bodyCX, bodyCY, bodyW, bodyH, bodyW * 0.2); // rounded body

  // --- Head ---
  strokeWeight(SW);
  fill(255);
  ellipse(headCX, headCY, headDiam, headDiam);

  // --- Eyes ---
  float eyeW = 0.3 * headDiam;
  float eyeH = 1.5 * eyeW;       
  float eyeDX = 0.3 * headDiam;  // distance from center
  float eyeY  = headCY;          // aligned vertically

  fill(255, 0, 0);
  noStroke();
  ellipse(headCX - eyeDX, eyeY, eyeW, eyeH); // left eye
  ellipse(headCX + eyeDX, eyeY, eyeW, eyeH); // right eye

  // --- Hair (Bezier) ---
  stroke(0);
  strokeWeight(SW);
  fill(255, 255, 0);
  // Approximate the old hair curve relative to head
  float topY = headCY - headDiam/40;
  bezier(
    headCX - 0.40*headDiam, topY - 0.33*headDiam,     // p0
    headCX - 0.30*headDiam, topY - 0.67*headDiam,     // p1
    headCX + 0.30*headDiam, topY - 0.67*headDiam,     // p2
    headCX + 0.40*headDiam, topY - 0.33*headDiam      // p3
  );

  // --- Mouth (Bezier smile) ---
  stroke(0);
  strokeWeight(SW);
  noFill();
  float mouthY = headCY + 0.33*headDiam;
  bezier(
    headCX - 0.28*headDiam, mouthY,
    headCX - 0.15*headDiam, mouthY + 0.08*headDiam,
    headCX + 0.15*headDiam, mouthY + 0.08*headDiam,
    headCX + 0.28*headDiam, mouthY
  );

  // --- Limbs ---
  stroke(0);
  strokeWeight(SW);

  // Shoulder anchor points
  float shoulderY = bodyCY - bodyH/4;
  float shoulderDX = bodyW/2;

  // Arms: one up-left, one down-right
  line(bodyCX - shoulderDX, shoulderY, bodyCX - shoulderDX - 0.60*w, shoulderY - armLen); // left arm
  line(bodyCX + shoulderDX, shoulderY, bodyCX + shoulderDX + 0.25*w, shoulderY + armLen); // right arm

  // Legs anchors
  float hipY = bodyCY + bodyH/2;
  float ankleY = hipY + legLen;

  // Legs (slightly apart)
  float footDX = 0.03 * w;
  line(bodyCX - bodyW*0.20, hipY, bodyCX - bodyW*0.25, ankleY); // left leg
  line(bodyCX + bodyW*0.20, hipY, bodyCX + bodyW*0.25, ankleY); // right leg

  // Feet (short horizontal lines)
  line(bodyCX - bodyW*0.25 - footDX, ankleY, bodyCX - bodyW*0.25 + footDX, ankleY);
  line(bodyCX + bodyW*0.25 - footDX, ankleY, bodyCX + bodyW*0.25 + footDX, ankleY);
}
