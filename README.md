# デーアタベース設計

## users テーブル

| Column               | Type   | Options     |
| ------------------   | ------ | ----------- |
| email                | string | unique: true|
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
| shippingarea_id     | integer    | null: false                    |
| shippingcharge_id  | integer    | null: false                    |
| daystoship_id       | integer    | null: false                    |
| price　　　          | int        | null: false                    |
| user                | references | null: false, foreign_key: true |


### Association

- belongs_to: user
- has_one:purchase


## addresses テーブル

| Column           | Type       | Options                        |
| ------------     | ---------- | ------------------------------ |
| shippingarea_id  | integer    | null: false                    |
| municipalities   | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| postal_code      | string     | null: false                    |
| telephone_number | string     | null: false                    |
| purchase         | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase




## purchases テーブル

| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |


### Association

- has_one :address
- has_one :items
- belongs_to :user
