# アプリケーション名	
## Tsumiki-note

# アプリケーション概要
保育士と保護者をつなぎ、子供の成長を共に喜び合える。

# URL
https://tsumiki-note.herokuapp.com/

# テスト用アカウント
## Basic認証
ID: TsumikiUser<br>
Password: 0404

## ログイン
### 保育士アカウント
E-mail: test1@test.com
Password: 000000y

### 保護者アカウント
E-mail: test4@test.com
Password: 000000y

# 利用方法
## おたより投稿
1. 保育士アカウントでログインし、保育園メニューのおたより登録に遷移する。
2. pdfファイル形式のおたよりを投稿する。
3. 投稿したおたよりは、保護者アカウントでも閲覧可能。また、保育士権限を持つアカウントで編集・削除が可能。

## 
アプリケーションを作成した背景	このアプリケーションを通じて、どのような人の、どのような課題を解決しようとしているのかを記載。
洗い出した要件	要件定義をまとめたスプレッドシートのリンクを記載。
実装した機能についての画像やGIFおよびその説明※	実装した機能について、それぞれどのような特徴があるのかを列挙する形で記載。画像はGyazoで、GIFはGyazoGIFで撮影すること。
実装予定の機能	洗い出した要件の中から、今後実装予定の機能がある場合は、その機能を記載。
データベース設計	ER図を添付。
画面遷移図	画面遷移図を添付。
開発環境	使用した言語・サービスを記載。
ローカルでの動作方法※	git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記載。
工夫したポイント※	制作背景・使用技術・開発方法・タスク管理など、企業へＰＲしたい事柄を記載。



#　テーブル設計
## users

| Column              | Type      | Options                        |
|---------------------|-----------|--------------------------------|
| email               | string    | null: false, unique: true      |
| encrypted_password  | string    | null: false                    |
| name                | string    | null: false                    |
| authority_id        | integer   | null: false                    |
| permission          | boolean   | null: false                    |
| postal_code         | string    | null: false                    |
| pref                | string    | null: false                    |
| city                | string    | null: false                    |
| town                | string    | null: false                    |
| building            | string    |                                |
| phone_number        | string    | null: false                    |

### Association
has_many :letters
has_many :childcare_fees
has_many :kids

## grade

| Column              | Type      | Options                        |
|---------------------|-----------|--------------------------------|
| age                 | integer   | null: false                    |
| name                | string    | null: false, unique: true      |

### Association
has_many :kids

## kid

| Column              | Type      | Options                        |
|---------------------|-----------|--------------------------------|
| name                | string    | null: false                    |
| birth_date          | date      | null: false                    |
| gender_id           | integer   | null: false                    |
| start_month         | string    | null: false                    |
| end_month           | string    |                                |
| grade_id            | references| null: false                    |
| user_id             | references|                                |

### Association
belongs_to :grade
belongs_to :user
has_many :growths

## growths

| Column              | Type      | Options                        |
|---------------------|-----------|--------------------------------|
| month               | string    | null: false                    |
| inspection_date     | date      | null: false                    |
| weight              | float	    | null: false                    |
| height              | float	    | null: false                    |
| kid_id              | references| null: false                    |

### Association
belongs_to :kid

## letters

| Column              | Type      | Options                        |
|---------------------|-----------|--------------------------------|
| title               | string    | null: false                    |
| genre_id            | integer   | null: false                    |
| user_id             | references| null: false                    |

### Association
belongs_to :user

## childcare_fees

| Column              | Type      | Options                        |
|---------------------|-----------|--------------------------------|
| year_months         | string    | null: false                    |
| fee                 | integer   | null: false                    |
| user_id             | references| null: false                    |

### Association
belongs_to :user
