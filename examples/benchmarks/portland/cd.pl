/*  VAX C-Prolog Benchmark Package  */
/*  Copyright 1985 by Tektronix, Inc., and Portland State University  */

/*  cd(Up,Down) counts down from Up to Down  */

cd(X, X).

cd(Up, Down) :-
	X is Up-1, 
	cd(X,Down).

