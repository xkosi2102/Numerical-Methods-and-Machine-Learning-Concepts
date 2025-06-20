function [Adj] = get_adjacency_matrix (Labyrinth)
	% Labyrinth -> the matrix of all encodings
  
  % Adj -> the adjacency matrix associated to the given labyrinth
  
  [m, n] = size(Labyrinth);

  WIN = m * n + 1;
  LOSE = m * n + 2;

  Adj = zeros(m * n + 2, m * n + 2);
  for i = 1:m
    for j = 1:n
      idx = (i-1)*n + j; % index liniar al celulei (i,j)
      v = Labyrinth(i,j);

      % biti: 1=vest, 2=est, 4=sud, 8=nord
      Vest = bitand(v, 1);
      Est = bitand(v, 2);
      Sud = bitand(v, 4);
      Nord = bitand(v, 8);

      if Vest == 0
        if j == 1
          Adj(idx, LOSE) = 1;
        else
          Adj(idx, idx-1) = 1;
        end
      end

      if Est == 0
        if j == n
          Adj(idx, LOSE) = 1;
        else
          Adj(idx, idx+1) = 1;
        end
      end

      if Sud == 0
        if i == m
          Adj(idx, WIN) = 1;
        else
          Adj(idx, idx+n) = 1;
        end
      end

      if Nord == 0
        if i == 1
          Adj(idx, WIN) = 1;
        else
          Adj(idx, idx-n) = 1;
        end
      end
    end
  end
  Adj(WIN, WIN) = 1;
  Adj(LOSE, LOSE) = 1;
end
