Planet p1;
Planet p2;
int num_planets = 3;

Planet[] planets = new Planet[num_planets];

void setup() {
 //background(0);
 size(3000,2000, P2D);
 for (int i = 0; i < num_planets; i++) {
  planets[i] = new Planet(); 
 }
}

void draw() {
  background(0);
  PVector[][] forcematrix = new PVector[num_planets][num_planets];
  
  int j = -1;
  for (int i = 0; i < num_planets; i++){
   j += 1;
   for (int k = j; k < num_planets; k++) {
     if (i == k){
      forcematrix[i][k] = new PVector(0,0); 
     } else {
      forcematrix[i][k] = planets[i].getforce(planets[k]);
      forcematrix[k][i] = planets[k].getforce(planets[i]);
     }
   }
  }
  
  //interaction processes (netforce and reflect)
  for (int i = 0; i < num_planets; i++) {
    for (int k = 0; k < num_planets; k++) {
     planets[i].applyForce(forcematrix[i][k]); 
     if (i != k) {
    //   planets[i].reflect(planets[k]);
    // }
    //}
    planets[i].wall();
    planets[i].move();
    planets[i].display();
  }
}
