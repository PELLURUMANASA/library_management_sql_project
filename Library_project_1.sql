select * from books;
select * from branch;
select * from employees;
select * from issued_status;
select * from return_status;
select * from members;

--Project Tasks
--Task 1. Create a New Book Record 
-- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"
Insert Into books(isbn,book_title,category,rental_price,status,author,publisher)
VALUES
('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');

--Task 2: Update an Existing Member's Address
UPDATE members
SET member_address ='125 Main st'
WHERE member_id ='C101';

--Task 3: Delete a Record from the Issued Status Table 
-- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.

DELETE from issued_status
where issued_id='IS121';

--Task 4: Retrieve All Books Issued by a Specific Employee
-- Objective: Select all books issued by the employee with emp_id = 'E101'.

select *
from issued_status
where issued_emp_id='E101';

--Task 5: List Members Who Have Issued More Than One Book 
-- Objective: Use GROUP BY to find members who have issued more than one book.

select issued_emp_id
	--count(issued_id) as total_book_issued
FROM issued_status
group by issued_emp_id
Having count(issued_id) >1;

--CTAS (Create Table As Select)
--Task 6: Create Summary Tables: 
--Used CTAS to generate new tables based on query results - each book and total book_issued_cnt**
create table book_counts
as
select b.isbn,b.book_title,
count(ist.issued_id) as no_issued
from books as b
join
issued_status as ist
on  ist.issued_book_isbn=b.isbn
group by 1,2;

select * from book_counts;
--4. Data Analysis & Findings
--The following SQL queries were used to address specific questions:
--Task 7. Retrieve All Books in a Specific Category:
select * from books
where category ='Classic';

--Task 8: Find Total Rental Income by Category:
select category,sum(rental_price)
from books
group by category;

--9.List Members Who Registered in the Last 180 Days:
select * 
from members
where reg_date >= CURRENT_DATE- INTERVAL '180 days';

Insert Into members(member_id,member_name,member_address,reg_date)
VALUES
('C120','Manasa','145 Main St','2025-07-01'),
('C121','Manoj','133 Main St','2025-08-01');

--10.List Employees with Their Branch Manager's Name and their branch details:
select e1.*,b.branch_address,e2.emp_name as Manager_name
from employees as e1
join branch as b
on e1.branch_id=b.branch_id
join 
employees as e2
on e2.emp_id=b.manager_id;

--Task 11. Create a Table of Books with Rental Price Above a Certain Threshold:
Create table books_greater_than_seven
as
select * from books
where rental_price>7;

select * from books_greater_than_seven; 


--Task 12: Retrieve the List of Books Not Yet Returned
select distinct ist.issued_book_name
from issued_status as ist
left Join return_status as rs
on ist.issued_id=rs.issued_id
where rs.return_id is null;











