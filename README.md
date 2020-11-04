# テーブル設計

## users

| Column               | Type       | Options                        |
|:---------------------|:-----------|:-------------------------------|
| nickname             | string     | null: false                    |
| email                | string     | null: false                    |
| encrypted_password   | string     | null: false                    |
| family_name          | string     | null: false                    |
| first_name           | string     | null: false                    |
| furigana_family_name | string     | null: false                    |
| furigana_first_name  | string     | null: false                    |
| birth_year           | integer    | null: false                    |
| birth_month          | integer    | null: false                    |
| birth_day            | integer    | null: false                    |

### Association

- has_many :items
- has_many :comments
- has_many :purcheses

## items

| Column   | Type       | Options                        |
|:---------|:-----------|:-------------------------------|
| title    | string     | null: false                    |
| explain  | text       | null: false                    |
| category | integer    | null: false                    |
| status   | integer    | null: false                    |
| carriage | integer    | null: false                    |
| area     | integer    | null: false                    |
| send     | integer    | null: false                    |
| price    | integer    | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :purches

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
| postal        | string     | null: false                    |
| prefectures   | integer    | null: false                    |
| municipality  | string     | null: false                    |
| street        | string     | null: false                    |
| building      | string     |                                |
| phone         | string     | null: false                    |

### Association

- belongs_to :purches

## prucheses

| Column   | Type       | Options                        |
|:---------|:-----------|:-------------------------------|
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :adress
