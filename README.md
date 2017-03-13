# DatabaseDev
Repository for MySQL database building code

# 2.0 how to use the database ...


Steps: 

1. Download raw clinical data from ClinCapture and save it to local as "CSV_Patient_data.csv"

2. Run "clinic_info.ipynb" to split raw data into four csvs "enroll.csv","imaging_visit.csv","imaging_visit2.csv", and "30fu.scv"

3. Run "connect_enroll.ipynb"

4. Run "Connect_imaging_visit.ipynb"

5. Run "Connect_imaging_visit2.ipynb"

6. Run "Connect_30d.ipynb"

7. Run "codebook.ipynb", get codebook.csv as result

8. Convert "codebook.csv" as "codebook.txt" using tab delimited

9. Run "create_table_codebook.ipynb"

10. Import software data into Mysql using "Dump20150529.sql", this sql file should be updated periodically 

11. Run "connect_softwaredataipynb"


P.S All csv files mentioned above can be found in folder "Input_csv"  