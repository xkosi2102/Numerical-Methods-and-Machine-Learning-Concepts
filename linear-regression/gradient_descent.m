function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
  % FeatureMatrix -> the matrix with all training examples
  % Y -> the vector with all actual values
  % n -> the number of predictors
  % m -> the number of trainings
  % alpha -> the learning rate
  % iter -> the number of iterations
  % Theta -> the vector of weights
  Theta = zeros(n+1, 1);
  FeatureMatrix = [ones(m, 1), FeatureMatrix];
  for i = 1:iter
      predictions = FeatureMatrix * Theta;
    
      errors = predictions - Y;
      
      gradient = (1/m) * (FeatureMatrix' * errors);
      
      Theta = Theta - alpha * gradient;
  end
  Theta(1) = 0;
end