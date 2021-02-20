# テーブル設計

## users テーブル
| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth_day       | date   | null: false |

### Association
- has_many :items
- has_many :orders

<br>

## items テーブル
| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| name          | string     | null: false       |
| text          | text       | null: false       |
| category      | integer    | null: false       |
| condition     | integer    | null: false       |
| shipping_cost | integer    | null: false       |
| shipping_area | integer    | null: false       |
| shipping_days | integer    | null: false       |
| price         | integer    | null: false       |
| image         |            |                   |
| user          | references | foreign_key: true |

### Association
- belongs_to :user
- has_one :order

<br>

## orders テーブル
| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal_code   | string     | null: false       |
| prefecture    | integer    | null: false       |
| city          | string     | null: false       |
| address_line1 | string     | null: false       |
| address_line2 | string     | null: false       |
| phone_number  | integer    | null: false       |
| user          | references | foreign_key: true |
| item          | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
