String[] lines;

void setup() {
  size(400, 400);
  textSize(13);

  // 1) Load all lines from data.txt
  lines = loadStrings("data.txt");
  if (lines == null) {
    println("ERROR: Could not find data/data.txt.");
    exit();
  }
}

void draw() {
  background(250);

  // 2) For each line in data.txt:
  for (int i = 0; i < lines.length; i++) {
    String ori = lines[i];
    if (ori == null) continue;

    // Trim spaces and skip empty lines
    String line = trim(ori);
    if (line.length() == 0) continue;

    // Split into the keyword and the numbers
    // Expecting: "<shape> <numbers>"
    String[] parts = splitTokens(line, " \t");
    if (parts.length < 2) {
      println("Skip malformed line: " + line);
      continue;
    }
    String kind = parts[0].toLowerCase();
    String[] nums = split(parts[1], ',');

    // Draw shape type
    if (kind.equals("ellipse") && nums.length == 4) {
      float x = parseFloat(nums[0]);
      float y = parseFloat(nums[1]);
      float w = parseFloat(nums[2]);
      float h = parseFloat(nums[3]);

      noStroke();
      fill(120, 180, 255);
      ellipse(x, y, w, h);

    } else if (kind.equals("rect") && nums.length == 4) {
      float x = parseFloat(nums[0]);
      float y = parseFloat(nums[1]);
      float w = parseFloat(nums[2]);
      float h = parseFloat(nums[3]);

      noStroke();
      fill(255, 160, 110);
      rect(x, y, w, h);

    } else if (kind.equals("line") && nums.length == 4) {
      float x1 = parseFloat(nums[0]);
      float y1 = parseFloat(nums[1]);
      float x2 = parseFloat(nums[2]);
      float y2 = parseFloat(nums[3]);

      stroke(40);
      strokeWeight(3);
      line(x1, y1, x2, y2);

    } else {
      println("unsupported or wrong format at line " + line);
    }
  }

  // (Optional) HUD text
  fill(0);
  noStroke();
  text("Loaded " + lines.length + " line(s) from data.txt", 10, 10);
}
