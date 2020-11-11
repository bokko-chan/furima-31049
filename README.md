# テーブル設計

## users

| Column               | Type       | Options                        |
|:---------------------|:-----------|:-------------------------------|
| nickname             | string     | null: false                    |
| email                | string     | null: false                    |
| encrypted_password   | string     | null: false                    |
| family_name          | string     | null: false                    |
| first_name           | string     | null: false                    |
| family_name_kana     | string     | null: false                    |
| first_name_kana      | string     | null: false                    |
| birthday             | date       | null: false                    |

### Association

- has_many :items
- has_many :comments
- has_many :purchase

## items

| Column      | Type       | Options                        |
|:------------|:-----------|:-------------------------------|
| title       | string     | null: false                    |
| explain     | text       | null: false                    |
| category_id | integer    | null: false                    |
| status_id   | integer    | null: false                    |
| carriage_id | integer    | null: false                    |
| area_id     | integer    | null: false                    |
| shipping_id | integer    | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :purchase

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

| Column         | Type       | Options                        |
|:---------------|:-----------|:-------------------------------|
| postal         | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| municipality   | string     | null: false                    |
| street         | string     | null: false                    |
| building       | string     |                                |
| phone          | string     | null: false                    |

### Association

- belongs_to :purchase

## purchases

| Column   | Type       | Options                        |
|:---------|:-----------|:-------------------------------|
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :adress
