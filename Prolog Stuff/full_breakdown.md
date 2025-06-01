```prolog
% Fact: parent(Child, Parent)
parent(childe, anna).
parent(jordan, anna).
parent(lima, charlie).

% Rule: A sibling is true when two children share one or more parents
sibling(Child1, Child2) :-
    parent(Child1, Parent),
    parent(Child2, Parent),
    Child1 \= Child2. % if both inputs were jordan, the result will now be false
```
# Reminders:
- A variable is capitalised or starts with an underscore. (e.g. `Parent`)
- An atom is lowercase or wrapped in quotations `''`. (e.g. `anna`)
# Example 1
```
?- sibling(jordan, childe).
```

- First, Prolog finds all the possible parents of jordan to assign the `Parent` variable.<br>
`parent(jordan, Parent).`<br>
`Parent = anna.`<br>
This returns `parent(Child1, Parent)` as true.<br>
- Then, Prolog uses all the atoms assigned to `Parent` from the first condition to check the second condition.<br>
`parent(childe, Parent), Parent = anna.`<br>
`parent(childe, anna)`<br>
This returns `parent(Child2, Parent)` as **true**.<br>
- It then checks if `Child1` is **not equal to** `Child2`.<br>
`jordan \= childe.`<br>
This returns `Child1 \= Child2` as **true**.<br>
As all terms returned true, this means that `sibling(jordan, childe)` is **true**.

# Example 2
```
?- sibling(childe, lima).
```

- First, Prolog finds all the parents of childe to assign the `Parent` variable.<br>
`parent(childe, Parent).`<br>
`Parent = anna.`<br>
This returns `parent(Child1, Parent)` as **true**.<br>
- Then, Prolog uses all the atoms assigned to `Parent` from the first condition to check the second condition.<br>
`parent(lima, Parent), Parent = anna.`<br>
`parent(lima, anna)`<br>
This is **not** a defined **fact**, so Prolog returns `parent(Child2, Parent)` as **false**.<br>
- As one of the conditions for `sibling(childe, lima)` is **false**, the fact is **false**.
- The third condition is not checked as only one of the conditions need to be false to disprove.
