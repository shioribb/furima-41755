# README

## users テーブル

|Column-------------|Type---|Options-------------------|
|-------------------|-------|--------------------------|
|nickname-----------|string-|null: false---------------|
|email--------------|string-|null: false, unique: true-|
|encrypted_password-|string-|null: false---------------|
|first_name---------|string-|null: false---------------|
|last_name----------|string-|null: false---------------|
|first_name_reading-|string-|null: false---------------|
|last_name_reading--|string-|null: false---------------|
|birth_date---------|date---|null: false---------------|

### Association
- has_many :items
- has_one :buyer


## items テーブル

|Column--------|Type-------|Options------------------------|
|--------------|-----------|-------------------------------|
|name----------|string-----|null: false--------------------|
|category------|integer----|null: false--------------------|
|description---|text-------|null: false--------------------|
|detail--------|integer----|null: false--------------------|
|status--------|integer----|null: false--------------------|
|postage-------|integer----|null: false--------------------|
|region--------|integer----|null: false--------------------|
|shopping_date-|integer----|null: false--------------------|
|price---------|integer----|null: false--------------------|
|user----------|references-|null: false, foreign_key: true-|
|buyer---------|references-|null: false, foreign_key: true-|

### Association
- belongs_to :user
- belongs_to :buyers


## buyers テーブル

|Column-|Type-------|Options------------------------|
|-------|-----------|-------------------------------|
|user---|references-|null: false, foreign_key: true-|
|item---|references-|null: false, foreign_key: true-|

### Association
- belongs_to :user
- has_many :items
- has_one :address


## addresses テーブル

|Column-----------|Type-------|Options------------------------|
|-----------------|-----------|-------------------------------|
|postal_code------|integer----|null: false--------------------|
|prefecture-------|integer----|null: false--------------------|
|city-------------|string-----|null: false--------------------|
|house_number-----|integer----|null: false--------------------|
|building_name----|string-----|-------------------------------|
|telephone_number-|integer----|null: false--------------------|
|buyer------------|references-|null: false, foreign_key: true-|

### Association
- belongs_to :buyer
