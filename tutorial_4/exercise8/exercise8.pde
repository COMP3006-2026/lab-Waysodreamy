// ---- Small-multiple Circle Charts for T4q8.csv ----
// Each quarter becomes a pie/donut chart with Weekday/Saturday/Sunday.
// Auto-fits to window: responsive grid, computed radii, margins.

// ---------- CONFIG ----------
final float INNER_HOLE_RATIO = 0.55;  // 0 = pie, 0.55 = donut
final int   BASE_CELL_W = 260;        // preferred cell width
final int   BASE_CELL_H = 220;        // preferred cell height
final int   MARGIN_L = 40, MARGIN_R = 40, MARGIN_T = 70, MARGIN_B = 40;

// Colors (match your earlier palette)
final int COL_WEEKDAY = color(70, 130, 180);   // blue-ish
final int COL_SAT     = color(220, 120, 70);   // orange
final int COL_SUN     = color(90, 180, 90);    // green

// ---------- DATA ----------
class Trio {
  String quarter;
  float weekday, saturday, sunday;
  float total() { return max(0.0001, weekday + saturday + sunday); }
}
ArrayList<Trio> items = new ArrayList<Trio>();

// Layout (computed)
int nCols, nRows;
float cellW, cellH;
float centerX(int col) { return MARGIN_L + col * cellW + cellW * 0.5; }
float centerY(int row) { return MARGIN_T + row * cellH + cellH * 0.5; }

void settings() {
  // Preload to determine how many quarters -> set window size accordingly
  String[] lines = loadStrings("T4q8.csv");
  if (lines == null || lines.length < 2) {
    size(900, 600);
    return;
  }
  String[] header = split(lines[0], ',');
  String[] quarters = subset(header, 1);
  for (int i = 0; i < quarters.length; i++) quarters[i] = trim(quarters[i]);
  int n = max(quarters.length, 1);

  // Choose grid dims ~square
  nCols = ceil(sqrt(n));
  nRows = ceil(n / (float)nCols);

  int w = MARGIN_L + MARGIN_R + nCols * BASE_CELL_W;
  int h = MARGIN_T + MARGIN_B + nRows * BASE_CELL_H;
  size(w, max(600, h));
}

void setup() {
  surface.setTitle("Circle Charts - T4q8.csv");
  textFont(createFont("Arial", 14));
  parseFile();     // fill 'items'
  computeLayout(); // compute cellW/cellH based on window size + counts
}

void draw() {
  background(252);
  drawLegend();

  if (items.size() == 0) {
    fill(0);
    text("No data parsed from T4q8.csv", 20, 40);
    return;
  }

  for (int i = 0; i < items.size(); i++) {
    int row = i / nCols;
    int col = i % nCols;

    float cx = centerX(col);
    float cy = centerY(row);

    Trio t = items.get(i);

    // Compute outer radius that fits within the cell with some padding
    float maxR = min(cellW, cellH) * 0.35;  // 35% of the smaller cell dimension
    float innerR = INNER_HOLE_RATIO <= 0 ? 0 : maxR * constrain(INNER_HOLE_RATIO, 0, 0.92);

    // Draw the donut/pie
    drawPie(cx, cy, maxR, innerR, t);

    // Title (quarter)
    fill(10);
    textAlign(CENTER, BOTTOM);
    text(t.quarter, cx, cy - maxR - 10);

    // Optional total in the center
    fill(40);
    textAlign(CENTER, CENTER);
    String totalTxt = nfc(t.total(), 0);
    if (INNER_HOLE_RATIO > 0) {
      text(totalTxt, cx, cy);  // inside the donut hole
    } else {
      // For pie, place below chart
      text(totalTxt, cx, cy + maxR + 14);
    }
  }
}

// ---------- parsing ----------
void parseFile() {
  String[] lines = loadStrings("T4q8.csv");
  if (lines == null || lines.length < 2) return;

  // Header → quarter labels (skip first blank label cell)
  String[] header = split(lines[0], ',');
  String[] quarters = subset(header, 1);
  for (int i = 0; i < quarters.length; i++) quarters[i] = trim(quarters[i]);

  // Find rows for subtotals (normalize like earlier: remove spaces/hyphens/underscores/parentheses)
  int idxWeekday = findRowIndex(lines, "subtotalweekday");
  int idxSaturday = findRowIndex(lines, "subtotalsaturday");
  int idxSunday   = findRowIndex(lines, "subtotalsunday");

  if (idxWeekday == -1 || idxSaturday == -1 || idxSunday == -1) {
    println("Could not find all subtotal rows (weekday/saturday/sunday).");
    return;
  }

  float[] vWeek = parseRowValues(lines[idxWeekday]);
  float[] vSat  = parseRowValues(lines[idxSaturday]);
  float[] vSun  = parseRowValues(lines[idxSunday]);

  int count = min(quarters.length, min(vWeek.length, min(vSat.length, vSun.length)));
  items.clear();

  for (int i = 0; i < count; i++) {
    Trio t = new Trio();
    t.quarter  = quarters[i];
    t.weekday  = vWeek[i];
    t.saturday = vSat[i];
    t.sunday   = vSun[i];
    items.add(t);
  }
}

