# 🎬 Silver Screen Analytics Project

## 🎯 Project Goal

Build a clean, analytical data mart that combines information about movie rentals, ticket sales, and rental costs across three theater locations operated by **Silver Screen** in New Jersey.

---

## ⚙️ Tech Stack

- **dbt (data build tool)** – data transformation and model orchestration  
- **Snowflake** – cloud data warehouse  
- **Jinja + SQL** – for model templating and transformations  
- **dbt Cloud** – version control and deployment

---

## 🧱 Model Layers

### 🔹 `staging` (`models/silver`)
Prepares raw data from different sources:

| Model              | Description |
|--------------------|-------------|
| `stg_nj_001`       | Transactional ticket-level data from NJ_001 |
| `stg_nj_002`       | Daily aggregated ticket sales from NJ_002 |
| `stg_nj_003`       | Purchase-level data from NJ_003 (tickets + snacks/drinks) |
| `stg_movie_catalogue` | Cleaned movie metadata (title, studio, genre) |

### 🔸 `intermediate` (`models/int`)
Aggregates key business metrics:

| Model               | Description |
|---------------------|-------------|
| `int_movies_costs`  | Monthly rental cost by movie and location |
| `int_movies_revenue`| Ticket revenue and quantity sold by movie and location |

### ⭐ `mart` (`models/gold`)
Final unified reporting layer:

| Model        | Description |
|--------------|-------------|
| `mart_movies`| Combines rental costs, ticket revenue, and movie metadata |

---

## 📊 Final Model: `mart_movies`

| Field           | Description |
|-----------------|-------------|
| `movie_id`      | Unique movie identifier |
| `movie_title`   | Cleaned movie title |
| `genre`         | Movie genre |
| `studio`        | Producing studio |
| `month`         | Year-Month of screening (e.g., `2024-05`) |
| `location`      | Theater location (NJ_001 / NJ_002 / NJ_003) |
| `rental_costs`  | Cost to rent the movie that month |
| `tickets_sold`  | Number of tickets sold |
| `revenue`       | Revenue from ticket sales |

---

## ✅ Outcomes

- Unified revenue and cost data from 3 differently structured theater systems  
- Standardized all dates to `YYYY-MM` and location names  
- Applied data quality tests with `dbt` (e.g. `not_null`, `accepted_values`)  
- Successfully built 7 models with `dbt build`  
- Documented the project with `dbt docs`

---

## 📈 Use Cases

- Compare movie profitability across locations and studios  
- Visualize monthly performance per film  
- Monitor rental efficiency vs ticket revenue

---

## 🧠 What I Practiced as a Data Analyst

- Data modeling in dbt using **staging → intermediate → mart** layers  
- SQL best practices (aliases, joins, unions, date formatting)  
- Source data profiling and standardization  
- Debugging `dbt` errors in compile and runtime stages  
- End-to-end pipeline design and documentation

---

