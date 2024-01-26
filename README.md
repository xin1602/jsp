# 看Bar！網路書店
#### 網站連結(僅前端展示)：https://karaliang.github.io/BookBar/product.html

### 一、系統架構圖
<img src='img/show/architechture_diagram.png'> 

### 二、操作說明與流程圖

#### 1.會員管理
- 說明：帳號註冊時我們最少需要蒐集姓名、email、密碼等資訊，其餘資訊則是因應使用者點閱分析、購物車購買商品所需進而設立的欄位，包含性別、電話號碼、地址與生日。

<div align=center>
    <img src='img/show/login.png'> 
    <img src='img/show/member.png'> 
</div> 


#### 2.後台管理
- 商品頁面說明：分為三大區塊，商品資訊區、留言區、推薦商品區。第一區塊抓取number比對資料庫product_id輸出相應產品資訊。
- 搜尋頁面說明：當使用者在搜尋框輸入訊息並按下搜尋的按鈕，就會依據使用者所輸入的資訊和資料庫的書名、IBSN等資料進行比對，之後顯示在搜尋結果的頁面上。	
<img src='img/show/manage.png'> 

#### 3.商品頁面與搜尋
<img src='img/show/product.png'> 
- 商品頁面說明：透過nav去選擇欲達到的產品分類頁面。由於前端使用表格來呈現商品排列頁面（一行四本），因此相對對邏輯作出調整。以horry.jsp為例，先讀取恐怖類別總共有幾本書，再運用迴圈判斷當前讀取到第幾本書，每一行的第一本除了要輸出商品本身還要加上<tr>，而第四本則是要加上</tr>。接著點選商品即可導向商品詳細資訊頁面(book.jsp?number=productid)
- 搜尋商品說明：在nav提供商品搜尋並限制只能輸入中英文與數字，輸入內容後會藉由search.jsp抓取輸入內容，接著與資料庫內容比對，讀取符合條件的總筆數，再運用迴圈與商品類別類似的手法輸出結果。


#### 4.購物車
- 判斷是否登入： 在主頁(index.jsp)點購物車icon，若未登入則顯示[請先登入！]，若登入則成功進入cart.jsp。
- 用加減按鈕調整數量： 在商品頁book.jsp以及購物車頁 cart.jsp皆可藉由加減按鈕調整購買數量。
- 兩種模式 [ 加入購物車、直接購買 ] ： 點加入購物車會將商品加進購物車(to_cart.jsp)並跳回原先商品頁面。點直接購買則會將商品加進購物車 (to_cart.jsp) 並跳至購物車頁面cart.jsp 。
- 判斷庫存數量： 若無庫存，則無法購買。讓加減數量按鈕控制在大於0且不大於庫存數量，防止購買數量在後面下訂時會出現的數量有誤的問題。
- 購物車永久保存於資料庫： 將每位會員的購物車資料都存放在資料庫裡，因此登出過後，還是可以永久保留原先的購物車，只要再次登入就可以了。
- 優惠活動(有折扣)： 優惠活動為全館9折。購物車頁面(cart.jsp)與結帳前確認頁面(check.jsp)皆有扣除優惠折扣。
- 刪除購物車商品： 在購物車頁面(cart.jsp)可針對想刪除商品，點選刪除icon，則會以(delete_cart.jsp)進行刪除的處理。
- 下訂前的購買表單：在結帳前確認頁面(check.jsp)，需要購買人填寫購買表單，表單欄位會從資料庫提取此購買人的基本資訊，購買人在填寫資料時會更加方便迅速。確認購買商品數量金額無誤，且填好表單後，就可以點確認送出，進行提交訂單的動作(sand_order.jsp)。


<img src='img/show/cart.png'> 

#### 5.留言版
- 說明：商品頁面第二區塊。第一功能：顯示留言，沿用number抓取資料庫已存在的評論內容總筆數，若為0輸出目前無評論，反之依照留言日期讀取輸出；第二功能：新增留言，若未登入將跳轉登入頁面，而沒有填完完整資訊則要求重新填寫，最後上述條件皆有達成則新增成功。
<img src='img/show/board.png'> 


#### 6.使用者點閱分析與推薦系統
- 說明：此表統計每個會員在各類別的點擊次數。應用於個性化廣告板、推薦商品、使用者點閱分析。

- 資料搜集：利用session在瀏覽器中的特性，只要有一位使用者點進了某一項類別頁面(例如：horry.jsp,love.jsp...)或是某類型書籍(例如恐怖類型書籍：book.jsp?number=1)就會讓該類型點閱次數加一。
- 資料運用：
 - (a)	個人化廣告：以使用者點閱次數預測他 / 她感興趣的類型，投放相對應的個人化廣告，提高消費者的購買率。
 - (b)	推薦商品：以使用者點閱次數預測他 / 她感興趣的類型，投放相對應類型的商品，提高消費者的購買其他商品的機率。
 - (c)	使用者點閱分析：利用google的chart套件將點閱的人數、次數、年齡與性別等資料利用SQL中view, procedure等方法繪製出圖表，放在網頁中對應的欄位上。藉此可知道某類型商品的潛在客戶為哪些族群。
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
