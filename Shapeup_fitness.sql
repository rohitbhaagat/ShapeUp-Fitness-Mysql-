create database shapeup_fitness;
use shapeup_fitness;
CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    address VARCHAR(255)
);
INSERT INTO Members (member_id, first_name, last_name, age, gender, email, phone_number, address) VALUES
(1, 'Aarav', 'Sharma', 28, 'Male', 'aarav.sharma@example.com', '9876543210', '123 Main St, Delhi'),
(2, 'Aditi', 'Patel', 32, 'Female', 'aditi.patel@example.com', '9876543211', '456 Elm St, Mumbai'),
(3, 'Arjun', 'Singh', 30, 'Male', 'arjun.singh@example.com', '9876543212', '789 Oak St, Kolkata'),
(4, 'Ayesha', 'Khan', 26, 'Female', 'ayesha.khan@example.com', '9876543213', '456 Pine St, Chennai'),
(5, 'Amit', 'Gupta', 29, 'Male', 'amit.gupta@example.com', '9876543214', '789 Maple St, Bangalore'),
(6, 'Divya', 'Sharma', 27, 'Female', 'divya.sharma@example.com', '9876543215', '123 Cherry St, Hyderabad'),
(7, 'Rohan', 'Kumar', 31, 'Male', 'rohan.kumar@example.com', '9876543216', '456 Walnut St, Pune'),
(8, 'Neha', 'Jain', 25, 'Female', 'neha.jain@example.com', '9876543217', '789 Birch St, Jaipur'),
(9, 'Vivek', 'Verma', 33, 'Male', 'vivek.verma@example.com', '9876543218', '123 Spruce St, Ahmedabad'),
(10, 'Priya', 'Reddy', 28, 'Female', 'priya.reddy@example.com', '9876543219', '456 Cedar St, Lucknow');

select * from members;

CREATE TABLE Trainers (
    trainer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialty VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(15)
);

INSERT INTO Trainers (trainer_id, first_name, last_name, specialty, email, phone_number) VALUES
(1, 'Amit', 'Sharma', 'Yoga', 'amit.sharma@example.com', '9876543210'),
(2, 'Neha', 'Patel', 'Aerobics', 'neha.patel@example.com', '9876543211'),
(3, 'Raj', 'Singh', 'Weightlifting', 'raj.singh@example.com', '9876543212'),
(4, 'Priya', 'Kumar', 'Zumba', 'priya.kumar@example.com', '9876543213'),
(5, 'Rahul', 'Gupta', 'Pilates', 'rahul.gupta@example.com', '9876543214');

select * from trainers;

CREATE TABLE Supplements (
    supplement_id INT PRIMARY KEY,
    supplement_name VARCHAR(100),
    brand VARCHAR(100),
    price DECIMAL(10, 2)
);

INSERT INTO Supplements (supplement_id, supplement_name, brand, price) VALUES
(1, 'Protein Powder', 'MuscleTech', 29.99),
(2, 'Creatine Monohydrate', 'Optimum Nutrition', 19.99),
(3, 'Ashwagandha', 'Himalaya', 15.99),
(4, 'Turmeric', 'Organic India', 10.50),
(5, 'Omega-3 Fish Oil', 'Now Foods', 20.75),
(6, 'Multivitamin', 'MuscleBlaze', 25.00),
(7, 'Whey Protein Isolate', 'MyProtein', 34.99),
(8, 'BCAA', 'Optimum Nutrition', 29.95),
(9, 'Glutamine', 'Dymatize', 22.50),
(10, 'Creatine HCL', 'Cellucor', 27.25);

select * from supplements;

CREATE TABLE Facilities (
    facility_id INT PRIMARY KEY,
    facility_name VARCHAR(100),
    description TEXT,
    location VARCHAR(100)
);

INSERT INTO Facilities (facility_id, facility_name, description, location) VALUES
(1, 'Cardio Area', 'Contains treadmills, ellipticals, and stationary bikes.', 'First Floor'),
(2, 'Weight Room', 'Equipped with free weights and weightlifting machines.', 'Second Floor'),
(3, 'Yoga Studio', 'Dedicated space for yoga classes.', 'Third Floor'),
(4, 'Swimming Pool', 'Indoor heated pool for swimming workouts.', 'Ground Floor'),
(5, 'Group Fitness Studio', 'Space for group fitness classes such as Zumba and aerobics.', 'Basement');

select * from facilities;

