-- 1. Customers Dataset
DROP TABLE IF EXISTS olist_customers_dataset CASCADE;
CREATE TABLE olist_customers_dataset (
    customer_id TEXT PRIMARY KEY,
    customer_unique_id TEXT,
    customer_zip_code_prefix TEXT,
    customer_city TEXT,
    customer_state TEXT
);

-- 2. Geolocation Dataset (No Primary Key as zip codes repeat)
DROP TABLE IF EXISTS olist_geolocation_dataset CASCADE;
CREATE TABLE olist_geolocation_dataset (
    geolocation_zip_code_prefix TEXT,
    geolocation_lat NUMERIC,
    geolocation_lng NUMERIC,
    geolocation_city TEXT,
    geolocation_state TEXT
);

-- 3. Products Dataset
DROP TABLE IF EXISTS olist_products_dataset CASCADE;
CREATE TABLE olist_products_dataset (
    product_id TEXT PRIMARY KEY,
    product_category_name TEXT,
    product_name_lenght INTEGER,
    product_description_lenght INTEGER,
    product_photos_qty INTEGER,
    product_weight_g INTEGER,
    product_length_cm INTEGER,
    product_height_cm INTEGER,
    product_width_cm INTEGER
);

-- 4. Sellers Dataset
DROP TABLE IF EXISTS olist_sellers_dataset CASCADE;
CREATE TABLE olist_sellers_dataset (
    seller_id TEXT PRIMARY KEY,
    seller_zip_code_prefix TEXT,
    seller_city TEXT,
    seller_state TEXT
);

-- 5. Orders Dataset
DROP TABLE IF EXISTS olist_orders_dataset CASCADE;
CREATE TABLE olist_orders_dataset (
    order_id TEXT PRIMARY KEY,
    customer_id TEXT,
    order_status TEXT,
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);

-- 6. Order Items Dataset
DROP TABLE IF EXISTS olist_order_items_dataset CASCADE;
CREATE TABLE olist_order_items_dataset (
    order_id TEXT,
    order_item_id INTEGER,
    product_id TEXT,
    seller_id TEXT,
    shipping_limit_date TIMESTAMP,
    price NUMERIC,
    freight_value NUMERIC
);

-- 7. Order Payments Dataset
DROP TABLE IF EXISTS olist_order_payments_dataset CASCADE;
CREATE TABLE olist_order_payments_dataset (
    order_id TEXT,
    payment_sequential INTEGER,
    payment_type TEXT,
    payment_installments INTEGER,
    payment_value NUMERIC
);

-- 8. Order Reviews Dataset
DROP TABLE IF EXISTS olist_order_reviews_dataset CASCADE;
CREATE TABLE olist_order_reviews_dataset (
    review_id TEXT,
    order_id TEXT,
    review_score INTEGER,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date TIMESTAMP,
    review_answer_timestamp TIMESTAMP
);

-- 9. Product Category Name Translation
DROP TABLE IF EXISTS product_category_name_translation CASCADE;
CREATE TABLE product_category_name_translation (
    product_category_name TEXT PRIMARY KEY,
    product_category_name_english TEXT
);




-- Link Orders to Customers
ALTER TABLE olist_orders_dataset
ADD CONSTRAINT fk_orders_customers
FOREIGN KEY (customer_id) REFERENCES olist_customers_dataset(customer_id);

-- Link Order Items to Orders, Products, and Sellers
ALTER TABLE olist_order_items_dataset
ADD CONSTRAINT fk_items_orders
FOREIGN KEY (order_id) REFERENCES olist_orders_dataset(order_id),
ADD CONSTRAINT fk_items_products
FOREIGN KEY (product_id) REFERENCES olist_products_dataset(product_id),
ADD CONSTRAINT fk_items_sellers
FOREIGN KEY (seller_id) REFERENCES olist_sellers_dataset(seller_id);

-- Link Order Payments to Orders
ALTER TABLE olist_order_payments_dataset
ADD CONSTRAINT fk_payments_orders
FOREIGN KEY (order_id) REFERENCES olist_orders_dataset(order_id);

