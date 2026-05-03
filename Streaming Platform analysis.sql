-- 1. What is the overall churn rate?

SELECT ROUND(AVG(Churn) * 100, 2) AS churn_rate
FROM churn_data;

-- 2. Which contract type has the highest churn?

SELECT Contract, ROUND(AVG(Churn), 2) AS churn_rate
FROM churn_data
GROUP BY Contract
ORDER BY churn_rate DESC;

-- 3. Do customers with higher monthly charges churn more?

SELECT 
  Churn, 
  ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges
FROM churn_data
GROUP BY Churn;

-- 4. Are new customers more likely to churn than long-term customers?
SELECT 
  tenure,
  ROUND(AVG(Churn), 3) AS churn_rate
FROM churn_data
GROUP BY tenure
ORDER BY tenure;

-- 5. Which payment method is associated with the highest churn?
SELECT 
  PaymentMethod,
  ROUND(AVG(Churn), 3) AS churn_rate
FROM churn_data
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;

-- 5. Are customers with multiple services less likely to churn?

SELECT 
  MultipleLines, 
  ROUND(AVG(Churn), 3) AS churn_rate
FROM churn_data
GROUP BY MultipleLines;

-- 7. What is the average revenue lost due to churned customers?

SELECT 
  ROUND(AVG(MonthlyCharges), 2) AS avg_revenue_lost
FROM churn_data
WHERE Churn = 1;

-- 8 . Which customers are considered high-risk based on churn patterns?

SELECT *
FROM churn_data
WHERE Churn = 1
AND tenure < 12
AND Contract = 'Month-to-month';

-- 9 . Does internet service type affect churn? (like streaming quality)
SELECT 
  InternetService, 
  ROUND(AVG(Churn), 3) AS churn_rate
FROM churn_data
GROUP BY InternetService
ORDER BY churn_rate DESC;

-- 10. Do customers using both StreamingTV and StreamingMovies churn less?
SELECT 
  StreamingTV,
  StreamingMovies,
  ROUND(AVG(Churn), 3) AS churn_rate
FROM churn_data
GROUP BY StreamingTV, StreamingMovies;