-- 建立資料庫
CREATE DATABASE IF NOT EXISTS userdb;

-- 使用該資料庫
USE userdb;

-- 建立使用者資料表
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,        -- 自動遞增的主鍵
    username VARCHAR(255) UNIQUE NOT NULL,    -- 使用者名稱，必須唯一且不可為空
    password VARCHAR(255) NOT NULL,           -- 使用者密碼，儲存加密後的值
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- 創建時間，默認為當前時間
);

-- 插入初始測試資料（若帳號不存在）
INSERT INTO users (username, password)
SELECT 'testuser', '$2b$12$y6j1FjFN/f1MpsUzt.N4AO2HsnYJML0/D9fEyhVzC1qQQGE3d1P5W'
WHERE NOT EXISTS (SELECT * FROM users WHERE username = 'testuser');

-- 提示
-- '$2b$12$y6j1FjFN/f1MpsUzt.N4AO2HsnYJML0/D9fEyhVzC1qQQGE3d1P5W' 是一個加密後的密碼 "testpassword"
-- 如果需要插入更多使用者，可按照 INSERT INTO 的格式進行操作。

-- 確認是否正確執行
SELECT * FROM users; -- 查詢所有使用者以驗證是否正確創建

