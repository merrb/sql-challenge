--List the following details of each employee: employee number, last name, first name, sex, and salary.
Select employees.emp_no, 
employees.last_name,
employees.first_name,
employees.sex, 
salaries.salary
From employees
Join Salaries
on employees.emp_no = salaries.emp_no;


--List first name, last name, and hire date for employees who were hired in 1986.
Select * From employees 
Where Date_Part('year', hire_date) = 1986;


--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
Select dept_manager.dept_no,
departments.dept_name,
employees.emp_no,
employees.last_name,
employees.first_name
From employees
Join dept_manager
On dept_manager.emp_no = employees.emp_no
Join departments
On dept_manager.dept_no = departments.dept_no


-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
Select employees.emp_no,
employees.last_name, 
employees.first_name,
dept_emp.dept_no,
departments.dept_name
From employees
Join dept_emp On employees.emp_no=dept_emp.emp_no
Join departments On departments.dept_no=dept_emp.dept_no;


-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
Select employees.first_name, 
employees.last_name,
employees.sex
From employees
WHERE first_name = 'Hercules' AND last_name like 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT 
employees.emp_no, 
employees.last_name, 
employees.first_name,
dept_emp.dept_no
FROM employees 
JOIN dept_emp 
ON employees.emp_no=dept_emp.emp_no
JOIN departments 
ON departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name='Sales';


-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.--
--It's not giving department name
SELECT employees.emp_no, 
employees.last_name, 
employees.first_name,
dept_emp.dept_no
FROM employees 
JOIN dept_emp 
ON employees.emp_no=dept_emp.emp_no
JOIN departments 
ON departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name in ('Sales', 'Development')


-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(*) AS freq_count
FROM employees
GROUP BY last_name
ORDER BY freq_count DESC;


