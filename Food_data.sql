use mini_project;

select * from food_data;

-- Q1	Online food order decision based on customer Age
with cte as(
select *, 
case
when Age < 20 then 'child'
when Age > 20 and age < 25  then 'younger'
when  Age >=25 and age < 30 then  'Adult' 
else 'senior_citigen'
end 
as age_group
   from sql_project)
   select Age_group
   ,count(age_group) order_by_age from cte
   group by 1
   order by 2 desc;
   
  --  Q2	Online food order decision based on size of the family
 
select distinct(family_size) from sql_project;
with cte as (
select *,
case
	when family_size =1 then 'single'
    when family_size =2 then 'couple'
    when family_size >2 and family_size <= 4 then 'nuclear_family'
    else  'join_family'
    end
    as family_wise
    from sql_project)
    select family_wise,count(family_wise) as no_of_orders from cte
    group by 1
    order by 2 desc;
    
-- Q3	Who orders more Male or Female??
 
select * from sql_project;
select gender,count(gender) as total_orders from sql_project
group by 1
order by 2 desc;

-- Q4	Who orders more Married or unmarried??
select Marital_Status,count(Marital_Status) as total_order_by_Married from sql_project
group by 1
order by 2 desc;
 
 -- Q5 Analyze food ordering behaviour across income level

SELECT 
    monthly_income,
    COUNT( monthly_income) AS total_order,
    ROUND((COUNT( monthly_income) * 100.0) / SUM(COUNT( monthly_income)) OVER (), 2) AS percentage
FROM online_food_data
GROUP BY  monthly_income
ORDER BY total_order DESC;

-- Q6 Food ordering pattern based on qualification-- 
select education,count(education) as total_orders from online_food group by 1 order by 2 desc;

-- Q7 Food ordering pattern based on Occupation
select Occupation,count(Occupation) as total_orders from online_food group by 1 order by 2 desc;

-- Q8 Food ordering pattern based on feedback
select feedback,count(feedback) as response from online_food group by 1 order by 2 desc;