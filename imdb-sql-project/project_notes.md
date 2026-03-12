# 🎬 Project Notes — IMDb Movie Database Explorer

These notes document the process, decisions, and learning steps behind building the **IMDb Movie Database Explorer** using SQL and DataGrip. This file captures the reasoning, challenges, and insights gained throughout the project.

---

## 📌 Project Goal
Create a beginner‑friendly SQL project that explores the IMDb dataset using real SQL queries.  
The goals include:

- Practicing SQL fundamentals and intermediate concepts  
- Importing large CSV datasets into a relational database  
- Understanding table relationships  
- Writing analytical queries that answer real questions  
- Building a portfolio‑ready SQL project  

---

## 🗂️ Dataset Used
**IMDb Complete Dataset Collection (2025)** from Kaggle.

Imported tables:

- `title_basics`
- `title_ratings`
- `name_basics`
- `title_principals`
- `title_crew`
- `title_akas` (optional)
- `title_episode` (optional)

Each CSV was imported into a local database using DataGrip’s **Import from File** tool.

---

## 🧱 Database Setup Notes
- Database engine: **SQLite** (simple and ideal for local analysis)
- Import settings:
  - UTF‑8 encoding  
  - First row = header  
  - Auto‑detected column types  
- Table naming convention: snake_case for readability  
- Verified column mappings before import  
- Ensured each CSV created its own table  

---

## 🧠 Key Concepts Practiced
### **SQL Fundamentals**
- SELECT  
- WHERE  
- ORDER BY  
- LIMIT  

### **Intermediate SQL**
- JOINs  
- GROUP BY  
- Aggregations  
- Pattern matching with LIKE  
- Filtering on multiple conditions  

### **Relational Thinking**
- Linking movies to ratings  
- Linking actors to movies  
- Linking directors to titles  
- Understanding many‑to‑many relationships  

---

## 🎯 Features Implemented Through SQL Queries
The project includes SQL queries for:

- Top‑rated movies  
- Movies by genre  
- Movies released after a specific year  
- Most popular movies (by vote count)  
- Movies featuring a specific actor  
- Directors of a movie  
- Average rating by genre  
- Keyword search  
- High‑rating + high‑votes filter  
- Actors in the highest‑rated movies  

All queries are stored in `queries.sql`.

---

## 🧩 Challenges & Observations
- IMDb data contains missing values (`\N`) that require filtering or handling  
- Genres are comma‑separated, so LIKE queries are necessary  
- Some tables (e.g., `title_principals`) contain multiple roles per movie  
- The dataset is large, so LIMIT is useful during exploration  
- SQLite lacks some advanced SQL features, but it’s perfect for this project’s scope  

---

## 🚀 Future Improvements
- Add SQL views for common queries  
- Build a small Python script or CLI to run queries interactively  
- Create and include a database diagram  
- Add more advanced analytics (cohort analysis, actor networks, etc.)  
- Migrate to PostgreSQL for more complex SQL features  

---

## 📝 Personal Learning Reflections
- Importing real datasets helped reinforce how SQL handles messy, real‑world data  
- JOINs became much clearer after working with multiple IMDb tables  
- Writing queries for real questions (e.g., “Who directed Inception”) made SQL feel more intuitive  
- Documenting the project for GitHub improved understanding of workflow and structure  

---

