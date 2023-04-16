# テーブル設計

## users テーブル

| Column             | Type   | Options      　　　  |
| ------------------ | ------ | ----------- 　　　   |
| emaile             | string | NOT NULL,UNIQUE()   |
| encrypted_password | string | NOT NULL            |
| nickname           | string | NOT NULL            |
| first_name         | string | NOT NULL            |
| family_name        | string | NOT NULL            |
| date_of_birth      | string | NOT NULL            |


### Association

- has_many :goods


## goods テーブル

| Column      | Type       | Options          |
| ----------  | ---------- | ---------------- |
| title       | string     | NOT NULL         |
| goods_detail| text       | NOT NULL         |
| category    | string     | NOT NULL         |
| user        | references | NOT NULL,外部キー |
| quality     | string     | NOT NULL         |
| postage     | string     | NOT NULL         |
| region      | String     | NOT NULL         |
| date        | string     | NOT NULL         |
| image       | references | NOT NULL,外部キー |


### Association

- belongs_to :users
- belongs_to :purchases
- belongs_to :address

## purchases テーブル

| Column    | Type        | Options          |
| --------- | ----------- | ---------------- |
| number    | string      | NOT NULL         |
| due_date  | string      | NOT NULL         |
| security  | string      | NOT NULL         |

### Association

- belongs_to :users

## address テーブル

| Column             | Type   | Options      　　　  |
| ------------------ | ------ | ----------- 　　　   |
| post_code          | string | NOT NULL            |
| prefectures        | string | NOT NULL            |
| municipality       | string | NOT NULL            |
| house_number       | string | NOT NULL            |
| building           | string |                     |
| telephone_number   | string | NOT NULL            |

### Association

- belongs_to :users
- has_many :purchases
- 
