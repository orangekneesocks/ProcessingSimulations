class Planet {
  PVector pos;
  PVector vel;
  PVector acc;
  float r;
  float m;
  float vel_scale;
  float G;
  
  //initializations
  Planet() {
    pos = new PVector(random(width), random(height));
    vel_scale = 1;
    vel = new PVector(random(-1,1)*vel_scale,random(-1,1)*vel_scale);
    acc = new PVector(0,0);
    m = random(10,15);
    r = m*2;
    G = -150;
  }
  
  //calculate the force this planet exerts on the other planet
  PVector getforce(Planet other) {
    //first the mag of distance squared
    float d2 = pos.dist(other.pos);
    d2 = sq(d2);
    
    //then the direction 
    PVector direc = PVector.sub(pos, other.pos);
    direc.normalize();
    
    //now the actual force
    PVector force = direc.mult((G * m * other.m)/(d2));
    return force;  
  }
  
  //how to apply a force
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
    ellipse(pos.x, pos.y, 2*r, 2*r);
  }
  
  void wall() {
   if ((pos.x > width)||(pos.x < 0)) {
     vel.x = vel.x*-1;
   }
   if ((pos.y > height)||(pos.y < 0)) {
     vel.y = vel.y*-1;
   }      
  }
  
  void reflect(Planet other) {
    float d = pos.dist(other.pos);
    if (d < r + other.r) {
      vel.mult(-1);
  }
 }
  
}
