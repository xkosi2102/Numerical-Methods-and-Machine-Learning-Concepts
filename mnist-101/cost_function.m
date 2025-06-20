function [J, grad] = cost_function(params, X, y, lambda, ...
    input_layer_size, ...
    hidden_layer_size, ...
    output_layer_size)

  % params -> vector containing the weights from the two matrices
  %           Theta1 and Theta2 in an unrolled form (as a column vector)
  % X -> the feature matrix containing the training examples
  % y -> a vector containing the labels (from 1 to 10) for each
  %      training example
  % lambda -> the regularization constant/parameter
  % [input|hidden|output]_layer_size -> the sizes of the three layers
  
  % J -> the cost function for the current parameters
  % grad -> a column vector with the same length as params
  % These will be used for optimization using fmincg

  m = size(X, 1);
  
  [Theta1, Theta2] = compute_thetas(params, ...
      input_layer_size, hidden_layer_size, ...
      output_layer_size);
  
  Y = full(sparse(1:m, y, 1, m, output_layer_size));
  % costul cross‑entropy si gradientii partiali
  [cross_entropy_result, grad1_partial, grad2_partial] = cross_entropy_function(X, Y, m,...
      Theta1, Theta2);
  regularization_result = regularization_function(params, lambda, Theta1, Theta2, m,...
    input_layer_size, hidden_layer_size, ...
    output_layer_size);
  % cost total
  J = cross_entropy_result + regularization_result;
  grad1 = grad1_partial;
  grad2 = grad2_partial;
  grad1(:,2:end) = grad1(:,2:end) + (lambda/m)*Theta1(:,2:end);
  grad2(:,2:end) = grad2(:,2:end) + (lambda/m)*Theta2(:,2:end);

  grad = [grad1(:); grad2(:)];
end
  
function [Theta1, Theta2] = compute_thetas(params, ...
  input_layer_size, hidden_layer_size, ...
  output_layer_size)
  elems_count = hidden_layer_size * (input_layer_size + 1);
  Theta1 = reshape( params(1:elems_count), ...
      hidden_layer_size, (input_layer_size + 1) );
  Theta2 = reshape( params(elems_count+1:end), ...
      output_layer_size, (hidden_layer_size + 1) );
end
  
function [cross_entropy_result, grad1, grad2] = cross_entropy_function(X, Y, m, Theta1, Theta2)
  A1 = [ones(m,1) X];
  Z2 = A1 * Theta1';
  A2 = [ones(m,1) sigmoid(Z2)];                       
  Z3 = A2 * Theta2';                                          
  A3 = sigmoid(Z3);
  delta3 = A3 - Y;
  delta2 = (delta3 * Theta2(:,2:end)) .* ...
  ( A2(:,2:end) .* (1 - A2(:,2:end)) );
  
  grad1 = (delta2' * A1) / m;
  grad2 = (delta3' * A2) / m;

  cross_entropy_sum = -Y .* log(A3) - (1 - Y) .* log(1 - A3);
  cross_entropy_result = sum(cross_entropy_sum(:)) / m;
end
  
function [regularization_result] = regularization_function(params, lambda, Theta1, Theta2, m,...
  input_layer_size, hidden_layer_size, ...
  output_layer_size)
  regularization_sum = sum(Theta1(:,2:end)(:).^2) + sum(Theta2(:,2:end)(:).^2);
  regularization_result = (lambda/(2*m)) * regularization_sum;
end