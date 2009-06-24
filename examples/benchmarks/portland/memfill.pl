:- dynamic n/1.
:- dynamic the_memory_filler_statement/1.

/*  VAX C-Prolog Benchmark Package  */
/*  Copyright 1985 by Tektronix, Inc., and Portland State University  */

memfill(Limit) :-
	abolish(the_memory_filler_statement/1),
	abolish(n/1),
	assert(n(0)),
	repeat,
	retract(n(N)),
	assert(the_memory_filler_statement(N)),
	N1 is N+1,
	assert(n(N1)),
	N1=Limit.

