Numerical Methods and Machine Learning Concepts
MATLAB Project


Quick description: Markov chains modeled via sparse adjacency and link matrices, solved with the Jacobi iterative method. Heuristic greedy search for pathfinding using state probabilities. Multiple linear regression (gradient descent, normal equations, conjugate gradient) with L1/L2 regularization. Logistic regression and a simple neural–network classifier on the MNIST dataset (forward propagation, backpropagation).



In this project various linear regression algorithms and neural networks will be used to solve specific problems.
This helps familiarize with the Matlab language and basic theoretical notions in multiple machine learning and AI subjects.

In its implementation various Matlab functions were used, as well as auxiliary functions (i.e., functions that help solve a specific task), for good practice, meaning easier understanding of the implementations and achieving a consistent coding style.

Structure
1. markov-is-coming
Maze traversal and encoding:
parse_labyrinth.m
reads the maze dimensions from a text file and initializes a matrix of zeros.
populates the matrix by reading the maze from the text file, element by element.

get_adjacency_matrix.m
creates an adjacency matrix of the maze. reads the dimensions of the matrix received as argument.
initializes an adjacency matrix with the corresponding dimensions, containing all transition states to other matrix elements.
iterates through each element with the respective encoding and adds it to the adjacency matrix.

get_link_matrix.m
receives the adjacency matrix and checks if there is a transition to other matrix elements.
counts transitions and divides each element in the row by the number of transitions to other elements.

get_Jacobi_parameters.m
receives the link matrix and calculates the parameters for the Jacobi method.

perform_iterative.m
applies the Jacobi method. err is initialized at the beginning and a for loop runs for the desired number of steps.
at each iteration the error and solution are updated; if err is less than the tolerance, the iteration stops.

heuristic_greedy.m
finds an approximate path from a start node to WIN by choosing at each step the neighbor with the highest probability.
starts from a node, checks neighbors’ probabilities, and saves the index of each neighbor whose probability exceeds the current one.
advances to the next node and repeats until reaching WIN or no neighbors remain.

decode_path.m
initializes a vector with no initial dimensions, updated at each path decoding.
divides each element by the number of columns—the quotient represents the row and the remainder the column.
checks if the current element is WIN, and if so, stops the iteration.

2. linear-regression
Linear regression algorithms and data processing:

parse_data_set_file.m
auxiliary functions created for better understanding of the data and its processing.
reads the matrix dimensions and reads data from the TXT file, each line into a cell array, then populates the initial matrix with the read data.

parse_csv_file.m
same as parse_data_set_file.m but for a CSV file, using comma as delimiter and populating the matrix similarly.

prepare_for_regression.m
transforms InitialMatrix into a numeric FeatureMatrix:
• encodes dummies for category membership (furnished, semi-furnished, unfurnished)
• converts “yes”/“no” into 1/0
• preserves numeric values

normal_equation.m
attempted implementation, but couldn’t perfect it to be correct.
output values were very close to the reference but the code issue was not identified.

gradient_descent.m
optimizes parameters Θ using gradient descent.
calculates predictions and gradients each step, updating theta at each iteration.

linear_regression_cost_function.m
calls the auxiliary cost function and calculates the sum. determines the number of values in the vector and computes the error.
sum_of_cost expands the feature matrix by adding a column of ones for the bias term and iterates through each example:
for each row it computes the prediction via dot product with theta, subtracts the real y value, squares the difference, and adds it to the total sum.

lasso_regression_cost_function.m
calculates the average cost with L1 penalty. determines the length of y and computes predictions.
iterates through each example to add the squared error to the sum; then l1_penalty computes the L1 norm by multiplying lambda with the sum of absolute values of theta’s elements.

ridge_regression_cost_function.m
first determines m as the length of the y vector, then calls sum_of_costs to process the matrix.
iterates through each example to accumulate the square of the difference between the dot product of the row and theta prediction and the real value.

3. mnist-101
Neural network exercises on the MNIST dataset:

load_dataset.m
reads the file content into a temporary structure called file, then extracts X and y from file.X and file.y.

split_dataset.m
splits the data into training and test sets. first finds m as the total number of examples, then generates a random permutation of indices with randperm and applies it to X and y to shuffle the data.

predict_classes.m
by calling compute_thetas, splits the weights vector into theta1 and theta2 corresponding to connections between the input and hidden layers; for each example chooses the class with the maximum probability in a3 using max on each row, resulting in the classes vector.

cost_function.m
first compute_thetas reconstructs theta1 and theta2 from params. cross_entropy_function computes the cross-entropy cost and partial gradients grad1_partial and grad2_partial without regularization. regularization_function computes the L2 regularization on theta1 and theta2. the total cost J is the sum of cross-entropy and regularization. gradients grad1 and grad2 are initialized with the partials, and finally grad is formed by concatenating them for use by fmincg.

initialize_weights.m
initializes weights with random values in the interval [-epsilon_init, epsilon_init]
