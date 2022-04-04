clear % clean MATLAB memory   

% declaration of row vectors containing the values of ρ  
g1=[… … …    ]; % decalaration of vector ρkit (k=1 et t=1)
g2=[… … …    ]; % decalaration of vector ρkit (k=1 et t=2)
g3=[… … …    ]; % decalaration of vector ρkit (k=2 et t=1)
g4=[… … …    ]; % decalaration of vector ρkit (k=2 et t=2)
g=g1; % definition of the vector g which takes, according to the case, the values of g1, g2, g3 or g4 
A=size(g); % extraction of the size of the vector g
B=A(1,2); % extraction of the number of columns of the vector g 
b=ones(B,90); % initialization of bkit values to 1

% a for loop to read the values of the vector g "the vector g contains the ρ values 
for alpha = 1:90
    for i =1:B
    k=1;
    sigma1 = (g(1,i)^k)/factorial(k);
    eq = ((g(1,i)^(b(i,alpha)))/factorial(b(i,alpha)))/(1+sigma1);  % initialization of the chance constraint (2)

% % a while loop to check the satisfaction of the chance constraint (2)
while eq>1-(alpha/100)     % check if the chance constraint is unsatisfied        b(i,alpha)=b(i,alpha)+1;    % increment by 1 the value of b_it^(〖kα〗_m )
          for k =1:b(i,alpha)      % a for loop to calculate the “sigma” value
            sigma = sum((g(1,i)^k)/factorial(k));
            eq=((g(1,i)^b(i,alpha))/factorial(b(i,alpha)))/(1+sigma); % update of the chance constraint 
          end
        end
    end
end
b1=b ;
b1 % return b1 containing the values of b_it^(〖kα〗_m ) (k=1 et t=1)
