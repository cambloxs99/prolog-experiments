% the derivative of a curve can be looped through each value in the curve (e.g. x^2, x, c)
head_tail([H | T], H, T).
% A polynomial curve is developed when the leading coefficient of any value except n=1 and the constant are a value not equal to 0.
polynomial_curve([1, 0, 1]). % 1x^2 + 0x + 1
polynomial_curve([7, 1, 0, 0]). % 7x^3 + 1x^2 + 0x + 0
% base case wouldn't be worth applying as if the coefficient is 0 the case would pass true
% but the base case would be: polynomial_curve([_, _, _]).
% base case can be added if remove trailing 0s is used.
% only curves above x^1
polynomial_curve([Coefficient | Rest]) :-
    (Coefficient \= 0 ->
        length([Coefficient | Rest], Length),
        (Length > 2 ->
            true ;
            fail
        );
        polynomial_curve(Rest)
    ).

remove_trailing_0s([Coefficient | Rest], New) :-
    (Coefficient \= 0 ->
        New = [Coefficient | Rest] ;
        remove_trailing_0s(Rest, New)
    ).

% the derivative of the polynomial_curve([1, 0, 1]) would be [2, 0].

derivative(D, C) :-
    remove_trailing_0s(D, Dn),
    remove_trailing_0s(C, Cn),
    derivative_without_potential_trailing_0s(Dn, Cn).

% base case: derivative of a constant term which is none
derivative_without_potential_trailing_0s([], [_]).
derivative_without_potential_trailing_0s([D | Dr], [C | R]) :-
    length([C | R], N), % exponent
    D is (N - 1) * C,
    derivative_without_potential_trailing_0s(Dr, R).

% ?- derivative([6, 6, 2], X) fails as constant cannot be found
% only two values or y = mx + c, y = c
not_curve([_, _]).
not_curve([_]).
not_curve([]).
% when only the last two values are more than 0 the polynomial is not a curve
