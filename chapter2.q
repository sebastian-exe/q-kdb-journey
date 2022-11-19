/Chapter 2
/atom - irreducible value of a specific data type

/2.1 integer data
/three integer types in q

/2.1.1 Long
/basic integer type is a signed eight byte integer called long
/ex:
42
/j indicates that it is a long but is redundant
42j

/2.1.1 short and int
/short type represents two byte signed integer, requires h trailing
-123h
/int type represents a four byte signed integer, requires i trailing
1234567890i

/2.2 floating point data
/single and double floating point is supported, double is more common

/2.2.1 float
3.14156265
1f
1.0

/float can be specified in scientific notation
1.234e07
1.234e7
1.234e-7

/2.2.2 real
/real represents a single precision four byte floating point number
/aka float in other languages 
12.34e

1.234e7e

/not really used in finance since it does not provide enough
/precision for quantities expressed in currencies such as yen

/2.23 Floating point display

f:1.23456789e-10
r:1.2345678e-10e
f
r
/ \P command specifya display width up to 16 digits 
f12:1.23456789012
f16:1.234567890123456
\P 12
f12
f16
\P 16
f12
f16
\P 0 
1%3

/2.3 Binary Data
/binary data can be represented as bit or byte values
/2.3.1 boolean 
0b
1b

/inplicitly promoted to unsigned integers when participating in arithmetic expresssions
42+1b

3.1415+0b

/2.3.2 byte

0x2a
0x2A

1+0x29

/2.3.3 GUID
/GUID = global unique identifier is a 16 byte binary value
/to generate a list of GUIDS
1?0Ng
2?0Ng
-1?0Ng
-2?0Ng

"G"$"61f35174-90bc-a48a-d88f-e15e4a377ec8"

/convert from a list of 16 bytes using an overload sv
0x0 sv 16?0xff

/2.4 Text Data
/2.4.1 char
"q"

"\"" /double quote
"\\" /backslash
"\n" /newline
"\r" / return
"\t" /horizontal tab

"\142"

/2.4.2 symbol
/a symbol is an atom holding text 
`q
`zaphod

/char "q" and the symbol `kdb are both atomic entities 
/ a symbol is irreducible meaning that the individual characters that
/compromise it are not directly accessible

/a symbol is not a string
`a~"a"

/2.5 temporal data
/2.5.1 date
2015.01.01
2000.01.01 = 0
2000.01.02=1
1999.12.31=-1

/2.5.2 time types
12.34:56.789

12:00:00.000=12*60*60*1000

/underlying milisecond count can be obtained by casting to an int
`int$12:00:00.000

/timespan type
12:34:56.123456789
12:34:56.123456

/underlying nanosecond type can be obtained by casting to a long
`long$12:34:56.123456789

/2.5.3 Date-time types
/timestamp which is a lexical combination of a date and a timespan separated by D
2014.11.22D17:43:40.123465879

/underlying nanosecond count can be obtained by casting to a long
`long$2014.11.22D17:43:40.123456789

/extract the date and timespan constituenets from a timestamp by casting
`date$2014.11.22D17:43:40.123456789
`timespan$2014.11.22D17:43:40.123456789

/2.5.4 month
2015.11m

2001.01m=12

2014.11 /leaving off the type indicator m yields a float

/underlying month count can be obtained by casting to an int
`int$2015.01m

/2.5.5 minute
12:30
12:00=12*60

/underlying minute count can be obtained by casting to an int
`int$12:00

/a minute equals its equivalent time and timestamp counterparts
12:00=12:00:00.000
12:00=12:00:00.000000000

/2.5.6 second
23:59:59
23:59:59=-1+24*60*60

`int$12:34:56
`int$12:34:56.000
`long$12:34:56.000000000

12:34:56=12:34:56.000
12:34:56.000=12:34:56.000000000

/2.5.7 Constituents and dot notation
dt: 2022.01.01
dt.year
dt.mm
dt.dd

ti:12:34:56.789
ti.hh
ti.mm
ti.ss

/avoid dot notation and use cast instead
`dd$dt
`mm$dt
`dd$dt
`month$dt







