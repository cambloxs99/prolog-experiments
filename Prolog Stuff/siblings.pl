% A sibling is when one or more parents is the same as another
% A capitalised name is a *variable*
% A lowercase name is an *atom*
% Fact: parent(Child, Parent) parent/2
% (This was indicated by the name of the first child)
parent(childe, anna).
parent(childe, jakob).
parent(pepper, gracie).
parent(pepper, lit).
parent(lith, jakob).
parent(lith, amelia).
parent(echo, gracie).
parent(echo, lit).
parent(lit, montigue).
parent(amelia, montigue).

% Childe and Lith are half-siblings
% Echo and Pepper are siblings
% Lit and Amelia are siblings
% Childe and Pepper are not siblings
% Childe and Echo are not siblings
% Pepper and Lith are not siblings
% Anna, Jakob, Gracie, and Montigue are all unknown

% Sibling is when Y's parent is the same as X's parent
% Fact: sibling(sibling1, sibling2)
sibling(ChildA, ChildB) :-
    parent(ChildA, Parent),
    parent(ChildB, Parent),
    % It also checks instances where X == Y, which is unwanted
    % (Because no child is the same person yet.)
    % \= means not equal to
    ChildA \= ChildB.

% A parent is the second argument of the parent/2 predicate
% Rule: parent(Parent)
parent(X) :-
    parent(_, X).

% so, if a person appears as a parent in the parent/2 predicate,
% they will be considered a parent in the unary parent/1 predicate
% e.g. ?- parent(anna). true.

% A person's gender is defined by their choice
% This means a list of names can accurately determine the gender of each person
% Fact: gender(listOfPeopleWithGender)
females([anna, gracie, amelia, pepper]).
males([childe, jakob, lith, montigue, echo]).
others([lit]).
undisclosedGenderList([]).

% Anyone is female IF they are a member in the female list
% Rule: gender(Person) if person in gender's List.
female(Girl) :-
    % this essentially sets the *variable* List to females
    females(List),
    % Built-in predicate finds if Girl (The person) is in List (The list of females)
    member(Girl, List).
% e.g. ?- female(anna). true.
% ?- female(X). X = [anna, gracie, amelia, pepper] true.

male(Boy) :-
    males(List),
    member(Boy, List).
