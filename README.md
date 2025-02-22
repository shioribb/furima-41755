# README

## users テーブル

|Column             |Type   |Options                   |
|-------------------|-------|--------------------------|
|nickname           |string |null: false               |
|email              |string |null: false, unique: true |
|encrypted_password |string |null: false               |
|first_name         |string |null: false               |
|last_name          |string |null: false               |
|first_name_reading |string |null: false               |
|last_name_reading  |string |null: false               |
|birth_date         |date   |null: false               |

### Association
- has_many :items
- has_many :buyers


## items テーブル

|Column           |Type       |Options                        |
|-----------------|-----------|-------------------------------|
|name             |string     |null: false                    |
|category_id      |integer    |null: false                    |
|description      |text       |null: false                    |
|status_id        |integer    |null: false                    |
|postage_id       |integer    |null: false                    |
|prefecture_id    |integer    |null: false                    |
|shopping_date_id |integer    |null: false                    |
|price            |integer    |null: false                    |
|user             |references |null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :buyer


## buyers テーブル

|Column |Type       |Options                        |
|-------|-----------|-------------------------------|
|user   |references |null: false, foreign_key: true |
|item   |references |null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

|Column           |Type       |Options                        |
|-----------------|-----------|-------------------------------|
|postal_code      |string     |null: false                    |
|prefecture_id    |integer    |null: false                    |
|city             |string     |null: false                    |
|house_number     |string     |null: false                    |
|building_name    |string     |                               |
|telephone_number |string     |null: false                    |
|buyer            |references |null: false, foreign_key: true |

### Association
- belongs_to :buyer
