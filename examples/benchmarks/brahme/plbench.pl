%%% A short post of benchmarks by Brahme

/* 
 CHANGELOG by M.Banbara 
   - my_member/2 is add.
*/

my_member(X, [X|_]).
my_member(X, [_|Ys]) :- my_member(X, Ys).

/*
From honeydew.srv.cs.cmu.edu!das-news.harvard.edu!noc.near.net!howland.reston.ans.net!vixen.cso.uiuc.edu!sdd.hp.com!decwrl!decwrl!netcomsv!netcom.com!brahme Wed Sep 15 17:25:28 EDT 1993
Article: 8544 of comp.lang.prolog
Xref: honeydew.srv.cs.cmu.edu comp.lang.prolog:8544
Newsgroups: comp.lang.prolog
Path: honeydew.srv.cs.cmu.edu!das-news.harvard.edu!noc.near.net!howland.reston.ans.net!vixen.cso.uiuc.edu!sdd.hp.com!decwrl!decwrl!netcomsv!netcom.com!brahme
From: brahme@netcom.com (brahme)
Subject: benchmarking prolog systems: Here is one small program
Message-ID: <brahmeCDD9I4.645@netcom.com>
Organization: NETCOM On-line Communication Services (408 241-9760 guest)
Date: Tue, 14 Sep 1993 23:06:03 GMT
Lines: 31
*/

%% Here are a few predicates which can be used to benchmark
%% various prolog systems. This would test the prolog systems management of
%% program space. This is the space typically used by asserts and retracts
%% as well as built_ins like findall. Also comparing the times with g1 would 
%% indicate  the overhead of findall and assert/retracts

%% It would nice if people could develop such small benchmarks which 
%% test parts of various prolog systems that are not covered by the 
%% existing benchmarks.


g1(N, L) :- length(L, N), same_value(L, e).

g2(0) :- !.
g2(N, A) :- N > 0, A = e.
g2(N, A) :- N > 0, N1 is N - 1, g2(N1, A).

g1f(N, Es) :- 
	g1(N, L), 
	findall(E, my_member(E, L), Es).

g2f(N, Es) :- 
	g2(N, A), findall(A, g2(N, A), Es).

g2a(N) :-
	asserta(g2_ans([])),
	g2(N, A), retract(g2_ans(List)), asserta(g2_ans([A|List])), fail.
g2a(N) :- retract(g2_ans(List)).

same_value([], _E).
same_value([E|R], E) :- same_value(R, E).



