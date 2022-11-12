n:1000000
item:`apple`banana`orange`pear
city:`beijing`chicago`london`paris
tab:([]time:asc n?0D0;n?item;amount:n?100;n?city)

/select all rows from table where the item sold is banana 
select from tab where item=`banana

/aggregate query
select sum amount by city from tab

/time series aggregated query
select sum amount by time.hh,item from tab 
