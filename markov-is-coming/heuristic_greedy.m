function [path] = heuristic_greedy(start_position, probabilities, Adj)
  % start_position -> the starting point in the labyrinth
  % probabilities -> vector of associated probabilities: including WIN and LOSE
  % Adj -> adjacency matrix
  
  [~, n] = size(Adj);

  path = start_position;
  aux = start_position;
  seen = zeros(1, n); % noduri deja vizitate
  seen(aux) = 1;

  while true
      bestProb = 0;
      bestIdx  = -1;

      % parcurgem toți vecinii lui aux
      for i = 1:n
          if Adj(aux,i) && ~seen(i)
              if probabilities(i) > bestProb
                  bestProb = probabilities(i);
                  bestIdx = i;
              end
          end
      end

      path(end+1,1) = bestIdx;
      aux = bestIdx;
      seen(aux) = 1;

      % am ajuns la WIN
      if aux == n - 1
          break;
      end
  end
end
