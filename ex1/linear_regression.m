function [f,g] = linear_regression(theta, X,y)
  %
  % Arguments:
  %   theta - A vector containing the parameter values to optimize.
  %   X - The examples stored in a matrix.
  %       X(i,j) is the i'th coordinate of the j'th example.
  %   y - The target value for each example.  y(j) is the target for example j.
  %
  
  m=size(X,2);
  n=size(X,1);

  f=0;
  g=zeros(size(theta));

  %
  % TODO:  Compute the linear regression objective by looping over the examples in X.
  %        Store the objective function value in 'f'.
  %
  % TODO:  Compute the gradient of the objective with respect to theta by looping over
  %        the examples in X and adding up the gradient for each example.  Store the
  %        computed gradient in 'g'.
  
  %%% YOUR CODE HERE %%%
  f = objective_function(theta,X,y);
  g = gradient_calculations(theta,X,y);
endfunction

function f = objective_function(theta,X,y)
  sum = 0;
  for i = 1:columns(X)
    sum += ( theta' * X(:,i) - y(i)) ^ 2;
  endfor
  sum = sum / 2;
  f = sum;
endfunction

function g = gradient_calculations(theta, X, y)
  for j = 1:rows(X)
    sum = 0;
    for i = 1:columns(X)
      sum += X(j,i) * (theta' * X(:,i) - y(i));
    endfor
    g(j) = sum;
  endfor
  g = g';
endfunction

