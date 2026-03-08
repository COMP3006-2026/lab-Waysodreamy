PrintWriter output;
PFont font;

String buffer = "";     
boolean hasDot = false; 

void setup() {
  size(400, 400);
  fill(0);
  font = createFont("Arial",20);
  textFont(font);
  output = createWriter("words.txt");
}

void draw() {
  background(240);
  text("Type 10 numbers.", 20, 40);
  text("SPACE = save   |   ENTER = exit", 20, 70);
  text("Current input:\n\n" + buffer, 20, 130);
}

void keyTyped() {
  if (key >= '0' && key <= '9') {
    buffer += key;
  } 
  else if (key == '.' && !hasDot) {
    buffer += key;
    hasDot = true;
  }
}

void keyPressed() {
  // Backspace
  if (key == BACKSPACE && buffer.length() > 0) {
    if (buffer.charAt(buffer.length()-1) == '.') {
      hasDot = false;
    }
    buffer = buffer.substring(0, buffer.length()-1);
  }

  // SPACE -> update formatted number
  if (key == ' ') {
    if (buffer.length() > 0 && buffer.length() <= 10) {
      String formatted = formatNumber(buffer, hasDot);
      output.println("stored: "+formatted+"\n");
      buffer = "";
      hasDot = false;
    }
  }

  // ENTER -> close file & exit
  if (key == ENTER || key == RETURN) {
    output.flush();
    output.close();
    exit();
  }
}

String formatNumber(String s, boolean isFloat) {
  if (!isFloat) {
    String digits = s.replaceAll("[^0-9]", "");
    digits = repeat('0', 10 - digits.length()) + digits;
    return digits;
  } else {
    // Float format: 6 digits left, 4 digits right
    float value = float(s);
    // nf(value, digitsLeft, digitsRight)
    return nf(value, 6, 4);
  }
}

String repeat(char ch, int count) {
  StringBuilder sb = new StringBuilder(count);
  for (int i = 0; i < count; i++) sb.append(ch);
  return sb.toString();
}
