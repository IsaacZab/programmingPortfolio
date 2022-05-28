#include <iostream>
#include <iomanip>
#include "Pyramid.h"
#include <bits/stdc++.h>
using namespace std;

Pyramid :: Pyramid(const int l, const int s  )
{}

void Pyramid :: setPyramid(const int l, const int s )
{
  length = l;   
  sHeight = s;
    
}

int Pyramid :: calcVol()
{
  int vol =  (0.33)* length* length* sHeight;
  return vol;
}

int Pyramid :: calcSa()
{
  int sa = 2* length* sHeight + pow(sHeight,2);
  return sa;
}