-- Link Order Reviews to Orders
ALTER TABLE olist_order_reviews_dataset
ADD CONSTRAINT fk_reviews_orders
FOREIGN KEY (order_id) REFERENCES olist_orders_dataset(order_id);



--copy com
COPY olist_customers_dataset FROM 'D:\SIBM\Resume Project\SQL Python\archive\olist_customers_dataset.csv' DELIMITER ',' CSV HEADER;

--COPY olist_geolocation_dataset FROM 'D:\SIBM\Resume Project\SQL Python\archive\olist_geolocation_dataset.csv' DELIMITER ',' CSV HEADER;

COPY olist_products_dataset FROM 'D:\SIBM\Resume Project\SQL Python\archive\olist_products_dataset.csv' DELIMITER ',' CSV HEADER;

COPY olist_sellers_dataset FROM 'D:\SIBM\Resume Project\SQL Python\archive\olist_sellers_dataset.csv' DELIMITER ',' CSV HEADER;

COPY olist_orders_dataset FROM 'D:\SIBM\Resume Project\SQL Python\archive\olist_orders_dataset.csv' DELIMITER ',' CSV HEADER;

COPY olist_order_items_dataset FROM 'D:\SIBM\Resume Project\SQL Python\archive\olist_order_items_dataset.csv' DELIMITER ',' CSV HEADER;

COPY olist_order_payments_dataset FROM 'D:\SIBM\Resume Project\SQL Python\archive\olist_order_payments_dataset.csv' DELIMITER ',' CSV HEADER;

COPY olist_order_reviews_dataset FROM 'D:\SIBM\Resume Project\SQL Python\archive\olist_order_reviews_dataset.csv' DELIMITER ',' CSV HEADER;

COPY product_category_name_translation FROM 'D:\SIBM\Resume Project\SQL Python\archive\product_category_name_translation.csv' DELIMITER ',' CSV HEADER;



--Cheking data has imported
select * from olist_geolocation_dataset;



-- Orders
CREATE INDEX IF NOT EXISTS ix_orders_order_id ON olist_orders_dataset(order_id);
CREATE INDEX IF NOT EXISTS ix_orders_customer_id ON olist_orders_dataset(customer_id);
CREATE INDEX IF NOT EXISTS ix_orders_purchase_date ON olist_orders_dataset(order_purchase_timestamp);

-- Order Items
CREATE INDEX IF NOT EXISTS ix_items_order_id ON olist_order_items_dataset(order_id);
CREATE INDEX IF NOT EXISTS ix_items_product_id ON olist_order_items_dataset(product_id);
CREATE INDEX IF NOT EXISTS ix_items_seller_id ON olist_order_items_dataset(seller_id);

-- Customers
CREATE INDEX IF NOT EXISTS ix_customers_customer_id ON olist_customers_dataset(customer_id);
CREATE INDEX IF NOT EXISTS ix_customers_state ON olist_customers_dataset(customer_state);

-- Payments
CREATE INDEX IF NOT EXISTS ix_payments_order_id ON olist_order_payments_dataset(order_id);

-- Reviews
CREATE INDEX IF NOT EXISTS ix_reviews_order_id ON olist_order_reviews_dataset(order_id);



--
-- Export bi_dim_product
COPY (SELECT * FROM bi_dim_product) TO 'D:\SIBM\Resume Project\bi_dim_product.csv' WITH CSV HEADER;

-- Export bi_fact_order
COPY (SELECT * FROM bi_fact_order) TO 'D:\SIBM\Resume Project\bi_fact_order.csv' WITH CSV HEADER;

-- Export bi_fact_review_latest
COPY (SELECT * FROM bi_fact_review_latest) TO 'D:\SIBM\Resume Project\bi_fact_review_latest.csv' WITH CSV HEADER;

-- Export bi_fact_sales
COPY (SELECT * FROM bi_fact_sales) TO 'D:\SIBM\Resume Project\bi_fact_sales.csv' WITH CSV HEADER;

-- Export bi_payments_order
COPY (SELECT * FROM bi_payments_order) TO 'D:\SIBM\Resume Project\bi_payments_order.csv' WITH CSV HEADER;