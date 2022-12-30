## users table

| Column               | Type   | Options                   |
|----------------------|--------|---------------------------|
| nickname             | string | null: false               |
| email                | string | null: false, unique: true |
| password             | string | null: false               |
| birthday             | date   | null: false               |
| family_name          | string | null: false               |
| first_name           | string | null: false               |
| family_name_furigana | string | null: false               |
| first_name_furigana  | string | null: false               |

### Association

* has_many :items
* has_many :buys

## items table

| Column             | Type       | Options                           |
|--------------------|------------|-----------------------------------|
| item_name          | string     | null: false                       |
| category           | string     | null: false                       |
| price              | text       | null: false                       |
| user               | references | null: false, foreign_key: true    |
| item_ explanation  | string     | null: false                       |
| item_ status       | string     | null: false                       |
| send_area          | string     | null: false                       |
| send_charge        | string     | null: false                       |

 ### Association

* has_one :buy


## buys table

| Column    | Type       | Options                           |
|-----------|------------|-----------------------------------|
| user      | references | null: false, foreign_key: true    |
| item      | string     | null: false, foreign_key: true    |

belongs_to :buy

- belongs_to :item
- has_one : send


## address table

| Column         | Type    | Options     |
|----------------|---------|-------------|
| poster_code    | string  | null: false |
| buy_id         | integer | null: false |
| municipalities | string  | null: false |
| house_number   | string  | null: false |
| building_name  | string  |             |
| phone_number   | string  | null: false |

### Association

- belongs_to :buy

