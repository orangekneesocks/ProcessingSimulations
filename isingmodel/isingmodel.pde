Lattice L;
int can_size = 1000;

void setup() {
  size(1000, 1000, P2D);
  // Lattice(#spins on one edge, the spin coupling J, the energy scale kbT)
  L = new Lattice(can_size, 1, 2);
  L.fill();
}

void draw() {
  // do one metropolis algorithm step per frame
  L.metropolis(1);
  L.display();
}
