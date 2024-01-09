reverse_list([],[]).
reverse_list([Head|Tail],Reverse):-
    reverse_list(Tail,ReverseList),
    append(ReverseList,[Head],Reverse).

main :-
    read(Input),
    reverse_list(Input, Output),
    write(Output), nl.

