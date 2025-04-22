# Azure Cosmos DB NoSQL API 用サンプルデータのインポート手順

このドキュメントでは、Azure Cosmos DB NoSQL API 用にサンプルデータをインポートする手順を説明します。

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

### 3. Azure Cosmos DB アカウントの作成

Azure Cosmos DB アカウントを作成します。

```bash
az cosmosdb create --name <アカウント名> --resource-group <リソースグループ名> --locations regionName=<リージョン>
```

### 4. データベースの作成

Azure Cosmos DB アカウント内にデータベースを作成します。

```bash
az cosmosdb sql database create --account-name <アカウント名> --resource-group <リソースグループ名> --name <データベース名>
```

### 5. コンテナの作成

データベース内にコンテナを作成します。コンテナは、データを格納するためのスキーマレスのコレクションです。

```bash
az cosmosdb sql container create --account-name <アカウント名> --resource-group <リソースグループ名> --database-name <データベース名> --name <コンテナ名> --partition-key-path "/partitionKey"
```

### 6. サンプルデータのインポート

サンプルデータをコンテナにインポートします。以下は、サンプルデータの JSON ファイルを使用してデータをインポートする例です。

```bash
az cosmosdb sql container import --account-name <アカウント名> --resource-group <リソースグループ名> --database-name <データベース名> --name <コンテナ名> --file <サンプルデータファイルパス>
```

## まとめ

以上の手順で、Azure Cosmos DB NoSQL API 用にサンプルデータをインポートすることができます。各手順を順番に実行し、データのインポートを完了してください。
