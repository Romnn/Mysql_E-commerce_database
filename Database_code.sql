mysql -u root -p;
show databases;
CREATE DATABASE parajuliMarketingCenter;
use parajuliMarketingCenter;

CREATE TABLE customers 
(custID INT PRIMARY KEY UNIQUE AUTO_INCREMENT, 
name VARCHAR (50), 
address VARCHAR(250), 
phone VARCHAR(50),
socialMedia VARCHAR(50)
);


INSERT INTO customers(name,address,phone,socialMedia) VALUES 
("Pratik Ghimere","Satungal,Kathmandu","9841122330","@iampratik"),
("Prithvi Gyawali","Pulchowk,Lalitpur","9842211330","@prithvig"),
("Sanam Maharjan","Thimi,Bhaktapur","9843311220","@mahasanam")
;



CREATE TABLE suppliers 
(supplierID INT PRIMARY KEY UNIQUE AUTO_INCREMENT, 
name VARCHAR (50), 
address VARCHAR(250), 
phone VARCHAR(15),
panNo VARCHAR(50)
);

INSERT INTO suppliers(name,address,phone,panNo) VALUES 
("Gadgets and Gears","Mahaboudha,Kathmandu","4422330","1272360213456"),
("Old Pinch Shop","Kharibot,Ekantakuna,Lalitpur","9864478090","547239840124"),
("Camera House","Newroad,Kathmandu","4411220","345782390812")
;



CREATE TABLE transporters 
(transporterID INT PRIMARY KEY UNIQUE AUTO_INCREMENT, 
name VARCHAR (50), 
address VARCHAR(250), 
phone VARCHAR(15),
licNumber VARCHAR(50) UNIQUE
);

INSERT INTO transporters(name,address,phone,licNumber) VALUES 
("Sisir Junglee","Laxminagar,Delhi","981020304","60553478"),
("RupChandra Bista","Palung,Taha","981020305","74823083"),
("Anand Arun","Balaju,Kathmandu","981020306","65748938"),
("Yugal Dhakal","Kalimati,Kathmandu","981020307","76825273")
;


CREATE TABLE items 
(itemID INT PRIMARY KEY UNIQUE AUTO_INCREMENT, 
name VARCHAR (50), 
price VARCHAR(10), 
supplier INT,
availability VARCHAR(20),
FOREIGN KEY(supplier) REFERENCES suppliers(supplierID)
);

INSERT INTO items(name,price,supplier,availability) VALUES 
("Boya MM1 ShotGun Mic","5000","2","available"),
("Joy Room Laptop Bag","2000","2","available"),
("iPad pro 2018 cover","3000","2","available"),
("Cannon EOS 750D","8000","3","available"),
("Furex Gaming Mouse","800","1","available"),
("Digicom Bluetooth iPad Keyboard","4500","1","available")
;

CREATE TABLE orders 
(orderID INT PRIMARY KEY UNIQUE AUTO_INCREMENT, 
item INT, 
customer INT, 
transporter INT,
status VARCHAR(15),
FOREIGN KEY(item) REFERENCES items(itemID),
FOREIGN KEY(customer) REFERENCES customers(custID),
FOREIGN KEY(transporter) REFERENCES transporters(transporterID)
);

INSERT INTO orders(item,customer,transporter,status) VALUES 
("10","2","1","pending"),
("2","1","2","onRoad"),
("1","3","1","onRoad"),
("9","2","3","delivered"),
("8","1","3","pending"),
("7","3","2","delivered")
;


mysqldump -u root parajuliMarketingCenter > /Users/naive/Desktop/pkm.sql -p;
