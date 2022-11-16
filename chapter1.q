/ 1.1 starting q
6*7
"c"$0x57656c6c20646f6e6521

/ 1.2 Variables 
a:42
a

/ 1.3 Whitespace, usually avoid
a:42

/ 1.4 The Q console, evaluates the a q expression and then
/echos it on the follwing line

/ 1.5 whitespace 
b:1+a:42
a:42 / intended to be a comment

/1.6 Assignment 
1+a:42
/value of a is propogated onward
b:1+a:42

/1.7 Order of Evaluation
/read q expressions from left to right

/1.8 Data Types 101
/basic data type is an integer type called long, 64-bit signed
42

/float
98.6

/divison = %, always results in a float

2+3

2.2*3.0

4-2

4%2

/Boolean values, 
42=40+2 /outputs 1b
43=42 /outputs 0b

/dates and timespan
/start from the milllennium, positive for post and negative for pre
2000.01.01 /is actually 0
2014.11.19 /is actually 5436
1999.12.31 /is actually -1

12:00:00.000000000 /this is noon

/since dates are integers under the hood, its easy to perform arthmetic
2000.01.01+5

/advance time by one microsecond 
12:00:00.000000000+1000

/verify that temporal values re indeed their underlying values
2000.01.01=0
12:00:00.000000000=12*60*60*1000000000

/Symbols
/all q names are symbols but not all symbols are names
`aapl
`jab
`thisisareallylongsymbol

/since symbols are atoms, any two canbe tested for equality
`aapl=`apl

/1.9 Lists
/fundamental q data structure
(1;1.2;`one)

/A few notes on Lists
/ 1) a list can contain items of different type
/ although mixed type lists should be avoided (slower processing)

/ 2) no need to build up the list by coning one item at a time 
/ lists are not stored as singly-linked lists under the covers

/Simple list = homogenous list of atoms ex:
(1; 2; 3)
(1.2; 2.2; 3.3)
(2000.01.01; 2000.01.02; 2001.01.03)

/single list of booleans, juxtaposed with no spaces 
(1b;0b;1b) 

/simple list of symbols
(`one;`two;`three)

/til
til 10

1+til 10

/first 10 even numbers
2*til 10

/first 10 odd numbers
1+2*til 10

/first 10 even numbers starting at 42
42+2*til 10

/ join = ,
1 2 3, 4 5

1 2 3, 100

0, 1 2 3

/take operator = #
/positive argument means take from the front
/negative argument means take from the back

2#til 10
-2#til 10 

/# will wrap around the list if you extract more
/items than are in the list
5#42

/assignment of a list
L: 10 20 30

/items being accessed 
L[0]
L[1]
L[2]

/1.10 Functions 101
{[x]x*x}

sq:{[x]x*x}

/function that takes two input values and returns 
/the sum of their squares
{[x;y]a:x*x; b:y*y; a+b}

pyth: {[x;y]a:x*x; b:y*y; a+b}

{[x]x*x}[5] /returns 25

sq[5] /returns 25, defined in line 140

{[x;y] a:x*x; b:y*y; a+b}[3;4] /returns 25

pyth[3;4] /returns 25

/no stinkin' brackets for application of a unary funtion
{x*x}5
f:{x*x}
f 5

/1.11 Funtions on Lists 101
42+100 200 300 /ouput 142 242 324

100 200 300+1 2 3 /output 101 202 303

100=99 100 101 /output: 010b
100 100 100=100 101 102 /100b
100<99 100 101 /001b

/adds across the list
0 +/ 1 2 3 4 5

/adds all the numbers that count to 100
0 +/ 1+til 100

0 {x+y}/ 1 2 3 4 5

0 {x+y}/ 1+til 100

/sometimes you don't need to specify the first value
(+/) 1 2 3 4 5

(+/) 1+til 100

/gets rid of the scaffolding of traditional for loops

/factorial
(*/) 1+til 10

/ | returns the larger of its operands
42|98

/& returns the smaller of its operands
42&98

/combine | or & with Over(/), now have max or min
(|/) 20 10 40 30
(&/) 20 10 40 30 

