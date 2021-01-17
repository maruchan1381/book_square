# README

## users テーブル

| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association
- has_many :books
- has_many :comments


## books テーブル

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| title       | string     | null: false                    |
| image_url   | string     | null: false                    |
| author      | string     | null: false                    |
| user_id     | references | null: false, foreign_key: true |

### Association
- has_many :comments
- belongs_to :user

 ## reviews テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| description | text       | null: false                    |
| date        | date       | null: false                    |
| user_id     | references | null: false, foreign_key: true |
| book_id     | references | null: false, foreign_key: true |

### Association
- belongs_to :book
- belongs_to :user


## comments テーブル

| Column  | Type       | Options                        |
|---------|------------|--------------------------------|
| text    | text       | null: false                    |
| user_id | references | null: false, foreign_key: true |
| book_id | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :book