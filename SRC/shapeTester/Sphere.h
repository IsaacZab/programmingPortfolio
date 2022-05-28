#ifndef SPHERE_H
#define SPHERE_H

class Sphere {
private:
   int radius;

public:
  Sphere(const int r = 0.0 );

  void setSphere(const int r);

  int calcVol();

 int calcSa();
};
 
#endif
