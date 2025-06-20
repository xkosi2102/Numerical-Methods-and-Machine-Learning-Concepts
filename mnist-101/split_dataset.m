function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  % X -> the loaded dataset with all training examples
  % y -> the corresponding labels
  % percent -> fraction of training examples to be put in training dataset
  
  % X_[train|test] -> the datasets for training and test respectively
  % y_[train|test] -> the corresponding labels
  
  % Example: [X, y] has 1000 training examples with labels and percent = 0.85
  %           -> X_train will have 850 examples
  %           -> X_test will have the other 150 examples

  m = size(X, 1);
  
  perm = randperm(m);
  X = X(perm, :);
  y = y(perm, :);
  
  m_train = floor(percent * m);
  m_test = m - m_train;
  
  X_train = X(1:m_train, :);
  y_train = y(1:m_train, :);
  
  X_test = X(m_train+1:end, :);
  y_test = y(m_train+1:end, :);
  end