

-- 1 Which three departments had the highest satification scores, and which three had the lowest satification scores?
SELECT 
	dept,
	round(avg(satisfaction_level),2) as avg_satisfaction
FROM hr_analytics.`employee attrition`
Group by 1
Order by 2 desc;

-- 2. What is the relationship between salary and satisfacion score?

SELECT 
	distinct salary
 FROM hr_analytics.`employee attrition`;  
 
-- 'low'
-- 'medium'
-- 'high'
 
 SELECT 
	salary,
    round(avg(satisfaction_level),2) as avg_satisfaction
 FROM hr_analytics.`employee attrition`
 group by 1
 order by 2;
 
-- 3. How did the top two and bottom two depts perform in the following arears
-- 'support'
-- 'management' top_dept

-- 'hr'
-- 'accounting' lower_dept

-- a. last_evaluation

-- b. number_project

-- c. average_monthly_hours

-- d. time_spend_company

SELECT 
	Case
    when dept in ('support', 'management') then 'top_dept'
    when dept in ('hr', 'accounting') then 'lower_dept'
    end as top_bot,
    count('Emp ID') as num_od_emp,
    round(avg(last_evaluation), 2) as avg_last_evaluation,
	round(avg(number_project), 1) as avg_projects,
	round(avg(average_montly_hours), 2) as hours_worked,
    round(avg(time_spend_company), 2) as time_at_company,
    round(avg(work_accident), 2) as avg_num_accidents,
    round(avg(promotion_last_5years), 2) as avg_num_promotions
FROM hr_analytics.`employee attrition`
where dept in ('support', 'management', 'hr', 'accounting')
group by 1
;

-- e. Work_accident

-- f. promotion_last_5years


