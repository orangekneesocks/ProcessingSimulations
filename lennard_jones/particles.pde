class Particle {
  PVector   pos;
  PVector   vel;
  PVector   acc;
  float     rm6;
  float     ep12;
  float     vel_scale;
  float     m;
  
  //initializations
  Particle() {
    pos = new PVector(random(width), random(height));
    vel_scale = 1;
    vel = new PVector(random(-1,1)*vel_scale,random(-1,1)*vel_scale);
    acc = new PVector(0,0);
    rm6 = 400;
    ep12 = 100000;
    m =1;
  }
  
  ////calculate the force this planet exerts on the other planet
  PVector getforce(Particle other) {
    //first the mag of distance squared
    float d = pos.dist(other.pos);
    
    //then the direction 
    PVector direc = PVector.sub(pos, other.pos);
    direc.normalize();
    
    //now the actual force
    PVector force = direc.mult(-ep12*( (sq(rm6)/pow(d,13)) - (rm6/pow(d,7)) ));
    return force;  
  }
  
  ////how to apply a force
  void applyForce(PVector force) {
    acc.add(force).mult(1/m);
  }
  
  void move() {
   vel.add(acc);
   pos.add(vel);
   acc.mult(0);
  }
  
  void display() {
    noStroke();
    fill(255);
    ellipse(pos.x, pos.y, 20, 20);
  }
  
  void wall() {
   if ((pos.x > width)||(pos.x < 0)) {
     vel.x = vel.x*-1;
   }
   if ((pos.y > height)||(pos.y < 0)) {
     vel.y = vel.y*-1;
   }      
  }
  
}
