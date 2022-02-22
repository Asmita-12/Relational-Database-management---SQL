/*Asmita Shelke*/

/*Task 1*/
SELECT statecode FROM employer 
UNION 
SELECT location from quarter;

/*Task 2*/
SELECT interview.companyname, interview.division, employer.statecode, interview.salaryoffered 
FROM interview, employer 
WHERE interview.companyname = employer.companyname and interview.division = employer.division;

/*Task 3*/
SELECT state. statecode, state.description from state 
WHERE statecode not in  (select statecode from employer);

/*Task 4*/
SELECT distinct companyname, minhrsoffered FROM interview

/*Task 5*/
SELECT statecode, description 
FROM state where description like '__a%'
OR description like '__e%'
OR description like '__i%'
OR description like '__o%'
OR description like '__u%';

/*Task 6*/
SELECT quarter.qtrcode, quarter.location, state.description
FROM quarter,state
WHERE quarter.location=state.statecode;

/*Task 7*/
SELECT state.description, employer.companyname 
FROM state LEFT OUTER JOIN employer
on state.statecode=employer.statecode;

