## users table

| Column   | Type   | Options                   |
|----------|--------|---------------------------|
| nickname | string | null: false               |
| email    | string | null: false, unique: true |
| password | string | null: false               |
| birthday | text   | null: false               |

### Association


## items table

| Column    | Type       | Options                           |
|-----------|------------|-----------------------------------|
| item name | string     | null: false                       |
| category  | string     | null: false                       |
| price     | text       | null: false                       |
| user      | references | null: false, foreign_key: true|

 ### Association

* has_one :buy


## buys table

| Column    | Type   | Options                           |
|-----------|--------|-----------------------------------|
| user      | references | null: false, foreign_key: true|
| item      | string | null: false                       |

belongs_to :buy

- belongs_to :item
- has_one : send


## sends table

| Column         | Type   | Options     |
|----------------|--------|-------------|
| address        | text   | null: false |
| poster code    | text   | null: false |
| prefectures    | string | null: false |
| municipalities | string | null: false |
| house number   | string | null: false |
| building name  | string | null: false |
| phone number   | string | null: false |

### Association

- belongs_to :buy
