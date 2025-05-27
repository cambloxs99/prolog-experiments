% check all items in List1 length of all items in List2
% Fact: A list with no a items = a list of no b items
listLength([], []).
% Rule: Two lists of the same length is true when the list can be reduced down to two empty lists.
listLength([_ | TailOfX], [_ | TailOfY]) :-
    listLength(TailOfX, TailOfY).