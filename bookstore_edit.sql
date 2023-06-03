-- DROP DATABASE IF EXISTS bookstore;

-- CREATE DATABASE bookstore CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE bookstore;
DROP TABLE IF EXISTS members;
CREATE TABLE members (
  member_id INT PRIMARY KEY AUTO_INCREMENT, -- 會員ID，主鍵，自動遞增
  member_name VARCHAR(100) NOT NULL, -- 會員姓名，不可為空值
  email VARCHAR(100) UNIQUE NOT NULL, -- 電子郵件，唯一且不可為空值，作為登入帳號使用
  password VARCHAR(50) NOT NULL, -- 密碼，不可為空值，作為登入密碼使用
  gender VARCHAR(6) NOT NULL, -- 性別，包含男生、女生、其他
  phone_number VARCHAR(10), -- 電話號碼
  city VARCHAR(10), -- 縣市區
  district VARCHAR(10), -- 鄉鎮市區
  address VARCHAR(100), -- 詳細地址
  birthday DATE, -- 生日
  registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- 註冊日期，預設為目前時間
);
INSERT INTO members (member_name, email, password, gender, phone_number, city, district, address, birthday)
VALUES
  ('管理員', 'admin@com', 'admin', 'male',  '0912345678', '桃園市', '中壢區', '中北路200號', '1990-01-01'),
  ('李欣樺', '11044106@cycu.edu.tw', '11044106', '女',  '0912345678', '桃園市', '中壢區', '中北路200號', '2002-11-01'),
  ('辜麗慈', '11044114@cycu.edu.tw', '11044114', '女',  '0912345678', '桃園市', '中壢區', '中北路200號', '2003-02-01'),
  ('陳威宏', '11044144@cycu.edu.tw', '11044144', '男',  '0912345678', '桃園市', '中壢區', '中北路200號', '2002-09-28'),
  ('許恬綺', '11044218@cycu.edu.tw', '11044218', '女',  '0912345678', '桃園市', '中壢區', '中北路200號', '2002-11-01'),
  ('黃雅芳', '11044240@cycu.edu.tw', '11044240', '女',  '0912345678', '桃園市', '中壢區', '中北路200號', '2003-02-01'),
  ('陳亮竹', '11044245@cycu.edu.tw', '11044245', '女',  '0912345678', '桃園市', '中壢區', '中北路200號', '2002-09-28');


