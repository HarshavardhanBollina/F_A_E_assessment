CREATE TABLE dim_user (
    _id VARCHAR PRIMARY KEY,
    state VARCHAR,
    createdDate TIMESTAMP,
    lastLogin TIMESTAMP,
    role VARCHAR,
    active BOOLEAN
);

CREATE TABLE fact_receipt (
    id VARCHAR PRIMARY KEY,
    bonusPointsEarned INT,
    bonusPointsEarnedReason VARCHAR,
    createDate TIMESTAMP,
    dateScanned TIMESTAMP,
    finishedDate TIMESTAMP,
    modifyDate TIMESTAMP,
    pointsAwardedDate TIMESTAMP,
    pointsEarned FLOAT,
    purchaseDate TIMESTAMP,
    purchasedItemCount INT,
    rewardsReceiptItemList TEXT, -- JSON or similar structured type depending on DB support
    rewardsReceiptStatus VARCHAR,
    totalSpent FLOAT,
    userId VARCHAR REFERENCES dim_user(_id)
);

CREATE TABLE dim_brand (
    _id VARCHAR PRIMARY KEY,
    barcode VARCHAR,
    brandCode VARCHAR, -- Assuming this is meant to be a unique identifier for brands
    category VARCHAR,
    categoryCode VARCHAR,
    cpg VARCHAR, -- Assuming JSON or similar structured type, adjust according to actual structure
    topBrand BOOLEAN,
    name VARCHAR
);

CREATE TABLE receipt_to_brand (
    receiptId VARCHAR REFERENCES fact_receipt(id),
    brandCode VARCHAR REFERENCES dim_brand(brandCode),
    PRIMARY KEY (receiptId, brandCode)
);






-- Copy command for dim_user table
COPY dim_user (_id, state, createdDate, lastLogin, role, active) FROM '/dim_user.csv' DELIMITER ',' CSV HEADER QUOTE '"';

-- Copy command for fact_receipt table
COPY fact_receipt (id, bonusPointsEarned, bonusPointsEarnedReason, createDate, dateScanned, finishedDate, modifyDate, pointsAwardedDate, pointsEarned, purchaseDate, purchasedItemCount, rewardsReceiptItemList, rewardsReceiptStatus, totalSpent, userId) FROM '/fact_receipt.csv' DELIMITER ',' CSV HEADER QUOTE '"';

-- Copy command for dim_brand table
COPY dim_brand (_id, barcode, brandCode, category, categoryCode, cpg, topBrand, name) FROM '/dim_brand.csv' DELIMITER ',' CSV HEADER QUOTE '"';

-- Copy command for receipt_to_brand table
COPY receipt_to_brand (receiptId, brandCode) FROM '/receipt_to_brand.csv' DELIMITER ',' CSV HEADER QUOTE '"';









