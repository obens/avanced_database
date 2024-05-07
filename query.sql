-- Queries
-- https://explain.depesz.com/
-- https://explain.dalibo.com/ (best)// mostrar em formato de arvore
select pid, name from product;
select name, prc from product where pid=1000 or pid=5000;
select name, prc from product where prc > 100;
--
select name, address, age from customer where age>50;
select name from customer where cid=100 or cid=200;
--
select c.name, s.sdate
from   customer c natural join sale s;
--
select c.name, s.sdate
from   customer c natural join sale s
where s.sdata > '01/01/2024';
--
select c.name, c.age, s.sdate
from  sale s natural join customer c
where c.age=18 and s.sdate='10/02/2024';
--
explain analyse select c.name, c.age, s.sdate
from  sale s join customer c
where c.age=30 and s.sdate='10/02/2024';

select p.name, s.sid, s.sdate
from product p natural join sale s
where p.prc < 20;
--
select c.name, s.sid, s.sdate,p.name
from   customer c join sale s on c.cid=s.cid
                  join sale_item si on s.sid=si.sid
                  join product p on si.pid=p.pid
where s.sdate > '01/01/2023';
--
select p.name, count(si.pid)
from   product p natural left join sale_item si
group by p.name;
--
select p.name, count(si.pid)
from   product p natural join sale_item si
where  si.sid in (select sid from sale where sdate between '01/08/2023' and '31/08/2023')
group by p.name;
---
select p.name, count(si.pid)
from   product p natural join sale_item si join sale s on si.sid=s.sid
where  s.sdate between '01/08/2023' and '31/08/2023'
group by p.name;

-- usando CTE
