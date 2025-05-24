# Prolog Notes:
A `.` closes any statements, like a `;` in CSS or `ENDIF` in pseudocode. Or just like in English.<br>
To define a **predicate**:<br>
In writing, `predicate/arguments` is used.<br>
Example:<Br>
`parent/2`<br>
**parent** is a **predicate** that takes **2** arguments, presumably the child and parent.<br>
Example of defining a **predicate** in Prolog:
```
parent(jeremy, bruno).
% . is needed after defining a predicate
% This predicate is also known as a fact.
```
# Atoms and Variables
An **atom** is an **identifier**. They are written in lowercase or wrapped in `''`.<br>
A **variable** is any possible item. They are written capitalised or start with an underscore.

# Facts vs. Rules
A **fact** is when a **predicate** is created **unconditionally**.<br>
A **rule** is when a **predicate** is created subject to **conditions**.<br>
Fact:
```
parent(childe, anna).
```
This means that Anna is always the parent of Childe.<br>
Rule:
```
sibling(Child1, Child2) :-
    parent(Child1, Parent),
    parent(Child2, Parent),
    Child1 \= Child2.
```
Let's break down the rule:<br>
`:-` means **if**, or **is true when**.<br>
So, it can be read as:<br>
"**Child1** and **Child2** are siblings when **Child1** and **Child2** both have the same **Parent**, and **Child1** is not **Child2**."<br>
Note: half-siblings and step-siblings are included as siblings based off of this.<br>
Let's give a full example:<br>
```
% Facts: parent(Child, Parent)
parent(childe, anna).
parent(jordan, anna).
parent(lima, charlie).
% This means:
% Anna is the parent of Childe.
% Anna is the parent of Jordan.
% Charlie is the parent of Lima.
% We know that this means Childe and Jordan are siblings.
% We also know that Lima is not a sibling to Childe or Jordan.

% Rule: A sibling is true when two children share one or more parents
sibling(Child1, Child2) :-
    parent(Child1, Parent),
    parent(Child2, Parent),
    Child1 \= Child2.
% The '.' signifies the end of the conditions of the Rule.
% Entering 'sibling(childe, jordan).' will return true.
% As the first parent (anna) is iterated over:
% parent(childe, anna). is true
% parent(jordan, anna). is true
% childe \= jordan is true (\= means not equal to)
% As all of the conditions are true, it means that childe and jordan are siblings.
```
# How to use Prolog:
Download: [Prolog](https://www.swi-prolog.org/Download.html)<br>
In the app you should see:<br>
`?- `<br>
This is a Prolog environment, similar to Terminal or Code.exe.<br>
First, a `.pl` file is needed.<br>
Second, use `consult/1` to open the file. (**Reminder**: `consult/1` means a predicate named **consult** which takes **one** argument - is unary.)<br>
`?- consult('siblings.pl').` (**Reminder**: use a `.` after writing the statement to execute what has been written)<br>
This will open the file 'siblings.pl' in the environment.<br>
(Note: You may need to use the full path. To quickly get the full path drag and drop the file in Terminal or Run command window.)<br>
Now, any **predicates** created inside that file can be used.<br>
So, `parent/2` and `sibling/2` can be used.<br>
Prolog will return **true** or **false**.<br>
Examples:<br>
```
?- parent(childe, anna).
true .
?- sibling(childe, jordan).
true .
?- sibling(childe, lima).
false.
```
# Lists
`member/2` is a built in **predicate**.<br>
member(item, List).<br>
<br>
A dynamic list would be:<br>
`list([item1, item2 | V])`<br>
where `V` is any set items onwards, e.g. `V = [item3, sandbag2]`<br>
