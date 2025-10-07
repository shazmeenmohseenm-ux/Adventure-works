use AdventureWorks;
CALL AdventureWorks.Name_Change('copy of fact_internet_sales_new' ,'Sales_new_Table');
drop procedure rename_table;
show tables;
describe customertable;
describe salestable;
/*where clause*/
select distinct (productkey),unitprice 
from salestable 
where productkey in(353,537,490,225);
/* union of sales and salesnewtable*/
create table Salesnewtable as 
select * from salestable
union 
select * from salesnewtable;
/* totalsales as sales amount*/
select s.SalesorderNumber,
       sum(ifnull(unitprice,0)*
		ifnull(orderquantity,0)) as salesamount,
       s.customerkey,
       c.firstname,
       c.lastname 
       from salestable s join customertable c on s.customerkey=c.customerkey
       group by salesamount, s.SalesorderNumber,s.customerkey,
       c.firstname,
       c.lastname  Limit 10;
       describe producttable;
       /*view*/
       select * from totalavgsales;
       /*average order by customers*/
     create view  averagesales as
     select c.customerkey ,
              c.firstname,
               c.lastname,
             avg(ifnull(unitprice,0)*ifnull(orderquantity,0)) as totalavgsales
               from salestable s join customertable c
               on s.customerkey = c.customerkey
               group by  c.customerkey,c.firstname,c.lastname
               order by totalavgsales
               limit 10;
               /* totalsales by productkey*/
               select productkey ,sum(ifnull(unitprice,0)*
                                      ifnull(orderquantity,0)) as totalsales
                                      from salestable
                                      group by productkey;
                                
use adventureworks;
Alter table salestable 
add column salesamount decimal(10,2);
select t.salesterritorycountry,
        v.salesterritorykey,
        v.productkey,
        v.totalsales
        from topselling_products_byterritory v join territorytable t 
        on v.salesterritorykey = t.salesterritorykey order by totalsales desc;
        SELECT * FROM topselling_products_byterritory
        where totalsales is not null limit 10;
        /* joins*/
        select ProductKey,unitprice,orderedquantity,productenglishname from 
        salestable join producttable on s.ProductKey = p.ProductKey limit 20;
        /*add constraints*/
        alter table salestable 
        add constraint  primary key (SalesOrderNumber);
        use AdventureWorks;
        describe salestable;
        /*add column*/
        alter table salestable add column salesid  int auto_increment
        primary key ;   
        
        select * from salestable;
        alter table salestable modify column SalesOrderNumber varchar(20);
        