#include <iostream>
using namespace std;
#include "Box.h"
#include "Pyramid.h"
#include "Sphere.h"

int main() {
  int choice;
  cout<<"Press 1 to calculate a Box"<< endl;
  cout<<"Press 2 to calculate a Pyramid"<< endl;
  cout<<"Press 3 to calculate a Sphere"<< endl;
  int c1,c2,c3;
  
  cin >> choice;

  if  (choice == 1)  {
    cout<<"Please enter length of Box"<<endl;
      cin>> c1;
    cout<<"Enter width"<< endl;
      cin>> c2;
    cout<< "Enter height"<< endl;
      cin>> c3;
    Box b1;
    b1.setBox(c1,c2,c3);
    cout<< "Volume: "<< b1.calcVol()<< endl;
    cout<< "Surface Area: "<< b1.calcSa();
    } else if (choice ==  2) {
    cout<<"Please enter length of base"<<endl;
      cin>> c1;
    cout<<"Enter slant height"<< endl;
      cin>> c2;
    Pyramid p1;
    p1.setPyramid(c1,c2);
    cout<< "Volume: "<< p1.calcVol()<< endl;
    cout<< "Surface Area: "<< p1.calcSa();
    }else{
    cout<<"Enter radius"<<endl;
      cin>> c1;
   Sphere s1;
    s1.setSphere(c1);
    cout<< "Volume: "<< s1.calcVol()<< endl;
    cout<< "Surface Area: "<< s1.calcSa();
    
  
    }
  
  return 0;
}
