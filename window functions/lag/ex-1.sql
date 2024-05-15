SELECT 
    ROUND(SUM(amount),2), DATE(payment_date) As day,
    LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date)) AS previous_day,
    SUM(amount) - LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date)) AS diff,
    ROUND((SUM(amount) - LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date))) / (LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date))) * 100, 2) AS percentage_growth
FROM 
    payment
GROUP BY 
    day 
