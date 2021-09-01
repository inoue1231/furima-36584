# デーアタベース設計

## users テーブル

| Column               | Type   | Options     |
| ------------------   | ------ | ----------- |
| email                | string | null: false |
| encyrpted_password   | string | null: false |
| name                 | string | null: false |
| name_kanji           | text   | null: false |
| name_kana            | text   | null: false |
| birth_date           | date   | null: false |

### Association

- has_many : items
- has_many : purchases

## items テーブル

| Column      | Type       | Options                        |
| ----------  | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| profile     | text       | null: false                    |
| category    | text       | null: false                    |
| status_id   | integer    | null: false                    |


### Association

- belongs_to :user
- has_many :purchase


## address テーブル

| Column           | Type       | Options                        |
| ------------     | ---------- | ------------------------------ |
| shipping area_id | integer    | null: false                    |
| prefecture       | text       | null: false                    |
| municipalities   | text       | null: false                    |
| address          | text       | null: false                    |
| building name    | text       | null: false                    |


### Association

- has_many :items
- has_many :purchases


## purchase テーブル

| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| charge_id     | integer    | null: false                    |
| days_id       | integer    | null: false                    |
| price         | text       | null: false                    |
| number        | text       | null: false                    |
| Deadline      | text       | null: false                    |
| security code | text       | null: false                    |

### Association

- has_many :address
- belongs_to :user
