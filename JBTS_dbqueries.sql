Use CheesecakeFactoryDB 
Go

/*1. Multiple select* queries to display all records from table.
Description: These are all data provided by each table in the ERD.*/

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


/*2. A query that uses aggregate function
Description: This query shows the sum of sales by each store in each state.
We want to look at which state is generating the most revenue.*/
Select sum(Salestotalamount) as Sales_Total_Amount, st.state 
from dbo.sales as sa
join dbo.store as st
on sa.StoreID = st.StoreID 
group by st.state;


/*3. A query that selects records from two (or multiple) tables using INNER JOIN
Description: We want to know which dish is the most popular,
which has the highest order quantity. The most popular dish is 
Chicken Piccata. */

select d.DishName, s.OrderQuantity
from dish as d
inner join salesdetail as s
on d.DishID = s.dishID
order by OrderQuantity desc;

/*4.A query that selects records from two (or multiple) tables using LEFT OUTER JOIN 
(or RIGHT OUTER JOIN or FULL OUTER JOIN). Specify why outer join is neccesary in comment block. 
Make sure your fake data could reflect the necessary. If it could not, you need to go back to part 2
 to redo the data insertion, or you can use INSERT INTO, UPDATE or DELETE statements to modify the existing data.
 
 Description: We want to know which dish is not being ordered or may not be computed correctly, which 
 is probably the least popular dish. We can also look for errors, which 
 we can do by using FULL OUTER JOIN. In this case, there are 
 no errors, but we chose RIGHT OUTER JOIN to show the NULL in the 
 SalesDetailID. */

 select SalesDetailID, d.DishID, d.Dishname
 from SalesDetail as s 
 right outer join Dish as d
 on s.DishID = d.DishID;

/*5. A query that uses subquery.
Description: It shows which customer is generating the most 
revenue for CheeseCake Factory. However, this knowledge can  
depend on the frequency of the customer going in and the dishes they order.
E.g. Higher priced dishes ordered by customer may generate high revenue, but frequent 
customers may generate higher revenue as well. */
select avg(SalesTotalAmount) as Avg_of_TotalAmount from Sales;

select s.SalesID, c.CustomerID, c.FirstName, c.LastName, c.BirthDate, s.SalesTotalAmount
from Sales as s
join Customer as c
on c.CustomerID = s.CustomerID
where SalesTotalAmount > (select avg(SalesTotalAmount) as Avg_of_TotalAmount 
from Sales)
order by SalesTotalAmount desc;


/*JBTS by Josephine Boenawan and Theresia Susanto*/