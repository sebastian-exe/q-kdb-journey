/Chapter 3: Lists

/everything in q is basically made of lists
/simple lists are vectors

/3.1 Introduction to list
/general list is an ordered collection of q data
(1;1.1;`1)
(1;2;3)
("a";"b";"c";"d")
(`Life;`the;`Universe;`and;`Everything)
(-10.0;3.1415e;1b;`abc;"z")
((1;2;3);(4;5))
((1;2;3;);(`1;"2";3);4.4)

/lists can be assigned to variables exactly like atoms
L1:(1;2;3)
L2:("z";"a";"p";"h";"o";"d")
L3:((1;2;3);(`1;"2";3);4.4)

/3.1.2 count
/number of items in a list is its count
count (1;2;3)
count L1

/count returns a long equal to the number of items in the list

/count of an atom is 1 even though an atom is not a list
count 42

count `zaphod

/other useful operations
first(1;2;3)
last(1;2;3)

/3.2 Simple Lists
/a list of atoms of a uniform type called a simple list
/corresponds to the mathematical notion of a vector

/3.2.1 Simple Integer Lists
(100;200;300)
100 200 300~(100;200;300)

(1h;2h;3h)
(1;2;3h) /general form
(100i;200i;300i)

/3.2.2 simple floating point lists

