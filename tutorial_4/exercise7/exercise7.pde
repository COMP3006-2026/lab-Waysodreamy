String[] lines;
int maleCount = 0;
int femaleCount = 0;
int bornAfter2003Count = 0;

void setup() {
  size(400, 400);
  textFont(createFont("Arial", 20));
  fill(0);

  // 1) Load lines
  lines = loadStrings("T4q7.csv");
  if (lines == null || lines.length < 2) {
    println("T4q7.csv not found or too few lines.");
    exit();
    return;
  }

  // 2) Skip first line if it's the metadata line that starts with "maxX="
  int headerIndex = 0;
  if (trim(lines[0]).toLowerCase().startsWith("maxx=")) {
    headerIndex = 1;
  }

  // 3) Parse header to find column indices
  String[] header = split(lines[headerIndex], ',');
  for (int i = 0; i < header.length; i++) header[i] = norm(header[i]);

  int idxGender = indexOf(header, "gender");
  int idxYOB    = indexOf(header, "yearofbirth"); 

  if (idxGender == -1 || idxYOB == -1) {
    println("Could not find Gender or Year of Birth columns in header.");
    exit();
    return;
  }

  // 4) Iterate rows and tally
  for (int i = headerIndex + 1; i < lines.length; i++) {
    String line = trim(lines[i]);
    if (line.length() == 0) continue;

    String[] cols = split(line, ',');
    // pad if row is shorter than header
    if (cols.length < header.length) {
      String[] padded = new String[header.length];
      arrayCopy(cols, padded, cols.length);
      for (int k = cols.length; k < header.length; k++) padded[k] = "";
      cols = padded;
    }

    String gender = trim(cols[idxGender]);
    String yobStr = trim(cols[idxYOB]);

    // Count genders (file uses "Male"/"Female")
    if (gender.equalsIgnoreCase("male"))   maleCount++;
    else if (gender.equalsIgnoreCase("female")) femaleCount++;

    // Count born after 2003
    if (yobStr.matches("\\d{4}")) {
      int year = int(yobStr);
      if (year > 2003) bornAfter2003Count++;
    }
  }

  // Console summary
  println("Male: " + maleCount);
  println("Female: " + femaleCount);
  println("Born after 2003: " + bornAfter2003Count);
}

void draw() {
  background(245);
  text("Counting Results from T4q7.csv", 20, 40);
  text("Male              : " + maleCount, 20, 80);
  text("Female            : " + femaleCount, 20, 110);
  text("Born after 2003   : " + bornAfter2003Count, 20, 140);
}

String norm(String s) {
  return trim(s).toLowerCase().replaceAll("[ _]", "");
}

int indexOf(String[] arr, String key) {
  for (int i = 0; i < arr.length; i++) if (arr[i].equals(key)) return i;
  return -1;
}
