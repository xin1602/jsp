USE bookstore;
-- DROP TABLE IF EXISTS members;
-- CREATE TABLE members (
--   member_id INT PRIMARY KEY AUTO_INCREMENT, -- 會員ID，主鍵，自動遞增
--   member_name VARCHAR(100) NOT NULL, -- 會員姓名，不可為空值
--   email VARCHAR(100) UNIQUE NOT NULL, -- 電子郵件，唯一且不可為空值，作為登入帳號使用
--   password VARCHAR(50) NOT NULL, -- 密碼，不可為空值，作為登入密碼使用
--   gender VARCHAR(6) NOT NULL, -- 性別，包含男生、女生、其他
--   phone_number VARCHAR(10), -- 電話號碼
--   city VARCHAR(10), -- 縣市區
--   district VARCHAR(10), -- 鄉鎮市區
--   address VARCHAR(100), -- 詳細地址
--   birthday DATE, -- 生日
--   registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- 註冊日期，預設為目前時間
-- );
-- INSERT INTO members (member_name, email, password, gender, phone_number, city, district, address, birthday)
-- VALUES
--   ('管理員', 'admin@com', 'admin', '男',  '0912345678', '桃園市', '中壢區', '中北路200號', '1990-01-01'),
--   ('李欣樺', '11044106@cycu.edu.tw', '11044106', '女',  '0912345678', '桃園市', '中壢區', '中北路200號', '2002-11-01'),
--   ('辜麗慈', '11044114@cycu.edu.tw', '11044114', '女',  '0912345678', '桃園市', '中壢區', '中北路200號', '2003-02-01'),
--   ('陳威宏', '11044144@cycu.edu.tw', '11044144', '男',  '0912345678', '桃園市', '中壢區', '中北路200號', '2002-09-28'),
--   ('許恬綺', '11044218@cycu.edu.tw', '11044218', '女',  '0912345678', '桃園市', '中壢區', '中北路200號', '2002-11-01'),
--   ('黃雅芳', '11044240@cycu.edu.tw', '11044240', '女',  '0912345678', '桃園市', '中壢區', '中北路200號', '2003-02-01'),
--   ('陳亮竹', '11044245@cycu.edu.tw', '11044245', '女',  '0912345678', '桃園市', '中壢區', '中北路200號', '2002-09-28');
--   
DROP TABLE IF EXISTS about;
CREATE TABLE about (
  about_id INT NOT NULL PRIMARY KEY,
  about_name VARCHAR(3) NOT NULL,
  about_exp VARCHAR(500) NOT NULL
);
INSERT INTO about VALUE ('1', '許恬綺', '心得');
INSERT INTO about VALUE ('2', '黃雅芳', '我很沉浸在寫網頁的過程，雖然會遇到跑版之類的困難，
但是經過不斷的改進之後，能把網頁寫成自己喜歡的樣子很有成就感。重要的是感謝與我們合作的後端，
給了我們很充裕的時間製作網頁，而他們能在短時間內完成所有的連結，真的超棒!');
INSERT INTO about VALUE ('3', '陳亮竹', '雖然過去已經寫過網頁，但因為過去是用套版，
而這一次卻是自己架構再把他寫出來。這個專案做完之後讓我非常有成就感，也謝謝後端的支持讓我們做出來我們想要的樣子。');
INSERT INTO about VALUE ('4', '李欣樺', '下學期負責後端的部分後，才比較清楚前後端的分工應該要怎麼去區分，
以及整合的時候要注意哪些細節。我們也嘗試在後台建立瀏覽者點閱分析，可以隨時去這個頁面看數據，
藉由知道某類型適合哪個年齡層的人或哪個性別的人，來做出有效且精準的決策。
最後，我們這組的組員非常棒，合作很愉快。');
INSERT INTO about VALUE ('5', '辜麗慈', '這次擔任後端開發的角色，因此code側重的能力較為不同，
除了要看懂前端的框架、標籤選擇、切版，還要思考後端怎麼運用簡潔明瞭的邏輯輸出內容。
在這個過程中，判斷的依據尤為重要，因此使用DS, SQL, Array去輔助想要抓取的data。
儘管每次看到500或是一堆不知所云的錯誤都會想忍不住大叫，但我認為這還是一次很重要的練習。
謝謝我的後端戰友們，如果沒有他們我可能會爆肝，謝謝我們的互相扶持～讓痛苦是有意義的');
INSERT INTO about VALUE ('6', '陳威宏', '秉持著大一從做中學的精神，繼續在網站設計的領域由後端的角度奮戰，
後端的核心在於實現商業邏輯，果然邏輯這件事情是很難建立關聯的。在自學與不斷收到error:500的錯誤中不斷嘗試與思考究竟要做到什麼地步，
好像怎麼寫都對又好像怎麼寫都錯，卻又不甘於算了，還是方便就好。非常感謝組員們用盡了耐心彼此交換意見，讓這份專案能夠順利完工。');


#合併產品表與留言板＝會員評論紀錄
-- DELIMITER $$
-- DROP PROCEDURE IF EXISTS member_comment; $$
-- CREATE PROCEDURE member_comment (IN memberName varchar(100))
-- BEGIN
--     select products.img, board.comments_date, products.product_name, board.star, board.comments
--     from board
--     join products on(board.product_id=products.product_id)
--     where board.member_name=memberName
--     order by comments_date desc;
-- END $$
-- DELIMITER ;

-- #建立以性別分類的各類型點閱人數 view
-- DROP VIEW IF EXISTS click_gender_view;
-- CREATE VIEW click_gender_view AS
-- SELECT
-- 	members.gender,
-- 	SUM(CASE WHEN click.horry_count > 0 THEN 1 ELSE 0 END) as horry_nop, 
--     SUM(CASE WHEN click.love_count > 0 THEN 1 ELSE 0 END) as love_nop,
--     SUM(CASE WHEN click.suspense_count > 0 THEN 1 ELSE 0 END) as suspense_nop,
--     SUM(CASE WHEN click.fantasy_count > 0 THEN 1 ELSE 0 END) as fantasy_nop
-- FROM click , members
-- where click.member_id = members.member_id
-- GROUP BY gender;

-- #查詢某類型某性別的點閱人數
-- DELIMITER $$
-- DROP PROCEDURE IF EXISTS click_gender_nop; $$
-- CREATE PROCEDURE click_gender_nop (類型 varchar(10),性別 VARCHAR(6))
-- BEGIN
-- 	select
-- 	CASE
-- 		WHEN 類型='horry' THEN (select horry_nop from click_gender_view where gender=性別)
-- 		WHEN 類型='love' THEN (select love_nop from click_gender_view where gender=性別)
--         WHEN 類型='suspense' THEN (select suspense_nop from click_gender_view where gender=性別)
--         WHEN 類型='fantasy' THEN (select fantasy_nop from click_gender_view where gender=性別)
-- 		ELSE 0 
--     end as 此類型此性別的點閱人數
--     from click_gender_view
--     where gender=性別;    
-- END $$
-- DELIMITER ;


-- #建立以性別分類的各類型點閱人數 view
--  # 此查詢使用 LEFT JOIN 將年齡層列表 (age_groups) 與點擊數據 (click) 進行連接，以包含所有年齡層，即使在點擊數據中沒有對應的記錄。然後，使用 IFNULL 函數將不存在的點擊數設為 0。
-- DROP VIEW IF EXISTS click_age_group_view;
-- CREATE VIEW click_age_group_view AS
-- SELECT
--     age_groups.age_group,
--     IFNULL(click.horry_nop, 0) as horry_nop,
--     IFNULL(click.love_nop, 0) as love_nop,
--     IFNULL(click.suspense_nop, 0) as suspense_nop,
--     IFNULL(click.fantasy_nop, 0) as fantasy_nop
-- FROM
--     (SELECT '0-10' AS age_group
--      UNION SELECT '11-20'
--      UNION SELECT '21-30'
--      UNION SELECT '31-40'
--      UNION SELECT '41-50'
--      UNION SELECT '51-60'
--      UNION SELECT '61-70'
--      UNION SELECT 'over 71') AS age_groups
-- LEFT JOIN
--     (SELECT
--         CASE
--             WHEN TIMESTAMPDIFF(YEAR, members.birthday, CURDATE()) BETWEEN 0 AND 10 THEN '0-10'
--             WHEN TIMESTAMPDIFF(YEAR, members.birthday, CURDATE()) BETWEEN 11 AND 20 THEN '11-20'
--             WHEN TIMESTAMPDIFF(YEAR, members.birthday, CURDATE()) BETWEEN 21 AND 30 THEN '21-30'
--             WHEN TIMESTAMPDIFF(YEAR, members.birthday, CURDATE()) BETWEEN 31 AND 40 THEN '31-40'
--             WHEN TIMESTAMPDIFF(YEAR, members.birthday, CURDATE()) BETWEEN 41 AND 50 THEN '41-50'
--             WHEN TIMESTAMPDIFF(YEAR, members.birthday, CURDATE()) BETWEEN 51 AND 60 THEN '51-60'
--             WHEN TIMESTAMPDIFF(YEAR, members.birthday, CURDATE()) BETWEEN 61 AND 70 THEN '61-70'
--             ELSE 'over 71'
--         END AS age_group,
--         SUM(CASE WHEN click.horry_count > 0 THEN 1 ELSE 0 END) as horry_nop, 
--         SUM(CASE WHEN click.love_count > 0 THEN 1 ELSE 0 END) as love_nop,
--         SUM(CASE WHEN click.suspense_count > 0 THEN 1 ELSE 0 END) as suspense_nop,
--         SUM(CASE WHEN click.fantasy_count > 0 THEN 1 ELSE 0 END) as fantasy_nop
--     FROM click , members
--     WHERE click.member_id = members.member_id
--     GROUP BY age_group) AS click ON age_groups.age_group = click.age_group;

-- #查詢某類型某年齡層的點閱人數
-- DELIMITER $$
-- DROP PROCEDURE IF EXISTS click_age_group_nop; $$
-- CREATE PROCEDURE click_age_group_nop (book_type varchar(10),age varchar(7))
-- BEGIN
-- 	select
-- 	CASE
-- 		WHEN book_type='horry' THEN (select horry_nop from click_age_group_view where age_group like concat('%', age, '%'))
-- 		WHEN book_type='love' THEN (select love_nop from click_age_group_view where age_group like concat('%', age, '%'))
--         WHEN book_type='suspense' THEN (select suspense_nop from click_age_group_view where age_group like concat('%', age, '%'))
--         WHEN book_type='fantasy' THEN (select fantasy_nop from click_age_group_view where age_group like concat('%', age, '%'))
-- 		ELSE '0' 
--     end as 此類型此年齡層的點閱人數
--     from click_age_group_view
--     where age_group like age;    
-- END $$
-- DELIMITER ;

