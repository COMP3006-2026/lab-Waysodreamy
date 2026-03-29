// Tutorial 6 – Exercise 6
// Extended three-line text editor
// Features: font size control, strikethrough toggle,
// responsive spacing, stable UI font sizes

PFont font;

//Text editor state
String[] lines = { "", "", "" };
int curLine = 0;

// Font sizes
float fontSize = 18;          // editor text size (dynamic)
final float uiFontSize = 12;  // UI text size (fixed)

// Layout
float margin;
float lineGap;

// Caret blink
int blink = 0;

// Strikethrough
boolean strike = false;

// Button layout
int btnY = 8;
int btnW = 36;
int btnH = 24;

void setup() {
  size(700, 200);
  font = createFont("SansSerif", 18);
  textFont(font);
}

void draw() {
  background(252);

  // layout 
  margin = width * 0.03;
  lineGap = fontSize * 1.6;

  // UI Buttons (fixed font size)
  textSize(uiFontSize);
  textAlign(CENTER, CENTER);
  stroke(0);

  // A- button
  fill(230);
  rect(10, btnY, btnW, btnH);
  fill(0);
  text("A-", 10 + btnW/2, btnY + btnH/2);

  // A+ button
  fill(230);
  rect(52, btnY, btnW, btnH);
  fill(0);
  text("A+", 52 + btnW/2, btnY + btnH/2);

  // Strikethrough toggle
  fill(strike ? 200 : 230);
  rect(94, btnY, btnW, btnH);
  fill(0);
  text("S", 94 + btnW/2, btnY + btnH/2);

  noStroke();
  textAlign(LEFT, BASELINE);

  // Editor Text 
  textSize(fontSize);
  fill(0);

  float startY = height * 0.3;
  float y = startY;

  for (int i = 0; i < 3; i++) {
    text(lines[i], margin, y);

    // Strikethrough (editor text only)
    if (strike && lines[i].length() > 0) {
      float w = textWidth(lines[i]);
      float strikeY = y - fontSize * 0.3;
      stroke(0);
      line(margin, strikeY, margin + w, strikeY);
      noStroke();
    }

    y += lineGap;
  }

  // Caret 
  float caretX = margin + textWidth(lines[curLine]);
  float caretY = startY + curLine * lineGap;

  blink = (blink + 1) % 60;
  if (blink < 30) {
    stroke(0);
    line(caretX, caretY - fontSize, caretX, caretY + 4);
    noStroke();
  }

  // Bottom Note
  textSize(uiFontSize);
  fill(90);
  textAlign(LEFT, BOTTOM);
  text(
    "ENTER = next line (exits on 3rd) • BACKSPACE = delete • Buttons control style",
    margin,
    height - margin
  );
}

// Handle printable characters
void keyTyped() {
  if (key < 32 || key == 127) return;

  String attempt = lines[curLine] + key;

  if (margin + textWidth(attempt) <= width - margin) {
    lines[curLine] = attempt;
  } else if (curLine < 2) {
    curLine++;
    if (margin + textWidth("" + key) <= width - margin) {
      lines[curLine] += key;
    }
  }
}

// Handle control keys
void keyPressed() {

  // ENTER / RETURN
  if (key == ENTER || key == RETURN) {
    if (curLine == 2) {
      exit();
    } else {
      curLine++;
    }
  }

  // BACKSPACE
  else if (key == BACKSPACE) {
    if (lines[curLine].length() > 0) {
      lines[curLine] =
        lines[curLine].substring(0, lines[curLine].length() - 1);
    } else if (curLine > 0) {
      curLine--;
    }
  }
}

// Mouse buttons for UI
void mousePressed() {

  // A- button
  if (mouseX >= 10 && mouseX <= 46 &&
      mouseY >= btnY && mouseY <= btnY + btnH) {
    fontSize = max(12, fontSize - 2);
  }

  // A+ button
  else if (mouseX >= 52 && mouseX <= 88 &&
           mouseY >= btnY && mouseY <= btnY + btnH) {
    fontSize = min(36, fontSize + 2);
  }

  // Strikethrough toggle
  else if (mouseX >= 94 && mouseX <= 130 &&
           mouseY >= btnY && mouseY <= btnY + btnH) {
    strike = !strike;
  }
}
