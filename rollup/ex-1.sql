SELECT 
	EXTRACT(QUARTER from book_date) AS quarter,
	EXTRACT(MONTH from book_date) AS month,
	TO_CHAR(book_date,'w') AS week,
	--CEIL(EXTRACT(DAY FROM book_date) / 7.0) AS week, differente way to find out the week in month 
	DATE(book_date) AS day,
	SUM(total_amount)
FROM 
	bookings
GROUP BY ROLLUP
	(quarter, month, week, day)
ORDER BY
	1, 2, 3, 4
	