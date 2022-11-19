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

/ +/
sum 1+til 10

/ */ , note that it is missing "o"
prd 1+til 10

/ |/
max 20 10 50 30 

/&/
min 20 10 40 30

/ converts a binary function into a unary aggregate function
/one that collapses a list to an atom


(*/) 2#1.4142135623730949

n:5

(*/) n#10

/scan = \ 
/same as over, but returns all of the intermediate values
(+\) 1+til 10 /1 3 6 10 15 21 28 36 45 55

(*\) 1+til 10 /1 2 6 24 120 720 5040 40320 362880 3628800

(|\) 20 10 40 30 /20 20 40 40

(&\) 20 10 40 30 /20 10 10 10

/common applications of scan
sums 1+til 10 / this is +\

prds 1+til 10 / this is *\ 

maxs 20 10 40 30 / this is |\

mins 20 10 40 30 / this is &\

/1.12 Fibonaci Numbers
F0: 1 1 

-2#F0

sum -2#F0

F0, sum -2#F0

/declarative programming, say what to do not how to implement it

/fib function
{x,sum -2#x}

{x,sum -2#x}[1,1]

{x,sum -2#x}[1,1,2]

/ "/" overload function, specify base case, and number of times
/to iterate
10 {x,sum -2#x}/ 1 1

/1.13 Example: Newton's Method for nth roots skip for now
x0:1.0 /base case

/first approximation
x0-((x0*x0)-2)%2*x0

/abstract function that computes the n+1 approximation in terms of xn
{[xn] xn-((xn*xn)-2)%2*xn}

/using it to run the first two iterations 
{[xn] xn-((xn*xn)-2)%2*xn}[1.0]
{[xn] xn-((xn*xn)-2)%2*xn}[1.5]

/overload functon that applies the function recursively
{[xn] xn-((xn*xn)-2)%2*xn}/[1.5]

/to witness convergence, set floating point display to maximum
\P 0 / note upper case P

/2- switch the iterator from over to scan so that we can see results 
{[xn] xn-((xn*xn)-2)%2*xn}\[1.0]

{[c; xn] xn-((xn*xn)-c)%2*xn}

{[c; xn] xn-((xn*xn)-c)%2*xn}[2.0;]

{[c; xn] xn-((xn*xn)-c)%2*xn}[2.0;]/[1.0]

{[p; c; xn] xn-(((*/)p#xn)-c)%p*(*/)(p-1)#xn}

{[p; c; xn] xn-(((*/)p#xn)-c)%p*(*/)(p-1)#xn}[2; 3.0;]/[1.0]

{[p; c; xn] xn-(((*/)p#xn)-c)%p*(*/)(p-1)#xn}[5; 7.0;]/[1.0]

/It is amazing what can be done in a single line of code when you strip out unnecessary programming frou-frou. Perhaps this is intimidating to the qbie, but now that you have taken the blue pill, you will feel right as rain

/1.14 Example: Fifo Allocation: skip for now
buys:2 1 4 3 5 4f

sell:12f

sum buys

/make the sequence level off at the sell amount
sell&sums buys

/built in function that returns the successfive differences of a numeric list
deltas 1 2 3 4 5 

deltas 10 15 20 

deltas sell&sums buys 

buys: 2 1 4 3 5 4f
sells: 2 4 3 2 

sums[buys]
sums[sells]

/cap each cumulative buy with each cumulative sell
2&sums[buys]

6&sums[buys]

9&sums[buys]

11&sums[buys]

sums[sells] &\: sums[buys]

/deltas to unwind in a vertical direction
deltas sums[sells]&\:sums[buys]

(1 2 3; 10 20)

count(1 2 3; 10 20)

count each(1 2 3;10 20)

deltas each deltas sums[sells]&\:sums[buys]

/1.15 Dictionaries and Tables 101
/Dictionaries are modeled after key value pairs
/key!value
`a`b`c!10 20 30

d:`a`b`c!10 20 30

d[`a]

`c1`c2!(10 20 30;1.1 2.2 3.3)

dc:`c1`c2!(10 20 30;1.1 2.2 3.3)

dc[`c1][0]

dc[`c2][1]

/indexing at depth
dc[`c1;0]
dc[`c1;1]
dc[`c1;2]

/elided
dc[`c1;]

dc[`c2;]

dc[;0]

dc[;1]

dc[;2]

/flip operator
t:flip `c1`c2!(10 20 30; 1.1 2.2 3.3)

t[0; `c1]
t[1; `c1]
t[2; `c2]
t[0; `c2]
t[; `c2]
t[0;]

/flipped column dictionary called a table is a first class entity in q

t[0]
t[1]
t[2]

/a table is a flipped column dictionary
/it is also a list of record dictionaries 

([] c1: 10 20 30; c2: 1.1 2.2 3.3)

/square brackets are necessary to differentiate a table from a list
/: above is not assignment, it is merely a syntactice marker separating the name from the column
/column names in table definition are not symbols

/1.16 qsql
/fundamental q-sql operation is the select template
t:([] c1:1000+til 6; c2:`a`b`c`a`b`c;c3:10*1+til 6)

select from t

select c1, val:2*c3 from t

t:([] c1:1000+til 6; c2:`a`b`c`a`b`a; c3:10*1+til 6)

select count c1, sum c3 by c2 from t

/?
select count c2 by ovrund:c3<=40 from t

update c3:10*c3 from t where c2=`a

/sort a table ascending by columns 
`c2 xasc t

/example 1.17 trades table

/? generates pseudo random data
10?20

/randomly generate 10 floats between 0.0 and 100.0
10?100.0

/make 10 random selections from the items in a list 
10?`aapl`ibm

/construct a list of 1,000,000 random dates in the month of jan 2015
dts:2015.01.01+1000000?31

/next a list of a 1,000,000 timespans
tms:1000000?24:00:00.000000000

/list of a 1,000,000 tickers chosen from appl goog and ibm
syms:100000?`aapl`goog`ibm

/a list of 1,000,000 volumes given as positive lots of 10
vols:10*1+1000000?1000

/create a list of 1,000,000 prices in cents unfiromly distributed within
/10% of 100.0
pxs: 90.0+(1000000?2001)%100

dts:2015.01.01+1000000?31
tms:1000000?24:00:00.000000000
syms:1000000?`aapl`goog`ibm
vols:10*1+1000000?1000
pxs:90.0+(1000000?2001)%100
trades:([] dt:dts; tm:tms; sym:syms; vol:vols; px:pxs)
5#trades

/sort trades in temporal order
trades:`dt`tm xasc trades

/adjust the prices for goog and ibm by scaling
trades:update px:6*px from trades where sym=`goog
trades:update px:2*px from trades where sym=`ibm

5#trades

/perform some basic queries as sanity checks
select avg px, avg vol by sym from trades

/we expect the minimum and max price for each sym to
/be the end points of the uniform range
select min px, max px by sym from trades

/calculate vwap
5 xbar til 15
/left operand of xbar = interval width
/right operand of xbar =  list of numerical values

/also require wavg a binary function that computes the average 
/of numerical values in its right operand weighted by the values of its left operand
1 2 3 wavg 50 60 70

select vwap:vol wavg px by sym,bkt:100000000 xbar tm from trades

/vwap is the price weighted by the volume averaged out, then bucketed
/into 100-millisecond buckets 

select max px-mins px from trades where sym=`aapl

/1.18 file i/o 101
"a"
" "
"_"

/"a" is an atom, but not the same as symbol `a

("s";"t"; "r"; "i"; "n"; "g")

count "string"

count `string