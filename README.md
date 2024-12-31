# 🍽️POS System™️

A comprehensive Point of Sale system designed specifically for Mr.Kottu restaurant operations. This system seamlessly handles customer management, inventory control, and order processing through an intuitive interface built with Java Servlets, Bootstrap, and MySQL.

## ✨ Core Features

### 🛒 Order Management
The system facilitates efficient order processing with real-time inventory tracking and customer management. Each order is automatically tracked with its unique identifier, maintaining relationships between customers, items, and order details.

### 📦 Inventory Control
Comprehensive inventory management allows tracking of:
- Item stock levels with automatic updates
- Product categorization
- Price management
- Stock alerts and reports

### 👥 Customer Relationship Management
Maintain detailed customer profiles and order history, enabling personalized service and improved customer relationships.

## 🛠️ Technology Foundation

### 🔧 Backend Architecture
- ☕ Java Servlets for robust business logic
- 🗄️ MySQL Database for reliable data storage
- 🔌 JDBC for efficient database connectivity
- 📡 RESTful API for data exchange

### 🎨 Frontend Implementation
- 📱 HTML5 & CSS3 for modern interfaces
- 🎁 Bootstrap 5.3.2 for responsive design
- ⚡ JavaScript (ES6+) for dynamic interactions
- 🔄 jQuery for enhanced user experience

## 📊 Database Schema

### 🏗️ Tables Structure

#### Customers (customer)
```sql
CREATE TABLE customer (
    id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200),
    contact VARCHAR(15)
);
```

#### Products (item)
```sql
CREATE TABLE item (
    id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    category VARCHAR(50)
);
```

#### Orders (orders)
```sql
CREATE TABLE orders (
    id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10),
    date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);
```

#### Order Details (order_items)
```sql
CREATE TABLE order_items (
    order_id VARCHAR(10),
    item_id VARCHAR(10),
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (order_id, item_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (item_id) REFERENCES item(id)
);
```

## 🚀 Getting Started

### System Requirements
- ☕ JDK 8 or higher
- 🗄️ MySQL 5.7 or higher
- 🌐 Apache Tomcat 8.5 or higher
- 🏗️ Maven 3.6 or higher
- 🌍 Modern web browser

### Installation Steps

1. Clone the repository:
```bash
git clone https://github.com/yourusername/mrkottu-pos.git
cd mrkottu-pos
```

2. Create the database:
```bash
mysql -u your_username -p < database/init.sql
```

3. Configure database connection:
   - Locate `src/main/java/config/DBConnection.java`
   - Update database credentials

4. Build and deploy:
```bash
mvn clean package
# Deploy the generated WAR file to Tomcat
```

## 📁 Project Structure
```
mrkottu-pos/
├── 📂 src/
│   ├── 📂 main/
│   │   ├── 📂 java/
│   │   │   ├── 📂 servlet/
│   │   │   ├── 📂 model/
│   │   │   └── 📂 config/
│   │   └── 📂 webapp/
│   │       ├── 📂 WEB-INF/
│   │       ├── 📂 css/
│   │       ├── 📂 js/
│   │       └── 📄 index.html
├── 📂 database/
│   └── 📄 init.sql
├── 📄 pom.xml
└── 📄 README.md
```

## 🔒 Security Implementation
- 🛡️ Prepared statements for SQL injection prevention
- 🔐 Transaction management for data integrity
- 🚫 Input validation and sanitization
- 🔑 Role-based access control

## 🤝 Contributing
We welcome contributions! Please:
1. Fork the repository
2. Create your feature branch: `git checkout -b feature/NewFeature`
3. Commit changes: `git commit -m '✨ Add NewFeature'`
4. Push to branch: `git push origin feature/NewFeature`
5. Submit a Pull Request

## 📜 License
This project is licensed under the MIT License - see [LICENSE](LICENSE) for details.
