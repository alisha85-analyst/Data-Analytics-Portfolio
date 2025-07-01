# 🏥 Hospital Management System – SQL Project

This project simulates a Hospital Management System built using **MySQL**, designed for data analysis, reporting, and query optimization using realistic relational healthcare data.

---

## 📦 Database Design

- **Database Name:** `hospital_db`
- **Total Tables:** 5 (Patients, Doctors, Appointments, Treatments, Billing)
- **Relationships:** All tables connected with primary and foreign keys
- **Records:** 1,000+ synthetic rows created for simulation

---

## 🛠 Tools & Skills Used

- SQL (MySQL)
- Data Modeling (Normalization, Primary/Foreign Keys)
- Complex Joins & Aggregations
- Window Functions (`RANK()`, `FORMAT()`)
- Time-based Queries (`DATE_FORMAT()`, `DATE_ADD()`)

---

## 📊 Project Objectives

1. Design a normalized, relational healthcare database in MySQL
2. Populate the database with realistic dummy data
3. Execute and optimize 10 business-driven SQL queries

---

## ✅ Highlighted Business Queries

| # | Query Description |
|--|--------------------|
| 1 | List all patients who visited for consultation |
| 2 | Count total appointments per doctor |
| 3 | Find patients billed over ₹10,000 |
| 4 | Identify top reasons for patient visits |
| 5 | View treatments with patient & doctor info |
| 6 | Show appointments with billing status |
| 7 | Monthly revenue generation trend |
| 8 | Most recent appointment per patient |
| 9 | Top doctor by unique patients treated |
| 10| Rank patients by total treatment cost |

---

## 📈 Key Insights Delivered

- Highlighted top 3 patient visit reasons for improved service focus
- Identified ₹50K+ revenue trends per month for financial planning
- Ranked doctors based on patient load for operational decisions
- Ranked patients by cost for insurance and billing prioritization

---

## 📁 Files Included

- `schema.sql` – database creation and table structure
- `queries.sql` – all business queries
- `README.md` – project documentation (this file)
