# Azure SQL Database 用の SQL テーブル作成手順

このドキュメントでは、Azure SQL Database 用の SQL テーブルを作成する手順を説明します。

## 前提条件

- Azure アカウントが必要です。まだお持ちでない場合は、[Azure アカウントの作成](https://azure.microsoft.com/ja-jp/free/)を行ってください。
- Azure CLI がインストールされていることを確認してください。インストール方法は `.devcontainer/devcontainer.json` ファイルに記載されています。

## 手順

### 1. Azure にログイン

まず、Azure CLI を使用して Azure にログインします。

```bash
az login
```

### 2. リソースグループの作成

次に、リソースグループを作成します。リソースグループは、Azure リソースを管理するためのコンテナです。

```bash
az group create --name <リソースグループ名> --location <リージョン>
```

### 3. Azure SQL Database サーバーの作成

Azure SQL Database サーバーを作成します。

```bash
az sql server create --name <サーバー名> --resource-group <リソースグループ名> --location <リージョン> --admin-user <管理者ユーザー名> --admin-password <管理者パスワード>
```

### 4. SQL Database の作成

Azure SQL Database サーバー内に SQL Database を作成します。

```bash
az sql db create --resource-group <リソースグループ名> --server <サーバー名> --name <データベース名> --service-objective S0
```

### 5. SQL Database への接続

SQL クライアントまたは Azure Data Studio を使用して、SQL Database に接続します。

### 6. テーブルの作成

以下の SQL コマンドを使用して、テーブルを作成します。

```sql
CREATE TABLE Equipment (
    equipmentId NVARCHAR(50) PRIMARY KEY,
    name NVARCHAR(100),
    type NVARCHAR(50),
    status NVARCHAR(50),
    lastMaintenanceDate DATE
);
```

## まとめ

以上の手順で、Azure SQL Database 用の SQL テーブルを作成することができます。各手順を順番に実行し、テーブルの作成を完了してください。
