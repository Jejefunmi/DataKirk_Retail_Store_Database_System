# Database_System_DataKirk_Retail_Store_
## Introduction 
![](https://github.com/Jejefunmi/DataKirk_Retail_Store_Database_System/blob/main/github%20intro%20page.jpg)

This is a project on Database, on creating a Customer Relationship Management System (CRM) called Datakirk Retail Store CRM. This project is to design a Database system that will perform Datakirk operations, optimise customer interaction and ensuring accuracy.

 *Disclaimer: This project was completed during a work experience program and is intended for demonstration purposes only.*

## Problem Statement.
This project address several key challenges in  DataKirk Retail Store CRM and can be categorized as follows:
1. Lack of Customer Insights:
Difficulty retrieving customer details based on specific criteria (e.g., location, purchase history) hinders understanding customer behaviour and preferences.
2. Inefficient Sales Analysis:
Inability to generate reports by product, sales rep, or date range makes it challenging to analyze sales trends and identify areas for improvement.
3. Inaccurate Data and Communication:
The absence of triggers for order total calculation, stock availability checks, and data audit trails can lead to inaccurate data and lack of communication regarding order updates.

## Skills/Concept Demostrated
 * Entity-Relationship Modeling (ERM)
 * Schema Design
 * Data Integrity and Accuracy
 * customer interaction optimization
 * SQL queries
 * inventory management
 * Query Optimization
 * Automation
 * customer interaction optimization


## Modeling
     Entity-Relationship Modeling (ERM) was conducted to delineate the relationships between various data entities within the CRM system. The automatically generated ERM was modified to align with business requirements. Each OrderDetail is associated with a specific product (One-to-One Relationship), while other tables exhibit One-to-Many relationships.


AUto-Genrated ERM		                                                              |	Adjusted ERM
:--------------------------------------------------------------------------------:    |:--------------------------------
![](https://github.com/Jejefunmi/DataKirk_Retail_Store_Database_System/blob/main/Generated_Schema_relationship_design.png) |	![](https://github.com/Jejefunmi/DataKirk_Retail_Store_Database_System/blob/main/Modified_Schema_relationship_design.png)
The Auto_generated schema shows one to many relationship.                             | Schema was adjusted to one to one relationship as required


## Schema Design
The CRM system utilizes a relational database with various tables designed using SQL. Each table stores specific data relevant to the system, with appropriate data types for efficient management.
To ensure data accuracy, several constraints are implemented:
* Primary Keys: Each table has a unique identifier column (e.g., CustomerID) that prevents duplicates and acts as the main reference point.
* Foreign Keys: These enforce connections between related tables. For example, an order references a specific customer ensured by the CustomerID linking the SalesOrders and Customers tables.
* Check Constraints: These validate specific data values. For instance, product prices must be positive.
* Unique Constraints: These guarantee uniqueness for certain columns or combinations. For example, customer email addresses must be unique.

![](https://github.com/Jejefunmi/DataKirk_Retail_Store_Database_System/blob/main/Customer_Table.png)

The image shows Customer Table created with required attributes, Datatypes and constriants.
By implementing these constraints, the schema design safeguards data integrity within the CRM system.

## Data Population
To populate the tables within the CRM system, Structured Query Language (SQL) was employed. Specifically, INSERT statements were utilized to strategically insert data into each table. This initial data was manually entered for testing purposes. 

![](https://github.com/Jejefunmi/DataKirk_Retail_Store_Database_System/blob/main/Sample_data_insert.png)
Sample Data Inserted into the database.


## Strategy to Address Problem 
 #### 1	Lack of Customer Insights
SQL queries was written to Retrieving customer details based on specific criteria allows for targeted marketing campaigns and personalized customer service by segmenting customers based on location, purchase history, and other relevant factors. 

Sample query                                                                                                               |	Output
:--------------------------------------------------------------------------------:                                         |:--------------------------------
![](https://github.com/Jejefunmi/DataKirk_Retail_Store_Database_System/blob/main/customer_by_country_query.jpg.png)        |	![](https://github.com/Jejefunmi/DataKirk_Retail_Store_Database_System/blob/main/customer_by_country_result.jpg)

SQL query to retrieve number of customers in each coutry. This information can be use for decision making as regard Resources allocation, Market Penetration.

 #### 2	Inefficient Sales Analysis
Sales reports were generated by product, sales rep, and date range provides valuable insights into sales trends and lot more. This information enables informed decision-making related to inventory management, sales strategies, and resource allocation.

Sample query                                                                                                               |	Output
:------------------------------------------------------------------------------------------------------------------------: |:--------------------------------
![](https://github.com/Jejefunmi/DataKirk_Retail_Store_Database_System/blob/main/Top_5_best_selling_products_query.jpg.png)|:![](https://github.com/Jejefunmi/DataKirk_Retail_Store_Database_System/blob/main/Top_5_best_selling_products_result.jpg)

Retriving Top 5 best selling products can be used to make decisions about Inventory management, and Marketing Strategy.

#### 3 Inaccurate Data and Communication: to solve this, Triggers were created to perform Automated responses to corresponding event carried out
* ##### Order Total Calculation Trigger
The purpose of the trigger is to automatically update the TotalAmount  in the SalesOrders table whenever there are changes (inserts, updates, or deletes) to the OrderDetails table Ensures the total order amount in the SalesOrders table is always accurate, reflecting changes in order details.

![](https://github.com/Jejefunmi/DataKirk_Retail_Store_Database_System/blob/main/Total_amount_recalculate_trigger.png)

Testing the Trigger 

Testing for Insert                                                                    |	Output
:--------------------------------------------------------------------------------:    |:--------------------------------
![](https://github.com/Jejefunmi/DataKirk_Retail_Store_Database_System/blob/main/Total_amount_recalculate_trigger_query.png) |	![](https://github.com/Jejefunmi/DataKirk_Retail_Store_Database_System/blob/main/Total_amount_recalculate_trigger_inserted_Query.png)

As values (21,2,50) were inserted in Orderdetails table the TotalAmount in SalesOrder table where the OrderDetails is 21 automatically became 500 (2 * 250)


 Testing for update                                                                   |	Output
:--------------------------------------------------------------------------------:    |:--------------------------------
![](https://github.com/Jejefunmi/DataKirk_Retail_Store_Database_System/blob/main/Total_amount_recalculate_trigger_update_query.png) |	![](https://github.com/Jejefunmi/DataKirk_Retail_Store_Database_System/blob/main/Total_amount_recalculate_trigger_update_query_result.png)

Likewise, testing for update, TotalAmount became 1197 when quantity 5 was set where Orderdetails is 1 on Orderdetails Table.
 

* ##### Stock Availability Trigger: 

![](https://github.com/Jejefunmi/DataKirk_Retail_Store_Database_System/blob/main/Check_StockAvailable_table_Trigger.png)

###### Testing the stock availability trigger
This trigger is created on Stock available to checks the available stock quantity of a product when an order detail is inserted or updated. If the ordered quantity exceeds the available stock, the trigger should prevent the insertion or update and display an appropriate error message. This  Prevents overselling by checking available stock before order confirmation. 


![](https://github.com/Jejefunmi/DataKirk_Retail_Store_Database_System/blob/main/Check_StockAvailable_table_Trigger_Result.png)

When 40, which was more than available stock, was set where ProductID is 2, in order to update the customer Order, the trigger prevent an update and an error message was generated as pointed by the arrow.

* ##### Data Audit Trigger:
This trigger is designed to log changes (inserts, updates, and deletions) made to the Products table into an audit table named Audit_table. This audit trail serves as a record of data modifications and helps maintain data integrity by tracking changes to product information.

![](https://github.com/Jejefunmi/DataKirk_Retail_Store_Database_System/blob/main/Product_Audit_Table_Trigger.png)


Testing the Data Audit Trigger

Operation on Product Table                                                            |	Output
:--------------------------------------------------------------------------------:    |:--------------------------------
![](https://github.com/Jejefunmi/DataKirk_Retail_Store_Database_System/blob/main/Product_Audit_Table_Trigger_Test.png) |	![](https://github.com/Jejefunmi/DataKirk_Retail_Store_Database_System/blob/main/Product_Audit_Table_Trigger_Test_Result.png)

When a event (Insert) occured on Procuct Table it is immediately trackedby Audit_Table.

* #### Email Notification Trigger
Keeps both sales representatives and customers informed about order updates through automated emails. This enhances transparency and improves communication.

![](https://github.com/Jejefunmi/DataKirk_Retail_Store_Database_System/blob/main/Email_Notification_Trigger.png)
![](https://github.com/Jejefunmi/DataKirk_Retail_Store_Database_System/blob/main/Email_Notification_Trigger2.png)

## Conclusion
This project successfully designed and implemented a database-driven Customer Relationship Management (CRM) system. The system utilizes a well-defined schema with relational tables and enforced constraints to ensure data integrity and accuracy.

## Recommendations
This project lays a strong foundation for a comprehensive CRM system. Here are some recommendations for further development:
Integration with Existing Systems: Explore integration with existing business systems like accounting or marketing software for a more unified data environment.
Advanced Security Measures: Implement robust security measures to protect sensitive customer and sales data.












[def]: https://raw.githubusercontent.com/Jejefunmi/DataKirk_Retail_Store_Database_System/main/github%20intro%20page.webp
