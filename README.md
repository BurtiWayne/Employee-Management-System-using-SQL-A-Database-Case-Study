# Employee-Management-System-using-SQL-A-Database-Case-Study
This project demonstrates the design and implementation of a relational database system to manage employee information using SQL. The database stores and manages data related to employees, departments, job roles, and office locations. It also includes a wide range of SQL queries to perform data retrieval, filtering, aggregation, and analysis.
# Employee Management System using SQL

## 🗄️ Database Schema

The database consists of four main tables:

### 1. Locations
Stores information about company office locations.

| Column Name | Data Type | Description |
|-------------|-----------|-------------|
| Location_ID | INT | Unique ID for location |
| City | VARCHAR | Name of the city |

---

### 2. Department
Contains department details and references the location table.

| Column Name | Data Type | Description |
|-------------|-----------|-------------|
| Department_ID | INT | Unique department ID |
| Names | VARCHAR | Department name |
| Location_ID | INT | Foreign key referencing Locations |

---

### 3. Job
Stores job roles or designations.

| Column Name | Data Type | Description |
|-------------|-----------|-------------|
| Job_ID | INT | Unique job ID |
| Designation | VARCHAR | Job role |

---

### 4. Employee
Stores employee information including department and job role.

| Column Name | Data Type | Description |
|-------------|-----------|-------------|
| Employee_ID | INT | Unique employee ID |
| First_Name | VARCHAR | Employee first name |
| Last_Name | VARCHAR | Employee last name |
| Middle_Name | VARCHAR | Employee middle name |
| Job_ID | INT | Foreign key referencing Job |
| Hire_Date | DATE | Employee joining date |
| Salary | DECIMAL | Employee salary |
| Comm | DECIMAL | Commission (if applicable) |
| Department_ID | INT | Foreign key referencing Department |

---

## ⚙️ SQL Operations Performed

### Basic Queries
- Retrieve employee details
- Retrieve department, job, and location data
- Display employee salary and commission information

### Filtering
- WHERE clause
- BETWEEN
- IN / NOT IN
- LIKE operator
- NULL checks

### Sorting
- ORDER BY (Ascending and Descending)

### Aggregations
- COUNT()
- MAX()
- MIN()
- AVG()

### Grouping
- GROUP BY
- HAVING clause

### Joins
- INNER JOIN between:
  - Employee and Department
  - Employee and Job
  - Department and Locations

### Conditional Statements
- CASE statement for creating **salary grades**

Example:

```sql
CASE
WHEN Salary >= 2000 THEN 'High'
WHEN Salary >= 1000 THEN 'Medium'
ELSE 'Low'
END AS Salary_Grade
