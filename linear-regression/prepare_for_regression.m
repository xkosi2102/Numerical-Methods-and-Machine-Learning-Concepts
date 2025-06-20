function FeatureMatrix = prepare_for_regression(InitialMatrix)
  % InitialMatrix -> the matrix that must be transformed
  % FeatureMatrix -> the matrix with all training examples

  [m, n] = size(InitialMatrix);
  FeatureMatrix = zeros(m, n+1);

  for i = 1:m
    colIdx = 1;
    for j = 1:n
      current_element = InitialMatrix{i,j};
      if ischar(current_element)
        switch current_element
          case 'semi-furnished'
            FeatureMatrix(i, colIdx) = 1;
            FeatureMatrix(i, colIdx+1) = 0;
            colIdx = colIdx + 2;
          case 'unfurnished'
            FeatureMatrix(i, colIdx) = 0;
            FeatureMatrix(i, colIdx+1) = 1;
            colIdx = colIdx + 2;
          case 'furnished'
            FeatureMatrix(i, colIdx) = 0;
            FeatureMatrix(i, colIdx+1) = 0;
            colIdx = colIdx + 2;
          case 'yes'
            FeatureMatrix(i, colIdx) = 1;
            colIdx = colIdx + 1;
          case 'no'
            FeatureMatrix(i, colIdx) = 0;
            colIdx = colIdx + 1;
          otherwise
            FeatureMatrix(i, colIdx) = str2double(current_element);
            colIdx = colIdx + 1;
        end
      else
        FeatureMatrix(i, colIdx) = current_element;
        colIdx = colIdx + 1;
      end
    end
  end
end