#include <iostream>
#include <iomanip>
#include "Box.h"
using namespace std;

Box :: Box(const int l, const int w, const int h )
{}

void Box :: setBox(const int l, const int h, const int w)
{
  length = l;
  width = w;
  height = h;
}

int Box :: calcVol()
{
  int vol = length * width * height;
  return vol;
}
int Box :: calcSa()
{
  int sa = 2 * (length * width + length * height + width * height);
  return sa;
}

