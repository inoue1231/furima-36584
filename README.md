# デーアタベース設計

## users テーブル

| Column               | Type   | Options     |
| ------------------   | ------ | ----------- |
| email                | string | null: false |
| encyrpted_password   | string | null: false |
| myouji               | string | null: false |
| name                 | string | null: false |
| myouji_kana          | string | null: false |
| name_kana            | string | null: false |
| birth_date           | date   | null: false |

### Association

- has_many : purchases
- has_many : addresses 

## items テーブル

| Column              | Type       | Options                        |
| ----------          | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| profile             | text       | null: false                    |
| category            | text       | null: false                    |
| status_id           | integer    | null: false                    |
| shippingcharges_id  | integer    | null: false                    |
| daystoship_id       | integer    | null: false                    |
| price               | text       | null: false                    |


### Association

- has_many : addresses 
- has_one:purchase


## addresses テーブル

| Column           | Type       | Options                        |
| ------------     | ---------- | ------------------------------ |
| shipping area_id | integer    | null: false                    |
| prefecture       | text       | null: false                    |
| municipalities   | text       | null: false                    |
| address          | text       | null: false                    |
| building name    | text       | null: false                    |
| postal code      | text       | null: false                    |
| telephone number | text       | null: false                    |


### Association

- has_many :items
- has_one:user


## purchases テーブル

| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |


### Association

- has_many :items
- belongs_to :user
