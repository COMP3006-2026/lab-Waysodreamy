// Exercise 4 (Simplified): Three-line text editor
// Exits the sketch if ENTER is pressed on the 3rd line (line index 2)

PFont font;
String[] lines = { "", "", "" };   // three lines total
int curLine = 0;                   // current line (0,1,2)
float margin = 16;
float lineGap = 28;
int blink = 0;

void setup() {
  size(700, 200);
  font = createFont("SansSerif", 18);
  textFont(font);
  textSize(18);
}

void draw() {
  background(252);

  // Draw typed lines
  fill(0);
  float y = 40;
  for (int i = 0; i < 3; i++) {
    text(lines[i], margin, y);
    y += lineGap;
  }

  // Caret position
  float caretX = margin + textWidth(lines[curLine]);
  float caretY = 40 + curLine * lineGap;

  // Blink caret
  blink = (blink + 1) % 60;
  if (blink < 30) {
    stroke(0);
    line(caretX, caretY - 16, caretX, caretY + 4);
  }

  fill(90);
  noStroke();
  text("ENTER = next line (exits on 3rd) • BACKSPACE = delete • Auto-wrap", margin, height - 14);
}

// Printable characters go here
void keyTyped() {
  // Only process normal characters
  if (key < 32 || key == 127) return;

  // Try adding to current line
  String attempt = lines[curLine] + key;

  // Auto-wrap if needed
  if (margin + textWidth(attempt) <= width - margin) {
    lines[curLine] = attempt;
  } else {
    if (curLine < 2) {
      curLine++;
      // Add character on new line if it fits
      if (margin + textWidth("" + key) <= width - margin) {
        lines[curLine] += key;
      }
    }
  }
}

void keyPressed() {
  // ENTER / RETURN
  if (key == ENTER || key == RETURN) {
    // If on the 3rd line, exit immediately
    if (curLine == 2) {
      exit();   // <-- EXIT THE PROGRAM
    }

    // Otherwise go to the next line
    if (curLine < 2) {
      curLine++;
    }
  }

  // BACKSPACE
  else if (key == BACKSPACE) {
    if (lines[curLine].length() > 0) {
      // Delete last character
      lines[curLine] = lines[curLine].substring(0, lines[curLine].length() - 1);
    } 
    else if (curLine > 0) {
      // Go back to the previous line
      curLine--;
    }
  }
}
