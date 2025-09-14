# 📚 Library Management System (Advanced SQL Project)

This project is a **Library Management System** built using PostgreSQL with advanced SQL features such as **stored procedures, triggers, functions, and constraints**.  
It simulates real-world library operations including book issue, book return, employee management, and tracking members.

---

## 📂 Project Files
- **Library_project.sql** → Base schema creation with tables.  
- **Library_project_1.sql** → Extended schema with constraints and sample data.  
- **Librarry_project_advancesql.sql** → Advanced SQL features including stored procedures, triggers, and queries.  
- **ERD_schemas.pgerd** → ERD schema file (can be opened in pgAdmin or DBeaver).  
- **A_schema_diagram_of_a_library_management_system_ER.png** → Entity Relationship Diagram (ERD) template image.

---

## 🗄️ Database Schema
The database consists of the following main tables:
1. **books**
   - isbn (PK)
   - book_name
   - category
   - status (yes/no for availability)

2. **members**
   - member_id (PK)
   - member_name
   - member_email
   - member_phone

3. **employees**
   - emp_id (PK)
   - emp_name
   - emp_email
   - emp_phone

4. **issued_status**
   - issued_id (PK)
   - issued_member_id (FK → members)
   - issued_book_isbn (FK → books)
   - issued_emp_id (FK → employees)
   - issued_date

5. **return_status**
   - return_id (PK)
   - issued_id (FK → issued_status)

---

## ⚙️ Features
- ✅ **Add new books, members, and employees**  
- ✅ **Issue a book** (updates availability status to *no*)  
- ✅ **Return a book** (updates availability status to *yes*)  
- ✅ **Check issued/returned history**  
- ✅ **Procedures for automation**  
  - `issue_book()` → Issues a book if available  
  - `add_return_records()` → Returns a book and updates status  

---

## 📊 Entity Relationship Diagram
![Library ERD](A_schema_diagram_of_a_library_management_system_ER.png)

---

## 🚀 Getting Started

### 1. Clone Repository
```bash
git clone https://github.com/your-username/library-management-system.git
cd library-management-system
