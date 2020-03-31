class Lattice {
  int size;
  int[][] grid;
  float kbT;
  float J;
  
 Lattice(int temp_size, float J_in, float kbT_in) {
   size = temp_size;
   grid = new int[temp_size][temp_size];
   J = J_in;
   kbT = kbT_in;
 }
 
 //fill up randomly grid with either a 1 or a -1
 void fill() {
   for (int i = 0; i < size; i++) {
    for (int j = 0; j < size; j++) {
      float num = random(-1, 1);
      if (num > 0) {
        grid[i][j] = 1;      
      } else {
        grid[i][j] = -1;
      }
    }
   }
  }

 void metropolis(int num_steps) {
   for (int k = 0; k < num_steps; k++) {
     for (int i = 0; i < size; i++) {
       for (int j = 0; j < size; j++) {
         float de;
         float r = random(0,1);
         if ((0 < i) && (i < size-1) && (0 < j) && (j < size-1)) { //the bulk
           de = 4*J*(grid[i+1][j] + grid[i-1][j] + grid[i][j+1] + grid[i][j-1])*grid[i][j];
         //}
         //if (j == 0 && i != 0 && i != size-1) { // top edge
         //  //de = -4*J*(grid[i-1][j] + grid[i+1][j] + grid[i][j+1] + grid[i][size-1])*grid[i][j]; 
         //  set(i, j, color(255,0,0));
         //}
         //if (i == 0 && j != 0 && j != size-1) { // left edge
         //  //de = -4*J*(grid[i+1][j] + grid[size-1][j] + grid[i][j+1] + grid[i][j-1])*grid[i][j];
         //  set(i, j, color(255,0,0) );
         //}
         //if (j == size - 1 && i != 0 && i != size-1) { // bottom edge
         //  //de = -4*J*(grid[i-1][j] + grid[i+1][j] + grid[i][j-1] + grid[i][0])*grid[i][j];
         //  set(i, j, color(255,0,0));
         //}
         //if (i == size - 1 && j != 0 && j != size-1) { // right edge
         //  //de = -4*J*(grid[i-1][j] + grid[0][j] + grid[i][j+1] + grid[i][j-1])*grid[i][j];
         //  set(i, j, color(255,0,0));
        } else {
          de = 999;
        }
        if (r < exp(-de/kbT)) {
          grid[i][j] = -1*grid[i][j];
        }
       }
     }
   }
 }
 
 void display() {
   for (int i = 0; i < can_size; i++){
     for (int j = 0; j < can_size; j++) {
       int intcol = int(127.5*(L.grid[i][j] + 1));
       color c = color(intcol);
       set(i, j, c);
   }
  }
 }
}
