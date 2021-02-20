# テーブル設計

## users テーブル
| Column          | Type   | Options                   |
| --------------- | ------ | ------------------------- |
| nickname        | string | null: false, unique: true |
| email           | string | null: false, unique: true |
| password        | string | null: false               |
| last_name       | string | null: false               |
| first_name      | string | null: false               |
| last_name_kana  | string | null: false               |
| first_name_kana | string | null: false               |
| birth_day       | date   | null: false               |

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

## Orders テーブル
| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association
- has_one :shipping
- belongs_to :user
- belongs_to :item

<br>

## Shippings テーブル
| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal_code   | string     | null: false       |
| prefecture    | integer    | null: false       |
| city          | string     | null: false       |
| address_line1 | string     | null: false       |
| address_line2 | string     | null: false       |
| phone_number  | integer    | null: false       |
| order         | references | foreign_key: true |

### Association
- belongs_to :order
