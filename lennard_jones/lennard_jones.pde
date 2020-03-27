int num_particles = 50;

Particle[] particles = new Particle[num_particles];

void setup() {
 //background(0);
 size(500,500, P2D);
 for (int i = 0; i < num_particles; i++) {
  particles[i] = new Particle(); 
 }
}

void draw() {
  background(0);
  PVector[][] forcematrix = new PVector[num_particles][num_particles];
  
  int j = -1;
  for (int i = 0; i < num_particles; i++){
   j += 1;
   for (int k = j; k < num_particles; k++) {
     if (i == k){
      forcematrix[i][k] = new PVector(0,0); 
     } else {
      forcematrix[i][k] = particles[i].getforce(particles[k]);
      forcematrix[k][i] = particles[k].getforce(particles[i]);
     }
   }
  }
  
  //interaction processes (netforce and reflect)
  for (int i = 0; i < num_particles; i++) {
    for (int k = 0; k < num_particles; k++) {
     particles[i].applyForce(forcematrix[i][k]); 
    }
    particles[i].wall();
    particles[i].move();
    particles[i].display();
  }
}
