dbt_project/
│
├── models/
│   ├── bronze/                  # 🥉 Raw source data (no transformations)
│   │     ├── sources/
│   │     ├── sources.yml
│
│   ├── silver/                  # 🥈 Staging (STG): cleaned + renamed fields
│   │   ├── stg_movie_catalogue.sql
│   │   ├── stg_invoices.sql
│   │   ├── stg_nj_001.sql
│   │   ├── stg_nj_002.sql
│   │   └── stg_nj_003.sql
│
│   ├── gold/                    # 🥇 Final aggregated business logic
│   │   └── mart_movies.sql
|   |   └── schema.yml           # Schema file for final model(s)               
│
├── snapshots/                   # tracking changes over time
└── dbt_project.yml              # dbt config file
