# テーブル設計

## users テーブル

| Column             | Type   | Options      　　　  |
| ------------------ | ------ | ----------- 　　　   |
| email              | string | null: false, unique: true   |
| encrypted_password | string | null: false            |
| nickname           | string | null: false            |
| first_name         | string | null: false            |
| family_name        | string | null: false            |
| date_of_birth      | date   | null: false            |
| first_name_yomi    | string | null: false            |
| family_name_yomi   | string | null: false            |

### Association

- has_many :items


## items テーブル

| Column      | Type       | Options          |
| ----------  | ---------- | ---------------- |
| title       | string     | null: false         |
| goods_detail| text       | null: false         |
| category_id | interences | null: false         |
| user        | references | null: false, foreign_key: true |
| quality_id  | integer    | null: false         |
| postage_id  | integer    | null: false         |
| prefectures_id| integer  | null: false         |
| price       | integer    | null: false         |


### Association

- belongs_to :user
- belongs_to :purchase


## purchases テーブル

| Column    | Type        | Options          |
| --------- | ----------- | ---------------- |
| user_id   | references  | null: false         |
| items_id  | references  | null: false         |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address

## address テーブル

| Column             | Type   | Options      　　　  |
| ------------------ | ------ | ----------- 　　　   |
| post_code          | string | null: false            |
| prefectures_id     | integer| null: false            |
| municipality       | string | null: false            |
| house_number       | string | null: false            |
| building           | string |                     |
| telephone_number   | string | null: false            |
| user_id            | integer| null: false, foreign_key: true    |

### Association

- has_many :purchases
- belongs_to :user
