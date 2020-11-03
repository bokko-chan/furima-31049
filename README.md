# テーブル設計

## users

| Column   | Type   | Options     |
|:---------|:-------|:------------|
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association
- has_one :profile
- has_one :adress
- has_one :purches
- has_many :items
- has_many :comments

## profiles

| Column               | Type       | Options                        |
|:---------------------|:-----------|:-------------------------------|
| family_name          | string     | null: false                    |
| first_name           | string     | null: false                    |
| furigana_family_name | string     | null: false                    |
| furigana_first_name  | string     | null: false                    |
| birth_year           | integer    | null: false                    |
| birth_month          | integer    | null: false                    |
| birth_day            | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## items

| Column   | Type       | Options                        |
|:---------|:-----------|:-------------------------------|
| image    |            | null: false                    |
| title    | string     | null: false                    |
| explain  | text       | null: false                    |
| category | string     | null: false                    |
| status   | string     | null: false                    |
| carriage | string     | null: false                    |
| area     | string     | null: false                    |
| send     | string     | null: false                    |
| price    | integer    | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :adress
- has_many :comments

## comments

| Column | Type       | Options                        |
|:-------|:-----------|:-------------------------------|
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## adresses

| Column        | Type       | Options                        |
|:--------------|:-----------|:-------------------------------|
| postal        | integer    | null: false                    |
| prefectures   | string     | null: false                    |
| municipality  | string     | null: false                    |
| street        | string     | null: false                    |
| building      | string     | null: false                    |
| phone         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :purches

## prucheses

| Column   | Type       | Options                        |
|:---------|:-----------|:-------------------------------|
| number   | integer    | null: false                    |
| month    | integer    | null: false                    |
| year     | integer    | null: false                    |
| security | integer    | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :adress
