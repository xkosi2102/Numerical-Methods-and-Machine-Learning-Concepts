function [Link] = get_link_matrix (Labyrinth)
  % Labyrinth -> the matrix of all encodings
  
  % Link -> the link matrix associated to the given labyrinth
  
  Aux = get_adjacency_matrix(Labyrinth);
  [m, n] = size(Aux);
  Link = zeros(m, n);
  % vector de coloana
  for i = 1:m
    count = 0;
    for j = 1:n
      if Aux(i,j) == 1
        count = count + 1;
      end
    end
    for j = 1:n
      if Aux(i,j) == 1
        Link(i,j) = 1 / count;
      else
        Link(i,j) = 0;
      end
    end
  end

end
  