// ---------- layout helpers ----------
void computeLayout() {
  if (items.size() == 0) { cellW = BASE_CELL_W; cellH = BASE_CELL_H; return; }

  // if settings() already computed nCols/nRows; recompute in case of resize or different count
  int n = items.size();
  nCols = ceil(sqrt(n));
  nRows = ceil(n / (float)nCols);

  float usableW = width - (MARGIN_L + MARGIN_R);
  float usableH = height - (MARGIN_T + MARGIN_B);

  cellW = usableW / nCols;
  cellH = usableH / nRows;

  // Minimum cell size for readability
  cellW = max(180, cellW);
  cellH = max(160, cellH);
}

// ---------- drawing helpers ----------
void drawPie(float cx, float cy, float outerR, float innerR, Trio t) {
  float tot = t.total();
  float aStart = -HALF_PI;  // start at 12 o'clock

  noStroke();

  // Weekday
  float aW = TWO_PI * (t.weekday / tot);
  fill(COL_WEEKDAY);
  drawArcRing(cx, cy, outerR, innerR, aStart, aStart + aW);

  // Saturday
  float aS = TWO_PI * (t.saturday / tot);
  fill(COL_SAT);
  drawArcRing(cx, cy, outerR, innerR, aStart + aW, aStart + aW + aS);

  // Sunday
  float aU = TWO_PI * (t.sunday / tot);
  fill(COL_SUN);
  drawArcRing(cx, cy, outerR, innerR, aStart + aW + aS, aStart + aW + aS + aU);
}

void drawArcRing(float cx, float cy, float outerR, float innerR, float a1, float a2) {
  if (innerR <= 0.0001) {
    // Simple pie slice
    arc(cx, cy, outerR*2, outerR*2, a1, a2, PIE);
  } else {
    // Donut slice: draw outer arc and inner cutout
    // Strategy: draw slice, then punch hole with a filled circle in background color.
    arc(cx, cy, outerR*2, outerR*2, a1, a2, PIE);
    // carve inner hole (background color)
    fill(252);
    ellipse(cx, cy, innerR*2, innerR*2);
  }
}

void drawLegend() {
  float x = width - MARGIN_R - 170;
  float y = 30;
  float box = 12;

  textAlign(LEFT, CENTER);
  noStroke();

  fill(COL_WEEKDAY); rect(x, y - box/2, box, box);   fill(20); text("Weekday", x + box + 8, y);
  y += 20;
  fill(COL_SAT);     rect(x, y - box/2, box, box);   fill(20); text("Saturday", x + box + 8, y);
  y += 20;
  fill(COL_SUN);     rect(x, y - box/2, box, box);   fill(20); text("Sunday", x + box + 8, y);

  // Title
  textAlign(LEFT, BOTTOM);
  fill(30);
  textSize(16);
  text("Traffic subtotals by quarter", MARGIN_L, 40);
  textSize(12);
  fill(60);
  text("Source \nrows: Subtotal - weekday / Saturday / Sunday;  columns: Dec-08 … Dec-10", MARGIN_L, 68);
}

// ---------- CSV helpers ----------
String normKey(String s) {
  // same normalization as before: remove spaces, hyphens, underscores, parentheses
  return trim(s).toLowerCase().replaceAll("[ ()_-]", "");
}

int findRowIndex(String[] lines, String normKeyToFind) {
  for (int i = 0; i < lines.length; i++) {
    String[] cols = split(lines[i], ',');
    if (cols == null || cols.length == 0) continue;
    String label = normKey(cols[0]);
    if (label.equals(normKeyToFind)) return i;
  }
  return -1;
}

float[] parseRowValues(String line) {
  String[] cols = split(line, ',');
  if (cols == null || cols.length <= 1) return new float[0];
  float[] vals = new float[cols.length - 1];
  for (int i = 1; i < cols.length; i++) {
    String s = trim(cols[i]);
    vals[i - 1] = (s.length() == 0) ? 0 : parseFloatSafe(s);
  }
  return vals;
}

float parseFloatSafe(String s) {
  try { return float(s); } catch (Exception e) { return 0; }
}
