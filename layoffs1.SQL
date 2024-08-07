-- This project is about to data claeaning using sql
-- STEPS TO DATA CLEANING....
-- 1. REMOVE DUPLICATE DATA
-- 2. STANDARDIZE THE DATA 
-- 3. REMOVE NULL VALUE AND POPULATE MISSUNG DATA 
-- 4. REMOVE ANY UNWANTED COLUMNS

-- STEP.1 REMOVE DUPLICATE DATA..





with duplicate_row as
(
select * ,
row_number() over(partition by location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from project
)


select * from duplicate_row
where company='oda'

insert into project2
select * ,
row_number() over(partition by location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from project;
 
 delete from project2
 where row_num >1;
 
 -- WE ARE DONE .........
--  .........................................................STEP.2 STANDRADIZING DATA...................................................
  
  
  select  company, TRIM(COMPANY) from project2

UPDATE PROJECT2 
SET company=  TRIM(COMPANY) ;

 select distinct industry from project2
  order by 1;
  update  project2
  set company= TRIM(COMPANY);  

select  distinct industry from project2


select  distinct industry from project2
order by 1;

 update project2
 set industry ='crypto'
 where industry like 'crypto%';

 UPDATE PROJECT2
 SET COUNTRY=TRIM(TRAILING '.' FROM COUNTRY) 
WHERE COUNTRY LIKE 'UNITEDSTATES%' ;

UPDATE PROJECT2
SET `date` = STR_TO_DATE(`date`, '%y/%m/%d');

alter table project2
modify column `date` date;
-- ................................3. REMOVE NULL VALUE AND POPULATE MISSUNG DATA ........................
update project2
set industry=''
where industry=null

update project2 t1
join project2 t2
on t1.company=t2.company
SET t1.industry=t2.industry
WHERE t1.industry is null 
and t2.industry is not null;

select industry 
from project2

--  4. .................................................... REMOVE ANY UNWANTED COLUMNS.......................................
select * from project2
where total_laid_off is null
and percentage_laid_off is null

delete from project2
where total_laid_off is null
and percentage_laid_off is null

alter table project2
drop column row_num

select * from project2
