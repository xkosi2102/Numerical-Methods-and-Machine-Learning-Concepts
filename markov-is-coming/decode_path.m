function [decoded_path] = decode_path (path, lines, cols)
	% path -> vector containing the order of the states that arrived
	% 		 to a winning position
	% lines -> numeber of lines
	% cols -> number of columns
	
	% decoded_path -> vector of pairs (line_index, column_index)
  %                 corresponding to path states
  % hint: decoded_path does not contain indices for the WIN state
  decoded_path = [];
  for k = 1:lines * cols
      if path(k) == lines * cols + 1
        break
      end
      lin = floor((path(k)-1) / cols) + 1;
      col = mod(path(k)-1, cols) + 1;
      decoded_path(end+1, :) = [lin, col];
    end
end
