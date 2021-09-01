# デーアタベース設計

## users テーブル

| Column               | Type   | Options     |
| ------------------   | ------ | ----------- |
| email                | string | null: false |
| encyrpted_password   | string | null: false |
| name                 | string | null: false |
| name_kanji           | text   | null: false |
| name_kana            | text   | null: false |
| birthday             | text   | null: false |

### Association

- has_many : items
- has_many : purchase

## items テーブル

| Column      | Type       | Options                        |
| ----------  | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| profile     | text       | null: false                    |
| category    | text       | null: false                    |
| status      | text       | null: false                    |


### Association

- belongs_to :user
- has_many :purchase

## purchase テーブル

| Column        | Type       | Options                        |
| ------------  | ---------- | ------------------------------ |
| Shipping area | text       | null: false                    |
| bear          | text       | null: false                    |
| days          | text       | null: false                    |
| price         | text       | null: false                    |
| number        | text       | null: false                    |
| Deadline      | text       | null: false                    |
| security code | text       | null: false                    |
| Prefecture    | text       | null: false                    |
| Deadline      | text       | null: false                    |
| municipalities| text       | null: false                    |
| address       | text       | null: false                    |
| Building name | text       | null: false                    |


### Association

- belongs_to :prototype
- belongs_to :user
