Use CheesecakeFactoryDB 
Go

/*1. Multiple select* queries to display all records from table.*/

select * 
from Customer;

select * 
from Sales;

select * 
from Dish;

select * 
from Employee;

select * 
from Ingredients;

select * 
from IngredientDish;

select * 
from Job;

select * 
from SalesDetail;

select * 
from Store;

select * 
from Supplier;


/*2. A query that uses aggregate function*/
Select sum(Salestotalamount) as Sales_Total_Amount, st.state 
from dbo.sales as sa
join dbo.store as st
on sa.StoreID = st.StoreID 
group by st.state;


/*3. A query that selects records from two (or multiple) tables using INNER JOIN*/

select d.DishName, s.OrderQuantity
from dish as d
inner join salesdetail as s
on d.DishID = s.dishID
order by OrderQuantity desc;

/*4.A query that selects records from two (or multiple) tables using LEFT OUTER JOIN 
(or RIGHT OUTER JOIN or FULL OUTER JOIN). Specify why outer join is neccesary in comment block. 
Make sure your fake data could reflect the necessary. If it could not, you need to go back to part 2
 to redo the data insertion, or you can use INSERT INTO, UPDATE or DELETE statements to modify the existing data.*/

 select SalesDetailID, d.DishID, d.Dishname
 from SalesDetail as s 
 right outer join Dish as d
 on s.DishID = d.DishID;

 /* Right Outer Join is necessary to find which dish was not ordered or in the Sales Detail table. This means that either it is not computed
 or customer have never ordered the dish before.*/

/*5. A query that uses subquery.*/
select avg(SalesTotalAmount) as Avg_of_TotalAmount from Sales;

select s.SalesID, c.CustomerID, c.FirstName, c.LastName, c.BirthDate, s.SalesTotalAmount
from Sales as s
join Customer as c
on c.CustomerID = s.CustomerID
where SalesTotalAmount > (select avg(SalesTotalAmount) as Avg_of_TotalAmount 
from Sales)
order by SalesTotalAmount desc;

/*JBTS by Josephine Boenawan and Theresia Susanto*/