# Fetch Rewards - Excercise

### First Task: Review Existing Unstructured Data and Diagram a New Structured Relational Data Model

I created a relational data model. ref: **ERD.pdf**

"Receipts", "Users", and "Brands" were the three datasets that came with the assignment.

I use a straightforward approach to the relational model. The fact table, receipts, contains two dimension tables: one for users and the other for brands. However, as the attributes rewardsreceiptitemlist in the receipts table lack brand_id and barcode to connect it to the brands table, there is no direct relationship between receipts and brands. In order to relate the receipts table to brands, I developed a table called receipt_to_brand. 

The fact_receipt column in the rewardsreceiptitemlist property of the receipts fact table can be parsed to construct the Receipt_to_brand table. and producing a single record for each combination of receipt_id and brandcode. The brands table is where the brandcode is found. As a result, there is now a connection between brands and receipts.

After looking over the supplied JSON datasets, I've come to the conclusion that there wasn't enough data in the rewardsReceiptItemList to connect receipts to the brands database.

### Second Task: Write a query that directly answers a predetermined question from a business stakeholder

These PostgreSQL-written SQL query's are intended to be used with the newly generated relational model. The **third and fourth** questions from the stakeholders are the ones I wanted to respond to. Since I am sure that my model is properly built to address these two problems, I decided to move forward with those two inquiries. Since the study revealed that many of the receipts lack the brandCode values and that the same characteristic is not entirely unique, I don't want to take a chance while responding to any inquiries involving the bridge table, receipt_to_brand table. 



**Question 3: Average Spend - 'Accepted' vs. 'Rejected' Receipts**

```sql
SELECT rewardsReceiptStatus, AVG(totalSpent) AS averageSpend
FROM fact_receipt
WHERE rewardsReceiptStatus IN ('Accepted', 'Rejected')
GROUP BY rewardsReceiptStatus;
```



**Question 4: Total Items Purchased - 'Accepted' vs. 'Rejected' Receipts**

```sql
 SELECT rewardsReceiptStatus, SUM(purchasedItemCount) AS totalItemsPurchased
FROM fact_receipt
WHERE rewardsReceiptStatus IN ('Accepted', 'Rejected')
GROUP BY rewardsReceiptStatus;
```

Please refer the **script-3.sql** file for the whole phycical model. It has the Physical model including the chosen data types for all the attributes and then the sql queries.






