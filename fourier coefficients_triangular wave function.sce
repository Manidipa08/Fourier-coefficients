//Date-28/04/2022
//Aim - To evaluate the fourier coefficients of triangular wave function.
clc
clear
clf
L=%pi
n=100//no. of intervals
h=(2*L)/n
x=-L:0.01:L
ss=gca()//get control on axis
ss.data_bounds=([-4,-2;4,2])
m=1
c=1
//triangular wave using inbuilt function
function y=triangular(x, L, m, c)
 l=length(x)
for i=1:l
    if x(i)>=-L & x(i)<0 then
       y(i)=m*x(i)+c
    else
       y(i)=-m*x(i)+c
    end
end
endfunction
//fourier series calculations
function [a0, A, B]=fourier(x)
 a0=(intg(-L,L,triangular,0.00000001))/(2*%pi)
 for i=1:n
 deff('y1=f1(x,triangular)','y1=triangular(x)*cos((i*%pi*x)/L)')
 A(i)=(intg(-L,L,f1,0.0000001))/%pi
 deff('y2=f2(x,triangular)','y2=triangular(x)*sin((i*x*%pi)/L)')
 B(i)=(intg(-L,L,f2,0.00000001))/%pi
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
plot(x,s,'*Y')
//plotting of defined triangular wave function 
plot(x',triangular,'-r')
title("Triangular wave function",'Color','magenta','fontsize','5')
xlabel('X - values ------------->>>>','Color','blue','fontsize','4')
ylabel('Y - values ------------->>>>','Color','blue','fontsize','4')
legend('Fourier series','Inbuilt function')

