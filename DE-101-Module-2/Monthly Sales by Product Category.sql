select EXTRACT(MONTH FROM order_date) as mounth,category,sum(sales ) from orders
group by mounth,category 
order by mounth 
