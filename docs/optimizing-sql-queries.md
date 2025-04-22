# Azure SQL Database のクエリ最適化手法

このドキュメントでは、Azure SQL Database のクエリを最適化するための手法について説明します。

## インデックスの作成

インデックスを作成することで、クエリのパフォーマンスを向上させることができます。以下の手法を使用して、適切なインデックスを作成します。

### クラスタードインデックス

クラスタードインデックスは、テーブル内のデータを物理的に並べ替えるインデックスです。主キー列にクラスタードインデックスを作成することで、データの取得速度を向上させることができます。

```sql
-- クラスタードインデックスの作成
CREATE CLUSTERED INDEX IX_Equipment_EquipmentId ON Equipment (equipmentId);
```

### ノンクラスタードインデックス

ノンクラスタードインデックスは、テーブル内のデータを物理的に並べ替えずに、特定の列に対してインデックスを作成します。検索条件に頻繁に使用される列にノンクラスタードインデックスを作成することで、クエリのパフォーマンスを向上させることができます。

```sql
-- ノンクラスタードインデックスの作成
CREATE NONCLUSTERED INDEX IX_Equipment_Name ON Equipment (name);
```

## インデックスのメンテナンス

インデックスのパフォーマンスを維持するために、定期的にインデックスの再構築や再編成を行う必要があります。

### インデックスの再構築

インデックスの再構築は、インデックスを再作成することで、断片化を解消し、パフォーマンスを向上させる手法です。

```sql
-- インデックスの再構築
ALTER INDEX IX_Equipment_EquipmentId ON Equipment REBUILD;
```

### インデックスの再編成

インデックスの再編成は、インデックスのページを再配置することで、断片化を解消し、パフォーマンスを向上させる手法です。

```sql
-- インデックスの再編成
ALTER INDEX IX_Equipment_EquipmentId ON Equipment REORGANIZE;
```

## クエリの最適化

クエリのパフォーマンスを向上させるために、以下の手法を使用してクエリを最適化します。

### 適切なインデックスの使用

クエリで使用される列に対して適切なインデックスを作成し、クエリのパフォーマンスを向上させます。

### クエリの書き換え

クエリを最適化するために、クエリの書き換えを行います。例えば、サブクエリを使用する代わりに、結合を使用することで、クエリのパフォーマンスを向上させることができます。

```sql
-- サブクエリを使用したクエリ
SELECT name FROM Equipment WHERE equipmentId IN (SELECT equipmentId FROM Maintenance WHERE maintenanceDate > '2023-01-01');

-- 結合を使用したクエリ
SELECT e.name FROM Equipment e JOIN Maintenance m ON e.equipmentId = m.equipmentId WHERE m.maintenanceDate > '2023-01-01';
```

### クエリの実行計画の確認

クエリの実行計画を確認し、クエリのパフォーマンスを向上させるための手法を特定します。実行計画を確認することで、インデックスの使用状況やクエリのボトルネックを特定することができます。

```sql
-- 実行計画の確認
SET SHOWPLAN_XML ON;
GO
-- クエリを実行
SELECT name FROM Equipment WHERE equipmentId = 'E001';
GO
SET SHOWPLAN_XML OFF;
```

## まとめ

以上の手法を使用して、Azure SQL Database のクエリを最適化することができます。インデックスの作成やメンテナンス、クエリの書き換え、実行計画の確認を行い、クエリのパフォーマンスを向上させてください。
