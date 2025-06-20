function [classes] = predict_classes(X, weights, ...
    input_layer_size, hidden_layer_size, ...
    output_layer_size)
  % X -> the test examples for which the classes must be predicted
  % weights -> the trained weights (after optimization)
  % [input|hidden|output]_layer_size -> the sizes of the three layers
  
  % classes -> a vector with labels from 1 to 10 corresponding to
  %            the test examples given as parameter

  m = size(X, 1);

  [Theta1, Theta2] = compute_thetas(weights, ...
       input_layer_size, hidden_layer_size, ...
       output_layer_size);

  A1 = [ones(m,1) X];                     

  % calcul activare strat ascuns
  Z2 = A1 * Theta1';                      
  A2_nobias = sigmoid(Z2);                

  A2 = [ones(m,1) A2_nobias];             

  % calcul activare strat de ieșire
  Z3 = A2 * Theta2';                      
  A3 = sigmoid(Z3);                       

  % luam clasa cu probabilitatea maximă
  [~, classes] = max(A3, [], 2);
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