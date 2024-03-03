## Fetch Rewards - Excercise

#### First: Review Existing Unstructured Data and Diagram a New Structured Relational Data Model

I created a relational data model. ref: ERD.pdf

"Receipts", "Users", and "Brands" were the three datasets that came with the assignment.

I use a straightforward approach to the relational model. The fact table, receipts, contains two dimension tables: one for users and the other for brands. However, as the attributes rewardsreceiptitemlist in the receipts table lack brand_id and barcode to connect it to the brands table, there is no direct relationship between receipts and brands. In order to relate the receipts table to brands, I developed a table called receipt_to_brand. 

The fact_receipt column in the rewardsreceiptitemlist property of the receipts fact table can be parsed to construct the Receipt_to_brand table. and producing a single record for each combination of receipt_id and brandcode. The brands table is where the brandcode is found. As a result, there is now a connection between brands and receipts.

After looking over the supplied JSON datasets, I've come to the conclusion that there wasn't enough data in the rewardsReceiptItemList to connect receipts to the brands database.







