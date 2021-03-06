 function [f,g] = logistic_regression(theta, X,y)
  %
  % Arguments:
  %   theta - A column vector containing the parameter values to optimize.
  %   X - The examples stored in a matrix.  
  %       X(i,j) is the i'th coordinate of the j'th example.
  %   y - The label for each example.  y(j) is the j'th example's label.
  %

  m=size(X,2);
  
  % initialize objective value and gradient.
  f = 0;
  g = zeros(size(theta));


  %
  % TODO:  Compute the objective function by looping over the dataset and summing
  %        up the objective values for each example.  Store the result in 'f'.
  %
  % TODO:  Compute the gradient of the objective by looping over the dataset and summing
  %        up the gradients (df/dtheta) for each example. Store the result in 'g'.
  %
%%% YOUR CODE HERE %%%
  lf = zeros (size(theta));
  
  for i = 1:columns(X)
    lf(i) = logistic_function ( theta' * X(:,i) );
    f += y(i) * log ( lf(i) );
    f += ( 1-y(i) ) * log ( 1 - lf(i) );
  endfor
  f = -f;
 
  %y_hat = lf' * X;
  g = X * (lf - y');
%  m = rows(X);
%  n = columns(X);  
%  for i = 1:n
%    for j = 1:m
%      g(j) += X(j,i) * ( lf(i) - y(i) );
%    endfor
%    fprintf ("%d\n",i);
%  endfor 
  
endfunction

function h = logistic_function ( z )
  h = 1 / ( 1 +  exp ( -z ) );
endfunction