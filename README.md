# SQL Data Cleaning Project

This project demonstrates data cleaning techniques using SQL. The goal is to transform raw data into a clean dataset suitable for analysis by performing various data cleaning steps.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Introduction

Data cleaning is a crucial step in data analysis and involves identifying and correcting (or removing) errors and inconsistencies in data to improve its quality. This project showcases various SQL queries and procedures used to clean and prepare data.

## Features

- Removing duplicate records
- Standardizing data formats
- Handling missing values
- Removing unwanted columns

## Prerequisites

To run this project, you will need:

- A MySQL database server
- MySQL Workbench or any SQL client

## Installation

1. Clone the repository to your local machine:

    ```bash
    git clone https://github.com/yourusername/sql-data-cleaning.git
    ```

2. Import the SQL script into your MySQL server:

    - Open MySQL Workbench or your preferred SQL client.
    - Create a new database or select an existing one.
    - Run the SQL script provided in the repository (`layoffs1.SQL`).

## Usage

1. Open the SQL script file (`layoffs1.SQL`).
2. Execute the script to perform data cleaning tasks.
3. Review the cleaned data to ensure all issues have been addressed.

### SQL Data Cleaning Steps

1. **Remove Duplicate Data:**

    ```sql
    WITH duplicate_row AS (
        SELECT *, ROW_NUMBER() OVER (PARTITION BY location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
        FROM project
    )
    DELETE FROM project2
    WHERE row_num > 1;
    ```

2. **Standardize the Data:**

    ```sql
    UPDATE project2
    SET company = TRIM(company);

    UPDATE project2
    SET industry = 'crypto'
    WHERE industry LIKE 'crypto%';

    UPDATE project2
    SET country = TRIM(TRAILING '.' FROM country)
    WHERE country LIKE 'UNITEDSTATES%';

    UPDATE project2
    SET `date` = STR_TO_DATE(`date`, '%y/%m/%d');

    ALTER TABLE project2
    MODIFY COLUMN `date` DATE;
    ```

3. **Remove Null Values and Populate Missing Data:**

    ```sql
    UPDATE project2
    SET industry = ''
    WHERE industry IS NULL;

    UPDATE project2 t1
    JOIN project2 t2 ON t1.company = t2.company
    SET t1.industry = t2.industry
    WHERE t1.industry IS NULL AND t2.industry IS NOT NULL;
    ```

4. **Remove Unwanted Columns:**

    ```sql
    SELECT * FROM project2
    WHERE total_laid_off IS NOT NULL;
    ```

## Contributing

Contributions are welcome! Please fork the repository and create a pull request with your changes.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Contact

Chandrabose S. - [Email](chandrabose20002@gmail.com)

Project Link: [https://github.com/chandrabose/sql-data-cleaning](https://github.com/chandrabose/sql-data-cleaning)
