function [Y, InitialMatrix] = parse_data_set_file(file_path)
  % path -> a relative path to the .txt file
  % Y -> the vector with all actual values
  % InitialMatrix -> the matrix that must be transformed
  
  matrix_details = convert_to_matrix_txt(file_path);
  file_matrix = matrix_details.matrix;
  nr_rows = matrix_details.nr_rows;
  nr_cols = matrix_details.nr_cols;

  Y = zeros(nr_rows, 1);
  InitialMatrix = cell(nr_rows, nr_cols);

  for i = 1:nr_rows
    Y(i) = str2double(file_matrix{i, 1});
    for j = 1:nr_cols
      InitialMatrix{i, j} = file_matrix{i, j + 1};
    end
  end
end


function [matrix_with_dimensions] = convert_to_matrix_txt(file_path)
  file = fopen(file_path, 'r');
  header = fgetl(file);
  matrix_size = sscanf(header, '%d %d');
  nr_rows = matrix_size(1);
  nr_cols = matrix_size(2);

  full_matrix = cell(nr_rows, nr_cols + 1);

  for i = 1:nr_rows
    line = fgetl(file);

    values = strsplit(strtrim(line));

    for j = 1:(nr_cols + 1)
      full_matrix{i, j} = values{j};
    end
  end

  fclose(file);

  matrix_with_dimensions.matrix = full_matrix;
  matrix_with_dimensions.nr_rows = nr_rows;
  matrix_with_dimensions.nr_cols = nr_cols;
end