% Rule: If List is the same as the reverse of Reversed return true.
% base case: empty list
% So recursion must result in an empty list
list_reversal([], []).
list_reversal([_h | X], R) :-

    list_reversal(X, TailOfR), % TailOfR will recurse until becoming the value of [] as when X = [] TailOfR must be []. 
    append(TailOfR, [_h], R). % The first append starts when TailOfR is [], and _h is the last item in the first list. So R builds up to become what it is.
    % if the appended R (the reverse of the first list) equals the initial R (input) then true.

% Rule: If element is in list return true
% base case: Element is the Element item with whatever else in the list
is_member(Element, [Element | _]). % 2, [2]
% if E is not in the head then we check the tail.
is_member(E, [_ | L]) :-
    member(E, L).

% Find maximum in list:
% base case: the one value in list is max
max([Max], Max). % it should recurse through every item in list first.
max([H | T], Max) :-
    max(T, MaxOfTail),
    (H =< MaxOfTail -> Max = MaxOfTail ; Max = H).
    % so 2 =< Max is true -> Max
% Element, List, Result
% base case: list without E
list_removal(E, [E | T], T).
list_removal(E, [H | T], [H | R]) :-
    E \= H,
    list_removal(E, T, R).