CREATE TABLE Member_Subscriptions (
    subscription_id INT PRIMARY KEY,
    member_id INT,
    start_date DATE,
    end_date DATE,
    subscription_type VARCHAR(50),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

INSERT INTO Member_Subscriptions (subscription_id, member_id, start_date, end_date, subscription_type) VALUES
(1, 1, '2024-01-01', '2024-12-31', 'Gold'),
(2, 2, '2024-02-01', '2024-07-31', 'Silver'),
(3, 3, '2024-03-15', '2024-06-30', 'Bronze'),
(4, 4, '2024-01-15', '2024-12-15', 'Gold'),
(5, 5, '2024-02-20', '2024-08-20', 'Silver'),
(6, 6, '2024-04-05', '2024-09-30', 'Bronze'),
(7, 7, '2024-03-10', '2024-10-10', 'Gold'),
(8, 8, '2024-01-05', '2024-12-05', 'Silver'),
(9, 9, '2024-02-12', '2024-07-12', 'Bronze'),
(10, 10, '2024-05-20', '2024-11-20', 'Gold');

select * from member_Subscriptions;

CREATE TABLE Supplement_Purchases (
    purchase_id INT PRIMARY KEY,
    member_id INT,
    supplement_id INT,
    purchase_date DATE,
    quantity INT,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (supplement_id) REFERENCES Supplements(supplement_id)
);

INSERT INTO Supplement_Purchases (purchase_id, member_id, supplement_id, purchase_date, quantity) VALUES
(1, 1, 1, '2024-02-10', 1),
(2, 2, 2, '2024-02-11', 2),
(3, 3, 3, '2024-02-12', 1),
(4, 4, 4, '2024-02-13', 3),
(5, 5, 5, '2024-02-14', 1),
(6, 6, 6, '2024-02-15', 2),
(7, 7, 7, '2024-02-16', 1),
(8, 8, 8, '2024-02-17', 2),
(9, 9, 9, '2024-02-18', 1),
(10, 10, 10, '2024-02-19', 3);

select * from supplement_Purchases;

CREATE TABLE Member_Trainer_Assignments (
    assignment_id INT PRIMARY KEY,
    member_id INT,
    trainer_id INT,
    assignment_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (trainer_id) REFERENCES Trainers(trainer_id)
);

INSERT INTO Member_Trainer_Assignments (assignment_id, member_id, trainer_id, assignment_date) VALUES
(1, 1, 1, '2024-02-10'),
(2, 2, 2, '2024-02-11'),
(3, 3, 3, '2024-02-12'),
(4, 4, 4, '2024-02-13'),
(5, 5, 5, '2024-02-14'),
(6, 6, 1, '2024-02-15'),
(7, 7, 2, '2024-02-16'),
(8, 8, 3, '2024-02-17'),
(9, 9, 4, '2024-02-18'),
(10, 10, 5, '2024-02-19');

select * from Member_Trainer_Assignments;

CREATE TABLE Member_Facility_Use (
    use_id INT PRIMARY KEY,
    member_id INT,
    facility_id INT,
    use_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (facility_id) REFERENCES Facilities(facility_id)
);

INSERT INTO Member_Facility_Use (use_id, member_id, facility_id, use_date) VALUES
(1, 1, 1, '2024-02-12'),
(2, 2, 2, '2024-02-13'),
(3, 3, 3, '2024-02-14'),
(4, 4, 4, '2024-02-15'),
(5, 5, 5, '2024-02-16'),
(6, 6, 1, '2024-02-17'),
(7, 7, 2, '2024-02-18'),
(8, 8, 3, '2024-02-19'),
(9, 9, 4, '2024-02-20'),
(10, 10, 5, '2024-02-21');

select * from Member_Facility_Use;

-- 5 Subquaries 

-- Find Members with Gold Memberships:

SELECT *
FROM Members
WHERE member_id IN (
    SELECT member_id
    FROM Member_Subscriptions
    WHERE subscription_type = 'Gold'
);

-- Find Trainers Who Train Male Members:

SELECT *
FROM Trainers
WHERE trainer_id IN (
    SELECT trainer_id
    FROM Member_Trainer_Assignments
    WHERE member_id IN (
        SELECT member_id
        FROM Members
        WHERE gender = 'Male'
    )
);

-- Find Members Who Purchased Supplements That Cost More Than $20:

SELECT *
FROM Members
WHERE member_id IN (
    SELECT member_id
    FROM Supplement_Purchases
    WHERE supplement_id IN (
        SELECT supplement_id
        FROM Supplements
        WHERE price > 20.00
    )
);

-- Find Members Who Purchased Supplements With Quantity More Than 1:

SELECT *
FROM Members
WHERE member_id IN (
    SELECT member_id
    FROM Supplement_Purchases
    WHERE quantity > 1
);

-- Find Trainers Who Have Assigned Members with Gold Memberships:

SELECT *
FROM Trainers
WHERE trainer_id IN (
    SELECT trainer_id
    FROM Member_Trainer_Assignments
    WHERE member_id IN (
        SELECT member_id
        FROM Member_Subscriptions
        WHERE subscription_type = 'Gold'
    )
);

-- Find Members Who Purchased Supplements with a Quantity Greater Than 2:

SELECT *
FROM Members
WHERE member_id IN (
    SELECT member_id
    FROM Supplement_Purchases
    WHERE quantity > 2
);

-- JOINS

-- Right Join
-- Returns all rows from the right table (Member_Subscriptions), and the matched rows from the left table (Members). If there is no match, NULL values are returned from the left table.
SELECT *
FROM Members
RIGHT JOIN Member_Subscriptions ON Members.member_id = Member_Subscriptions.member_id;

-- Inner Join,
-- Returns only the rows with matching values in both tables.

SELECT *
FROM Members
INNER JOIN Member_Subscriptions ON Members.member_id = Member_Subscriptions.member_id;

-- Left Join:
-- Returns all rows from the left table (Members), and the matched rows from the right table (Member_Subscriptions). If there is no match, NULL values are returned from the right table.

SELECT *
FROM Members
LEFT JOIN Member_Subscriptions ON Members.member_id = Member_Subscriptions.member_id;

-- Cross Join:
-- Returns the Cartesian product of the two tables, meaning it returns all possible combinations of rows

SELECT *
FROM Members
CROSS JOIN Member_Subscriptions;

