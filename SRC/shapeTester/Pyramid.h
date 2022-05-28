#ifndef PYRAMID_H
#define PYRAMID_H

class Pyramid {
private:
    int length;
    int sHeight;
    

public:
  Pyramid(const int l = 0.0, const int s = 0.0 );

  void setPyramid(const int l, const int s);

  int calcVol();

  int calcSa();
};
 
#endif
