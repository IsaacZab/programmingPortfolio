#include <iostream>
#include <iomanip>
#include "Sphere.h"
#include <bits/stdc++.h>
#include <cmath>
using namespace std;

Sphere :: Sphere(const int r)
{}

void Sphere :: setSphere(const int r )
{
 radius = r;
}

int Sphere :: calcVol()
{
  int vol = (4*3.1459*radius*radius*radius)/3;
  return vol;
}

int Sphere :: calcSa()
{
  int sa = 4 * M_PI * radius * radius;
  return sa;
}
