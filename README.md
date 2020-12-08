# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :products
- has_many :buy_logs
- has_one  :address

## products テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| title               | string     | null: false                    |
| description         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| product_status_id   | integer    | null: false                    |
| delivery_fee_id     | integer    | null: false                    |
| ship_from_area_id   | integer    | null: false                    |
| days_to_delivery_id | integer    | null: false                    |
| price               | integer    | null: false                    |
| price_range         | string     | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy_log

## addresses テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| postal_code    | string  | null: false |
| prefecture_id  | integer | null: false |
| municipalities | string  | null: false |
| house_number   | string  | null: false |
| tel_number     | string  | null: false |
| building       | string  |             |

### Association

- belongs_to :user
- belongs_to :buy_log

## buy_logs テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| buy_user_id   | references | null: false, foreign_key: true |
| product_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :address