# 看Bar！網路書店
#### 網站連結(僅前端展示)：https://karaliang.github.io/BookBar/product.html

### 一、系統架構圖
<img src='img/show/architechture_diagram.png'> 

### 二、操作說明與流程圖

#### 1.會員管理
- 說明：帳號註冊時我們最少需要蒐集姓名、email、密碼等資訊，其餘資訊則是因應使用者點閱分析、購物車購買商品所需進而設立的欄位，包含性別、電話號碼、地址與生日。
<img src='img/show/login.png'> 
<img src='img/show/member.png'> 

#### 2.後台管理
- 商品頁面說明：分為三大區塊，商品資訊區、留言區、推薦商品區。第一區塊抓取number比對資料庫product_id輸出相應產品資訊。
- 搜尋頁面說明：當使用者在搜尋框輸入訊息並按下搜尋的按鈕，就會依據使用者所輸入的資訊和資料庫的書名、IBSN等資料進行比對，之後顯示在搜尋結果的頁面上。	

<img src='img/show/manage.png'> 

#### 3.商品頁面與搜尋
<img src='img/show/product.png'> 

#### 4.購物車
<img src='img/show/cart.png'> 

#### 5.留言版
<img src='img/show/board.png'> 

#### 6.使用者點閱分析與推薦系統會員管理
<img src='img/show/analyze.png'> 

### 三、JSP程式列表清單

#### 1.統整性程式
- 統一建立資料庫連線：setsql.jsp
- 導覽列：nav.jsp(搜尋含SQL Injection)
- 頁尾：footer.jsp

#### 2.首頁
- 首頁：index.jsp

#### 3.會員管理系統
- 登入與註冊：login.jsp
- 登入處理：login_process.jsp (含SQL Injection)
- 註冊處理：register_process.jsp (含SQL Injection)
- 登出：logout.jsp
- 修改會員資料處理：update_profile_process.jsp (含SQL Injection)

#### 4.會員中心
- 會員中心總覽：member.jsp
- 修改會員資料：update_profile_data.jsp (含SQL Injection)
- 會員訂單紀錄：member_order.jsp
- 會員評論紀錄：member_comment.jsp (含Stored Procedure)

#### 5.後台管理
- 後台管理總覽：ｍanage.jsp
- 產品上架頁面：m_shelves.jsp
- 上架產品處理：add_product.jsp (含SQL Injection)
- 產品查詢： m_search.jsp
- 產品變更：m_edit.jsp
- 產品變更處理：edit_product.jsp (含SQL Injection)
- 銷貨紀錄頁面：m_sales.jsp
- 瀏覽者點閱行為分析：m_analyze.jsp (含Stored Procedure)


#### 6.商品頁面、推薦商品與搜尋
- 恐怖類書籍：horry.jsp
- 愛情類書籍：love.jsp
- 懸疑類書籍：suspense.jsp
- 科幻類書籍：fantasy.jsp
- 商品詳細資訊：book.jsp (含SQL Injection)
- 加入留言板：add_commemt_to_board.jsp (含SQL Injection)
- 留言板：board.jsp (含SQL Injection)
- 推薦商品：recommend.jsp
- 搜尋結果：search.jsp (含SQL Injection)


#### 7.購物車系統
- 加入購物車的處理：to_cart.jsp (含SQL Injection)
- 顯示購物車：cart.jsp
- 刪除購物車：delete_cart.jsp (含SQL Injection)
- 確認訂單、填寫基本資訊：check.jsp
- 訂單處理：sand_order.jsp (含SQL Injection)

#### 8.關於我們頁面
- 關於我們頁面：about_team.jsp
