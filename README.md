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
| first_name_yomi    | string | NOT NULL            |
| family_name_yomi   | string | NOT NULL            |

### Association

- has_many :goodss


## goodss テーブル

| Column      | Type       | Options          |
| ----------  | ---------- | ---------------- |
| title       | string     | NOT NULL         |
| goods_detail| text       | NOT NULL         |
| category    | string     | NOT NULL         |
| user        | references | NOT NULL,外部キー |
| quality_id  | integer    | NOT NULL         |
| postage_id  | integer    | NOT NULL         |
| prefectures | string     | NOT NULL         |
| date        | date       | NOT NULL         |
| price       | string     | NOY NULL         |


### Association

- belongs_to :user
- belongs_to :purchase


## purchases テーブル

| Column    | Type        | Options          |
| --------- | ----------- | ---------------- |
| user_id   | integer     | NOT NULL         |
| goods_id  | integer     | NOT NULL         |

### Association

- belongs_to :user
- belongs_to :goods

## address テーブル

| Column             | Type   | Options      　　　  |
| ------------------ | ------ | ----------- 　　　   |
| post_code          | string | NOT NULL            |
| prefectures_id     | integer| NOT NULL            |
| municipality       | string | NOT NULL            |
| house_number       | string | NOT NULL            |
| building           | string |                     |
| telephone_number   | string | NOT NULL            |
| user_id            | integer| NOT NULL,外部キー    |

### Association

- belongs_to :user
- has_many :purchases
- 
