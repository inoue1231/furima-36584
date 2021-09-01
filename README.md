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
- has_many : items

## items テーブル

| Column              | Type       | Options                        |
| ----------          | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| profile             | text       | null: false                    |
| category_id         | integer    | null: false                    |
| status_id           | integer    | null: false                    |
| shipping area_id    | integer    | null: false                    |
| shippingcharges_id  | integer    | null: false                    |
| daystoship_id       | integer    | null: false                    |
| price_id            | integer    | null: false                    |


### Association

- has_one: user
- has_one:purchase


## addresses テーブル

| Column           | Type       | Options                        |
| ------------     | ---------- | ------------------------------ |
| municipalities   | string     | null: false                    |
| address          | string     | null: false                    |
| building name    | string     |                                |
| postal code      | string     | null: false                    |
| telephone number | string     | null: false                    |
| purchase         | references | null: false, foreign_key: true |

### Association

- has_many :purchase



## purchases テーブル

| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |


### Association

- has_many :addresses
- belongs_to :user
