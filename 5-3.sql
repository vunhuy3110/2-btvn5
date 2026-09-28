CREATE DATABASE qly_san_pham;
USE qly_san_pham;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(100) NOT NULL,
    price DECIMAL(15,2) NOT NULL
);
INSERT INTO products
(product_id, product_name, category, price)
VALUES
(1, 'Macbook air', 'Laptop', 25000000),
(2, 'Macbook pro', 'Laptop', 18000000),
(3, 'IMac', 'Laptop', 22000000),

(4, 'iPhone 16', 'Dien thoai', 30000000),
(5, 'iPhone 17', 'Dien thoai', 28000000),
(6, 'iPhone 18', 'Dien thoai', 15000000),

(7, 'Tai nghe', 'Phu kien', 5000000),
(8, 'Ban phim may tinh', 'Phu kien', 3000000),
(9, 'Day sac', 'Phu kien', 2000000);

-- Sản phẩm có giá cao hơn giá trung bình
SELECT *
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
);


-- Sản phẩm có giá cao nhất trong từng loại
SELECT *
FROM products p
WHERE price = (
    SELECT MAX(price)
    FROM products
    WHERE category = p.category
);


-- Sản phẩm thuộc loại có ít nhất một sản phẩm giá trên 20 triệu
SELECT *
FROM products
WHERE category IN (
    SELECT category
    FROM products
    WHERE price > 20000000
);