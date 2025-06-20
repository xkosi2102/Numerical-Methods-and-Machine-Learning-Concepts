function [x, err, steps] = perform_iterative(G, c, x0, tol, max_steps)
	% G -> iteration matrix
	% c -> iteration vector
	% x0 -> initial solution
	% tol -> accepted tolerance (norm of the difference between two solutions)
	% max_steps -> the maximum number of iterations
	
	% x -> final solution
	% err -> last calculated difference (as an euclidean norm)
	% steps -> actual number of steps performed
    err = tol + 1;
    x = x0;
    for steps = 1:max_steps
        
        x_new = G * x + c;
        
        err = norm(x_new - x);
        x = x_new;
        % Verificăm dacă eroarea este sub toleranță
        if err < tol
            break;
        end
    end
end
