% Rule: sum(X, Y, Z) is true when X + Y = Z.
sum(X, Y, Z) :-
    Z is X + Y,
    format('~w + ~w = ~w', [X, Y, Z]).

% BASE CASE: List1 is an empty list and thus the appended list is all the values of List2.
% The rule reduces to base case, when base case is true the recursion ends.
% This is how the append/3 predicate already functions
append3([], List2, List2).
append3([FirstValue | List1], List2, [FirstValue | List1AndList2]) :-
    append3(List1, List2, List1AndList2).
