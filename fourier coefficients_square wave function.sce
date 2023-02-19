//Date-28/04/2022
//Aim - To evaluate the fourier coefficients of square wave function.
clc
clear
clf
L=%pi
n=20
//n=input("No of intervals n = ")
h=(2*L)/n
x=-L:0.01:L
ss=gca()//get control on axis
ss.data_bounds=([-4,-2;4,2])
//square wave using inbuilt function
deff('y=square(x)','y=squarewave(x)')
y=square(x)
//fourier series calculations
function [a0, A, B]=fourier(x)
 a0=(1/2*%pi)*intg(-L,L,square,0.00000001)
 for i=1:n
 deff('y1=f1(x,square)','y1=square(x)*cos(i*%pi*x/L)')
 A(i)=(1/%pi)*(intg(-L,L,f1,0.0000001))
 deff('y2=f2(x,square)','y2=square(x)*sin(i*x*%pi/L)')
 B(i)=(1/%pi)*(intg(-L,L,f2,0.00000001))
 end
endfunction
[a0,A,B]=fourier(x)
//calculated from fourier series
disp("Fourier coefficients are - ")
disp("a0 =",a0)
disp("an =",A)
disp("bn =",B)
function s=sol(x)
 s=a0
 for i=1:n
 s=s+(A(i).*cos((i.*x.*(%pi/L))))+(B(i).*sin((i.*x.*(%pi/L))))
 end
endfunction
s=sol(x)
plot(x,s,'-*b')
//plotting of inbuilt square wave function 
plot(x,square,'-oM')
title("Square wave function",'Color','magenta','fontsize','5')
xlabel('X - values ------------->>>>','Color','green','fontsize','4')
ylabel('Y - values ------------->>>>','Color','green','fontsize','4')
legend('Fourier series','Inbuilt function')
