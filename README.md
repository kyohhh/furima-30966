# テーブル設計

## usersテーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| family_name      | string  | null: false |
| first_name       | string  | null: false |
| family_name_kana | string  | null: false |
| first_name_kana  | string  | null: false |
| birth_year       | integer | null: false |
| birth_month      | integer | null: false |
| birth_day        | integer | null: false |

### Association

- has_many :items
- has_many :purchases


## itemsテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_name           | string     | null: false                    |
| description         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| state_id            | integer    | null: false                    |
| shipping_charges_id | integer    | null: false                    |
| shipping_area_id    | integer    | null: false                    |
| days_to_ship_id     | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase


## purchasesテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item_id | integer    | null: false                    |

### Association

- belongs_to :item
- has_one :destination


## destinationsテーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| post_code     | string  | null: false |
| prefecture    | integer | null: false |
| city          | string  | null: false |
| address       | string  | null: false |
| building_name | string  | null: false |
| phone_number  | integer | null: false |

### Association

- belongs_to :purchase

