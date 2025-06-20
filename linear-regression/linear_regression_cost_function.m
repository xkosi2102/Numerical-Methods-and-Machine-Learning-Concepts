function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % Error -> the error of the regularized cost function
  calculated_sum = sum_of_costs(Theta, Y, FeatureMatrix);
  m = length(Y);
  Error = (1 / (2 * m)) * calculated_sum;
end

function [calculated_sum] = sum_of_costs(Theta, Y, FeatureMatrix)
  % suma cost function
  m = length(Y);
  FeatureMatrix = [ones(size(FeatureMatrix, 1), 1), FeatureMatrix];
  calculated_sum = 0;
  for i = 1:m
    calculated_sum = calculated_sum + (FeatureMatrix(i, :) * Theta - Y(i)).^2;
  end
end