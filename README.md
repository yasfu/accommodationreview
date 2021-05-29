# README

# テーブル設計

## users テーブル

| Column                    | Type   | Options     |
| ------------------------- | ------ | ----------- |
| nickname                  | string | null: false |
| email                     | string | null: false |
| encrypted_password        | string | null: false |

### Association
- has_many :likes
- has_many :reviews
- has_many :hotels

## hotelsテーブル

| Column | Type   | Options     |
| -------| ------ | ------------|
| name   | string | null: false |


### Association
- belongs_to :user
- has_many :reviews
- has_many :tags, through: hotel_tags
- has_many :hotel_tags

## reviewsテーブル

| Column        | Type       | Options  
| ------------- | ---------- | ------------------------------ |
| comment       | text       |                                |
| user          | references | null: false, foreign_key: true |
| hotel         | references | null: false, foreign_key: true |
| total_score   | int        | null: false                    |


### Association
- has_many :likes
- belongs_to :user
- belongs_to :hotel

## likesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| review | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :review

## tagsテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |


### Association
- has_many :hotels, through: hotel_tags
- has_many :hotel_tags


## hotel_tags

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| hotel  | references | null: false, foreign_key: true |
| tag    | references | null: false, foreign_key: true |

### Association
- belongs_to :hotel
- belongs_to :tag
