/*
  Copyright 2011 Stefan Kiel <kiel@inf.uni-due.de>
  
  This file is part of yalaa.
  
  yalaa is free software: you can redistribute it and/or modify
  it under the terms of the GNU Lesser General Public License as published by
  the Free Software Foundation, version 3 of the License.
  
  yalaa is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU Lesser General Public License for more details.
  
  You should have received a copy of the GNU Lesser General Public License
  along with yalaa.  If not, see <http://www.gnu.org/licenses/>.
*/


#include <yalaa.hpp>
#include "a_MultipleEqualPoles_SISO.hpp"
#include <iostream>
#include <fstream>

typedef yalaa::details::double_iv_t iv_t;
typedef yalaa::traits::interval_traits<iv_t> iv_traits;

template <typename T>
void PID(T& X0, T& E0, T& P0, 
      T& I0, T& D0, T& PID0)
{          
    T Kp = (T)1.431564041947107;
    T Ki = (T)2.594812307124872;
    T Kd = (T)0.100000000000000;
    T dt = (T)0.005;
    T setpoint = (T)1;
    T X = X0;
    T E = E0;
    T P = P0; 
    T I = I0; 
    T D = D0; 
    T PID = PID0;
    for(int i=0;i<1200;i++){
        MultipleEqualPoles_SISO<T>(setpoint, dt, X,
         E, P, I, D, PID, 
         Kp, Ki, Kd);
    }
    E0 = E;
    P0 = P;
    I0 = I;
    D0 = D;
    PID0 = PID;
    X0 = X;
}

int main(int argc, char*argv[]){

    yalaa::aff_e_d x0(iv_t(0, 2.0));
    yalaa::aff_e_d e0(iv_t(-1.0, 1.0));
    yalaa::aff_e_d p0(iv_t(0, 2.0));
    yalaa::aff_e_d i0(iv_t(0, 2.0));
    yalaa::aff_e_d d0(iv_t(0, 2.0));
    yalaa::aff_e_d pid0(iv_t(0, 2.0));

    PID(x0,e0,p0,i0,d0,pid0);

    /** initiate file **/
    std::ofstream out1("X.txt");
    /** initiate buffer **/
    auto *coutbuf1 = std::cout.rdbuf();
    std::cout.rdbuf(out1.rdbuf());
    std::cout << x0 << std::endl;
    /** reset cout buffer **/
    std::cout.rdbuf(coutbuf1);

    /** initiate file **/
    std::ofstream out2("E.txt");
    /** initiate buffer **/
    auto *coutbuf2 = std::cout.rdbuf();
    std::cout.rdbuf(out2.rdbuf());
    std::cout << e0 << std::endl;
    /** reset cout buffer **/
    std::cout.rdbuf(coutbuf2);

    /** initiate file **/
    std::ofstream out3("P.txt");
    /** initiate buffer **/
    auto *coutbuf3 = std::cout.rdbuf();
    std::cout.rdbuf(out3.rdbuf());
    std::cout << p0 << std::endl;
    /** reset cout buffer **/
    std::cout.rdbuf(coutbuf3);

    /** initiate file **/
    std::ofstream out4("I.txt");
    /** initiate buffer **/
    auto *coutbuf4 = std::cout.rdbuf();
    std::cout.rdbuf(out4.rdbuf());
    std::cout << i0 << std::endl;
    /** reset cout buffer **/
    std::cout.rdbuf(coutbuf4);

    /** initiate file **/
    std::ofstream out5("D.txt");
    /** initiate buffer **/
    auto *coutbuf5 = std::cout.rdbuf();
    std::cout.rdbuf(out5.rdbuf());
    std::cout << d0 << std::endl;
    /** reset cout buffer **/
    std::cout.rdbuf(coutbuf5);

    /** initiate file **/
    std::ofstream out6("PID.txt");
    /** initiate buffer **/
    auto *coutbuf6 = std::cout.rdbuf();
    std::cout.rdbuf(out6.rdbuf());
    std::cout << pid0 << std::endl;
    /** reset cout buffer **/
    std::cout.rdbuf(coutbuf6);

    
}
