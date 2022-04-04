clear % clean MATLAB memory  
alpha = 0.9; % α reliability value declaration
g= [… … …    ]; % declaration of the row vector containing the values of ρ    
A=size(g); % extraction of the size of the vector g
B=A(1,2); % extraction of the number of columns of the vector g
b=ones(B,1); % initialization of bkit values to 1
for i =1:B % a for loop to read the vector g values "vector g contains the values ρ"
    k=1;
    sigma1 = (g(1,i)^k)/factorial(k);
    eq = ((g(1,i)^(b(i,1)))/factorial(b(i,1)))/(1+sigma1);  % initialization of the chance constraint (1)

% a while loop to check the satisfaction of the chance constraint (1)
    while eq>1-alpha           % check if the chance constraint is unsatisfied
        b(i,1)=b(i,1)+1;       % increment by 1 the value of bkit
        for k =1:b(i,1)        % a for loop to calculate the “sigma” value
            sigma = sum((g(1,i)^k)/factorial(k));
            eq=((g(1,i)^b(i,1))/factorial(b(i,1)))/(1+sigma); % update of the chance constraint 
        end
    end
end
b % return b "vector containing the values of "bkit" 
