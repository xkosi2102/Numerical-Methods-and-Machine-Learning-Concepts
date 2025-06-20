function [G, c] = get_Jacobi_parameters(Link)
  % Link -> the link matrix (edge with probabilities matrix)
	
  % G -> iteration matrix
	% c -> iteration vector
  [m, n] = size(Link);
  G = zeros(m-2, n-2);
  c = zeros(m-2, 1);
  for i = 1:m-2
    for j = 1:n-2
      G(i, j) = Link(i, j);
    end
  end
  for i = 1:m-2
      c(i) = Link(i, n-1);
  end
end
