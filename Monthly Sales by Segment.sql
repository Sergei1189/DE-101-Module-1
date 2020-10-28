select EXTRACT(MONTH FROM order_date) as mounth,segment,sum(sales ) from orders
group by mounth,segment 
order by mounth 