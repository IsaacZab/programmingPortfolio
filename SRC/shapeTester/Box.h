#ifndef BOX_H
#define BOX_H

class Box {
private:
    int length;
    int height;
    int width;

public:
  Box(const int l = 0, const int h = 0, const int w = 0);

  void setBox(const int l, const int h, const int w);

  int calcVol();

  int calcSa();

  void print() const;
};
 
#endif
