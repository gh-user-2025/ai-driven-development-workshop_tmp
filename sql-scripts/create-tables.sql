-- テーブル作成スクリプト
-- Azure SQL Database用

-- Userテーブルの作成
CREATE TABLE User (
    userId NVARCHAR(50) PRIMARY KEY,
    name NVARCHAR(100),
    email NVARCHAR(100),
    password NVARCHAR(100)
);

-- Equipmentテーブルの作成
CREATE TABLE Equipment (
    equipmentId NVARCHAR(50) PRIMARY KEY,
    name NVARCHAR(100),
    type NVARCHAR(50),
    status NVARCHAR(50),
    lastMaintenanceDate DATE
);

-- Maintenanceテーブルの作成
CREATE TABLE Maintenance (
    maintenanceId NVARCHAR(50) PRIMARY KEY,
    equipmentId NVARCHAR(50),
    maintenanceDate DATE,
    description NVARCHAR(255),
    FOREIGN KEY (equipmentId) REFERENCES Equipment(equipmentId)
);

-- Alertテーブルの作成
CREATE TABLE Alert (
    alertId NVARCHAR(50) PRIMARY KEY,
    equipmentId NVARCHAR(50),
    alertDate DATE,
    alertType NVARCHAR(50),
    description NVARCHAR(255),
    FOREIGN KEY (equipmentId) REFERENCES Equipment(equipmentId)
);
