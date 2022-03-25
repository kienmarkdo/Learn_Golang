
makeGroup([T|[]]) :- writeln([T]), !.
makeGroup([T|Q]) :- makeGroup(Q), writeln([T|Q]).

/*
?- makeGroup([h,e,l,l,o]).
[o]
[l,o]
[l,l,o]
[e,l,l,o]
[h,e,l,l,o]
true.
*/