# 📊 Ucompensar University Project - Analytics Database

## 📚 Project Description

This repository contains the SQL code for the **u-compensar-sql-analytics** project. A comprehensive database system to track video content creators' performance metrics, including views, engagement, visibility scores, and monetization data.

## 🗄️ Database Schema

The database consists of 5 main tables:
- **CREATORS**: Content creators with subscription levels
- **VIDEOS**: Video catalog with titles and categories  
- **DAILY_METRICS**: Daily performance statistics
- **VISIBILITY_SCORE**: Video visibility and retention analytics
- **MONETIZATION**: Ad budgets and revenue tracking

## 🛠️ Prerequisites

To run the SQL code, you need to have **MySQL** (the database server and client tools) installed on your system.

### 1. MySQL Installation

Follow the instructions based on your operating system:

#### 🍎 macOS (Using Homebrew)

Open your Terminal and run the following commands:

1.  **Install MySQL**:
    ```bash
    brew install mysql
    ```

2.  **Start the MySQL Service**:
    ```bash
    brew services start mysql
    ```

#### 💻 Windows (Using WinGet)

Open your **PowerShell or Command Prompt as Administrator** and run the following command:

1.  **Install MySQL** (This installs the server and client tools):
    ```bash
    winget install Oracle.MySQL
    ```

2.  **Configuration:** During the installation, you will be prompted to set a **`root` password**. **Make sure to remember this password, as you will need it to connect.**

### 2. Verify Installation

Once installed, the MySQL service should be running in the background.

## ⚙️ Project Setup: Executing the SQL Code

### Step 1: Connect to the MySQL Server

Open your terminal (or PowerShell) and enter the MySQL client using your `root` user:

```bash
mysql -u root -p
```
* Enter your `root` **password** when prompted.

### Step 2: Create Database and Tables

```sql
source /path/to/your/project/tables.sql
```

### Step 3: Insert Sample Data

```sql
source /path/to/your/project/data.sql
```

### Step 4: Execute Analytics Queries

```sql
source /path/to/your/project/selects.sql
```

## 📈 Key Analytics Queries

The project includes powerful analytics queries for:
- Video performance metrics (views, watch time, engagement)
- Creator revenue analysis and top performers
- Category-based analytics and retention rates
- Gaming content and trending video analysis

## 📊 Sample Data

Pre-loaded with **6 creators**, **23 videos** across 6 categories, and comprehensive metrics data including daily statistics, visibility scores, and monetization records.
