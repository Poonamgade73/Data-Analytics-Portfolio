---

# 🏦 Bank Loan Analysis

## 📘 Project Overview

The **Bank Loan Analysis Project** focuses on analyzing customer loan data to evaluate lending risks, track key financial KPIs, and identify borrower behavior patterns. Using **Excel, Power BI, Tableau, and SQL**, this project provides insights that help financial institutions make data-driven decisions and monitor portfolio performance efficiently.

---

## ⚙️ Tools & Technologies Used

* **Excel:** Data cleaning and transformation using Power Query
* **Power BI:** KPI visualization and performance tracking dashboard
* **Tableau:** Comparative visual analysis for loan purposes and regional insights
* **SQL:** Query-based KPI computation and loan trend analysis

---

## 🧩 Dataset Details

| Table Name        | Description                                                                   | Rows   |
| ----------------- | ----------------------------------------------------------------------------- | ------ |
| **Loan_Data**     | Contains customer-level loan records with amount, rate, and repayment details | 39,717 |
| **Customer_Info** | Demographic details of loan applicants                                        | 39,717 |
| **Loan_Status**   | Loan grade, verification, and payment behavior                                | 39,717 |

**Data Model:** A structured relationship was created between **Loan_Data**, **Customer_Info**, and **Loan_Status** tables for analytical insights.

---

## 🧹 Data Preparation & Transformation

### 🧮 Preprocessing Steps

1. **Cleaned and Transformed Data using Power Query**

   * Removed duplicates and nulls to ensure data integrity.
   * Standardized date, numeric, and text formats for consistency.

2. **Created KPI Calculations**

   * Calculated total loan disbursed, average DTI, and interest rates.
   * Segmented data based on grade, purpose, and verification status.

3. **Validated Data for Accuracy**

   * Performed reconciliation checks between Excel, Power BI, and SQL results.

4. **Built Relationships**

   * Linked fact and dimension tables using primary–foreign key relationships for smoother Power BI analysis.

---

## 📈 Key Performance Indicators

| KPI                       | Description                           | Value  |
| ------------------------- | ------------------------------------- | ------ |
| **Total Loan Amount**     | Total value of loans disbursed        | ₹446M  |
| **Average Interest Rate** | Mean interest rate across all loans   | 12.02% |
| **Average DTI Ratio**     | Average borrower Debt-to-Income ratio | 13.32  |
| **Total Revolve Balance** | Outstanding revolving credit          | ₹532M  |

---

## 💡 Business Insights

* **59% of loans** were **unverified**, indicating potential risk exposure.
* **Debt Consolidation (₹60M)** emerged as the top loan purpose.
* **CA, NY, and FL** recorded the highest loan volumes across the U.S.
* **Grades B & C** contributed to the largest revolve balances.
* Verified loans displayed **lower default probability** and higher repayment consistency.
* **Mortgage homeowners** showed better repayment patterns compared to renters.

---

## 🖼️ Dashboard Gallery

### 🧾 Excel Dashboard

Features: Data cleaning summary, KPI visuals, and loan category distribution.
![Excel Dashboard](EXCELDASHBOARD.png)
**📂 Dashboard File:** [View Excel Dashboard](EXCELDASHBOARD.png)

---

### 📊 Power BI Dashboard

Features: Interactive KPI tracking for loan amount, DTI, verification status, and repayment trends.
![Power BI Dashboard](POWERBIDASHBOARD.png)
**📂 Dashboard File:** [View Power BI Dashboard](POWERBIDASHBOARD.png)

---

### 🌍 Tableau Dashboard

Features: Regional loan analysis, top loan purposes, and verified vs. unverified comparisons.
![Tableau Dashboard](TABLEAUDASHBOARD.png)
**📂 Dashboard File:** [View Tableau Dashboard](TABLEAUDASHBOARD.png)

---

**🧾 SQL File:** [Download MySQL Script](SQL_File_Link)

---

## 🧠 Key Learnings

* Strengthened skills in **data cleaning, KPI modeling, and financial analysis**.
* Designed **interactive dashboards** in Power BI and Tableau for business storytelling.
* Applied **SQL queries** for trend analysis and verification-based insights.
* Improved understanding of **loan performance, customer segmentation, and credit risk patterns**.

---

## 🏁 Conclusion

The **Bank Loan Analysis Project** demonstrates how integrated analytics across **Excel, Power BI, Tableau, and SQL** can reveal meaningful financial insights.
By analyzing **39K+ customer loans**, this project identifies repayment behavior, verification risks, and key metrics that support informed lending and business strategies.

---


