CREATE DATABASE qly_ban_hang;
USE qly_ban_hang;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_items (
    Order_id INT NOT NULL,
    Customer_id INT NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(15,2) NOT NULL,
    FOREIGN KEY (Order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (Customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Customers (customer_id, customer_name)
VALUES
(1, 'Nguyen Van A'),
(2, 'Vo Thi B'),
(3, 'Le Van C');

INSERT INTO Orders (order_id, order_date, customer_id)
VALUES
(201, '2026-09-20', 1),
(202, '2020-09-21', 2),
(203, '2026-09-22', 3);

INSERT INTO Order_items
(Order_id, Customer_id, product_name, quantity, price)
VALUES
(201, 1, 'Iphone 15', 1, 15000000),
(201, 1, 'Ban phim may tinh', 2, 1000000),

(202, 2, 'iPhone 18', 1, 30000000),
(202, 2, 'Tai nghe', 1, 5000000),

(203, 3, 'Sac pin ', 2, 3000000);
-- Hiển thị:mã đơn hàng, ngày đặt hàng, tên khách hàng
SELECT 
    o.order_id,
    o.order_date,
    c.customer_name
FROM Orders o
JOIN Customers c
    ON o.customer_id = c.customer_id;
    
-- Hiển thị: danh sách sản phẩm trong mỗi đơn hàng    
SELECT
    o.order_id,
    oi.product_name,
    oi.quantity,
    oi.price
FROM Orders o
JOIN Order_items oi
    ON o.order_id = oi.Order_id;
    
-- tổng tiền của mỗi đơn hàng    
SELECT
    oi.Order_id,
    SUM(oi.quantity * oi.price) AS total_amount
FROM Order_items oi
GROUP BY oi.Order_id;

-- Hiển thị:các đơn hàng có tổng tiền lớn hơn 10.000.000
SELECT
    oi.Order_id,
    SUM(oi.quantity * oi.price) AS total_amount
FROM Order_items oi
GROUP BY oi.Order_id
HAVING SUM(oi.quantity * oi.price) > 10000000;
