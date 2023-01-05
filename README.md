## users table

| Column               | Type   | Options                   |
|----------------------|--------|---------------------------|
| nickname             | string | null: false               |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false               |
| birthday             | date   | null: false               |
| family_name          | string | null: false               |
| first_name           | string | null: false               |
| family_name_furigana | string | null: false               |
| first_name_furigana  | string | null: false               |

### Association

* has_many :items
* has_many :buys

## items table

| Column              | Type       | Options                           |
|---------------------|------------|-----------------------------------|
| item_name           | string     | null: false                       |
| item_explanation    | text       | null: false                       |
| category_id         | integer    | null: false                       |
| price               | integer    | null: false                       |
| user                | references | null: false, foreign_key: true    |
| item_status_id      | integer    | null: false                       |
| item_detail_id      | integer    | null: false                       |
| send_area_id        | integer    | null: false                       |
| send_charge_id      | integer    | null: false                       |

### Association

* has_one :buy
* belongs_to :user

## buys table

| Column    | Type       | Options                           |
|-----------|------------|-----------------------------------|
| user      | references | null: false, foreign_key: true    |
| item      | references | null: false, foreign_key: true    |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address



## address table

| Column         | Type       | Options                        |
|----------------|------------|--------------------------------|
| poster_code    | string     | null: false                    |
| send_area_id   | integer    | null: false                    |
| municipalities | string     | null: false                    |
| house_number   | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| buy            | references | null: false, foreign_key: true |

### Association
- belongs_to :buy

