-- サンプルデータ登録スクリプト
-- Azure SQL Database用

-- Userテーブルにサンプルデータを挿入
INSERT INTO User (userId, name, email, password) VALUES
('U001', '山田 太郎', 'taro.yamada@example.com', 'password123'),
('U002', '鈴木 花子', 'hanako.suzuki@example.com', 'password456'),
('U003', '佐藤 次郎', 'jiro.sato@example.com', 'password789');

-- Equipmentテーブルにサンプルデータを挿入
INSERT INTO Equipment (equipmentId, name, type, status, lastMaintenanceDate) VALUES
('E001', 'コンベアベルト', '搬送装置', '稼働中', '2023-12-01'),
('E002', 'ロボットアーム', '組立装置', 'メンテナンス中', '2023-11-15'),
('E003', 'CNCマシン', '加工装置', '停止中', '2023-10-20');

-- Maintenanceテーブルにサンプルデータを挿入
INSERT INTO Maintenance (maintenanceId, equipmentId, maintenanceDate, description) VALUES
('M001', 'E001', '2023-12-01', 'ベルトの交換'),
('M002', 'E002', '2023-11-15', 'アームの調整'),
('M003', 'E003', '2023-10-20', 'オイルの交換');

-- Alertテーブルにサンプルデータを挿入
INSERT INTO Alert (alertId, equipmentId, alertDate, alertType, description) VALUES
('A001', 'E001', '2023-12-05', '異常検知', 'ベルトの速度異常'),
('A002', 'E002', '2023-11-20', 'メンテナンス必要', 'アームの動作不良'),
('A003', 'E003', '2023-10-25', '停止', 'CNCマシンの電源オフ');
