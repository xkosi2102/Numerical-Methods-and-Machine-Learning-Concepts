function [matrix] = initialize_weights(L_prev, L_next)
  % L_prev -> the number of units in the previous layer
  % L_next -> the number of units in the next layer
  % matrix -> the matrix with random values
  
  epsilon = sqrt(6) / (sqrt(L_prev + L_next));
  lim_inf = -epsilon;
  lim_sup = +epsilon;
  matrix = zeros(L_next, L_prev + 1);
  for i = 1:L_next
    for j = 1:L_prev+1
      matrix(i, j) = lim_inf + (lim_sup - lim_inf) * rand();
    end
  end
end