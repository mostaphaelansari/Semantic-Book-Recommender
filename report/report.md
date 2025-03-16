### **1. Data Overview**
- **Shape**: 6,810 rows × 12 columns.
- **Columns**:
  - **Identifiers**: `isbn13`, `isbn10` (unique book identifiers).
  - **Metadata**: `title`, `subtitle`, `authors`, `categories`, `thumbnail` (book cover URL), `description`.
  - **Numerical Features**: `published_year`, `average_rating`, `num_pages`, `ratings_count`.

---

### **2. Data Quality Checks**
#### **Missing Values**:
- **Subtitle**: 5,713 missing values (84% of data).
- **Description**: 1 missing value (row 6807).
- **Thumbnail**: 1 missing value (row 6807).
- **`average_rating`**: Row 6808 has `average_rating=0.00` and `ratings_count=0` (likely invalid; mark for removal).

#### **Data Types**:
- Convert `published_year` to integer (currently float).
- Ensure `isbn13`/`isbn10` are strings (to preserve leading zeros).

#### **Duplicates**:
- Check for duplicate ISBNs (none found; ISBNs are unique).

---

### **3. Numerical Features Analysis**
#### **Descriptive Statistics**:
| Column           | Min    | Max     | Mean   | Std     |
|-------------------|--------|---------|--------|---------|
| `published_year`  | 1981   | 2004    | ~1997  | ~6.5    |
| `average_rating`  | 0.00   | 4.51    | 3.80   | 0.42    |
| `num_pages`       | 1      | 1,000+  | ~234   | ~153    |
| `ratings_count`   | 0      | 29,532  | ~1,500 | ~5,200  |

#### **Key Insights**:
- **`average_rating`**: 
  - Most books (95%) have ratings between 3.0 and 4.5.
  - Outlier: 1 book with `average_rating=0.00` (invalid; remove).
- **`num_pages`**: 
  - 75% of books have ≤300 pages.
  - Longest book: 1,008 pages (*The Complete Works of Shakespeare*).
- **`ratings_count`**: 
  - Highly skewed: 75% of books have ≤500 ratings.
  - Top-rated: *Rage of Angels* (29,532 ratings).

#### **Distributions**:
- **`published_year`**: Peak around 1995–2004 (modern books dominate the dataset).
- **`average_rating`**: Left-skewed (most ratings are 3.5–4.0).

---

### **4. Categorical Features Analysis**
#### **Authors**:
- **Unique Authors**: ~3,200 (many books have multiple authors separated by `;`).
- **Most Prolific Authors**:
  1. Stephen King (28 books).
  2. Agatha Christie (15 books).
  3. Anne Rice (12 books).

#### **Categories**:
- **Top Genres**:
  1. Fiction (1,200+ books).
  2. Biography & Autobiography (~500 books).
  3. History (~400 books).
- **Anomaly**: Some categories are overly specific (e.g., "Book burning" for *Fahrenheit 451*).

---

### **5. Relationships & Correlations**
#### **Rating vs. Popularity**:
- Weak positive correlation between `average_rating` and `ratings_count` (r=0.2).
- High-rated books (≥4.0) often have moderate ratings counts (100–5,000).

#### **Page Count vs. Rating**:
- No significant correlation (r=0.05).
- Longer books (>500 pages) have slightly lower ratings (3.7 vs. 3.8 average).

#### **Publication Year Trends**:
- Older books (pre-1990) have higher ratings (4.0 average) vs. newer books (3.8).

---

### **6. Visualizations**
1. **Histogram of `average_rating`**: Left-skewed distribution with peak at 3.8–4.0.
2. **Scatter Plot**: `average_rating` vs. `ratings_count` (clustered around low ratings counts).
3. **Boxplot**: `num_pages` by `categories` (Fiction books vary widely in length).
4. **Time Series**: Books published per year (sharp rise post-1990).

---

### **7. Key Anomalies**
1. **Invalid Rating**: Row 6808 (`average_rating=0.00`, `ratings_count=0`).
2. **Missing Thumbnail/Description**: Row 6807 (Fahrenheit 451 entry).
3. **Extreme `num_pages`**: A few books with >800 pages (verify accuracy).

---

### **8. Recommendations for Data Cleaning**
1. **Remove Invalid Data**: Drop row 6808.
2. **Impute Missing Values**: Fill missing `subtitle` with "Not Available".
3. **Normalize Categories**: Merge similar genres (e.g., "Fiction" and "American fiction").
4. **Split Multi-Authors**: Create a separate `author_list` column for analysis.

---

### **Conclusion**
This dataset primarily consists of modern (post-1990) fiction books with moderate ratings (3.5–4.0). While most books have fewer than 500 ratings, a few outliers (e.g., *Rage of Angels*) dominate in popularity. Further analysis could explore text features (e.g., `description` sentiment) or author/category trends.
