/* (1)	Get ID and name for employees who are teachers but NOT project directors*/
select distinct ID, name from EM
where ID not in (select DIRECTOR_ID from PR);

/* (2)	For each employee from 'Baton Rouge', get employee ID, name, maximum grade and the number of courses taken by the employee. Arrange the result in descending order of the maximum grade.
Note: Even if a 'Baton Rouge' employee does NOT take any course, the employee should  still appear in the selection result.  Hint: consider using subquery in the "select" clause. */

/* probably the closeest I have gotten */

--- this is something good
select ID, Name, City from EM where City='Baton Rouge';

--- Works except excludes the employee who doesn't take any courses...
SELECT EM.ID, Name, max(grade) as max_grade, COUNT(EM.ID) AS num_courses
FROM ER
JOIN EM on EM.ID = ER.ID
WHERE city = "Baton Rouge"
GROUP BY ID
order by max_grade desc;

/* (3)	Get departments (DEPT) with a budget >= 100000 such that every employee from the department works in least 3 projects. */

select distinct DEPT
from EM
natural join CM
natural join EP
where budget >= 100000 and ID in (
	select ID 
	from EP
	group by ID
	having count(id) >=3);

---count num dept in EM >= num dept in PR * 3

--- for each ID in Each DEPT count num EP.ID

/* (4)	For each department, get DEPT, budget, sum of employee salary, and total number of courses offered.  Arrange the results in descending  order of the budget.
Note: Even if a department does NOT offer any course, the department should still appear in the result.  Hint: This is handled in the same way as for query (2) */
select DEPT, Budget, (
	select sum(salary)
	from EM
	where EM.DEPT = CM.DEPT
	) as salary_sum, (
	select count(DEPT)
	from CR
	where CR.DEPT = CM.DEPT
	) as num_courses
from CM
order by Budget desc;


/*(5)	Get ID and name for employees who take a course with grade >= 90 such that the course is offered by a department different from the employee’s.*/
---I think this works, didn't have time to double check
select EM.ID, EM.Name
from EM
join ER on EM.ID = ER.ID
join CR on ER.Cnum=CR.Cnum
where CR.DEPT<>EM.DEPT and grade >= 90;


/*(6)	Get Pnum for projects which are participated by employees from every department in the company. (In other words, a project is selected if EVERY department in the company has some employee participating in that project.)
Hint: use "double negation" or "count" for this question. */
---I think this works, didn't have time to double check
select PR.Pnum
from PR, CM, EP, EM
having count(CM.DEPT) >= count(
	distinct case 
	when EP.ID = EM.ID
	then EM.DEPT end)

/* (7)	For departments with budget > 300000 and more than 4 employees, get DEPT, budget, number of employees in the department. */
select DEPT, Budget,
	(select count(distinct ID)
	from EM
	where EM.DEPT = CM.DEPT
	) as num_employees
from CM
where Budget > 300000 
having num_employees > 4;

/* (8)	Get ID pairs for employee pairs such that the employees are from different cities, and more over, the first employee in the pair  takes a course taught by the second employee in the pair. */
--- I think this is right

select distinct EM.ID, dup_EM.ID
from ER, CR, EM, EM as dup_EM
where EM.ID = ER.ID
and CR.Cnum = ER.Cnum
and CR.TEACHER_ID = dup_EM.ID
and EM.City <> dup_EM.City