# README

# テーブル設計

## sns_credentials テーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| provider                  | string     | null: false                    |
| uid                       | string     | null: false                    |
| user                      | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## users テーブル

| Column                    | Type   | Options                   |
| ------------------------- | ------ | ------------------------- |
| name                      | string | null: false               |
| email                     | string | null: false, unique: true |
| encrypted_password        | string | null: false               |

### Association
- has_many :reviews
- has_many :hotels
- has_many :sns_credentials

## hotelsテーブル

| Column      | Type   | Options     |
| ----------- | ------ | ------------|
| name        | string | null: false |
| category_id | int    | null: false |


### Association
- belongs_to :user
- has_many :reviews
- has_many :hotel_tags

## reviewsテーブル

| Column        | Type       | Options  
| ------------- | ---------- | ------------------------------ |
| comment       | text       |                                |
| user          | references | null: false, foreign_key: true |
| hotel         | references | null: false, foreign_key: true |
| total_score   | int        | null: false                    |


### Association
- belongs_to :user
- belongs_to :hotel


