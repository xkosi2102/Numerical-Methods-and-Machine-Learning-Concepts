function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of 
  %           shrinkage applied to the regression coefficients
  % Error -> the error of the regularized cost function
  m = length(Y);
  calculated_sum = sum_of_costs(Theta, Y, FeatureMatrix)
  penalty = l1_penalty(Theta, lambda);
  Error = (1 / m) * calculated_sum + l1_penalty(Theta, lambda);
end

function [calculated_sum] = sum_of_costs(Theta, Y, FeatureMatrix)
  % suma patratelor erorilor
  m = length(Y);
  FeatureMatrix = [ones(size(FeatureMatrix, 1), 1), FeatureMatrix];
  calculated_sum = 0;
  for i = 1:m
    calculated_sum = calculated_sum + (FeatureMatrix(i, :) * Theta - Y(i)).^2;
  end
end

function [penalty] = l1_penalty(theta, lambda)
  % suma valorilor absolute
  norm1 = sum(abs(theta));
  penalty = lambda * norm1;
  end