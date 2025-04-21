# Import the pandas library
import pandas as pd

# Step 1: Load the dataset (CSV file)
df = pd.read_csv("employee_data.csv")  # Use the path to your CSV file

# Step 2: Clean the data
# Handle missing values by filling them with the average salary (if any missing values)
df.fillna({'salary': df['salary'].mean()}, inplace=True)

# Step 3: Convert 'hire_date' to datetime format (so we can perform date-related analysis later)
df['hire_date'] = pd.to_datetime(df['hire_date'])

# Step 4: Perform some analysis (e.g., average salary by department)
avg_salary = df.groupby('department')['salary'].mean()

# Step 5: Save the processed data to new CSV files
avg_salary.to_csv('average_salary_by_department.csv', header=True)  # Save average salary data
df.to_csv('cleaned_employee_data.csv', index=False)  # Save the cleaned employee data

# Print a message to confirm processing is complete
print("Data Processing Complete!")
