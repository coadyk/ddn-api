.separator ,

select strftime("%Y-%m-%d",ts,'unixepoch') as mydt, max(temperature) from temperatures group by mydt;
