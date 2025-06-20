function [Y, InitialMatrix] = parse_csv_file(file_path)
  % path -> a relative path to the .csv file
  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed
  
  matrix_details = convert_to_matrix(file_path);
  file_matrix = matrix_details.file_matrix;
  nr_rows = matrix_details.nr_rows;
  nr_cols = matrix_details.nr_cols;

  % Extrage antetul (numele coloanelor)
  header = file_matrix(1, :);

  % Inițializează vectorul Y și matricea
  Y = zeros(nr_rows - 1, 1); % vector numeric
  InitialMatrix = cell(nr_rows - 1, nr_cols - 1); % matrice celule

  for i = 2:nr_rows
    % Convertim prima coloană (Y)
    Y(i - 1) = str2double(file_matrix{i, 1});
    for j = 2:nr_cols
      InitialMatrix{i - 1, j - 1} = file_matrix{i, j};
    end
  end
end


function [matrix_with_dimensions] = convert_to_matrix(file_path)
  fid = fopen(file_path, 'r');

  data = {};
  line = fgetl(fid);
  while ischar(line)
    values = strsplit(line, ',');
    data(end + 1, :) = values;
    line = fgetl(fid);
  end
  fclose(fid);

  [nr_rows, nr_cols] = size(data);

  matrix_with_dimensions.file_matrix = data;
  matrix_with_dimensions.nr_rows = nr_rows;
  matrix_with_dimensions.nr_cols = nr_cols;
end