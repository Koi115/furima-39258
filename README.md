# テーブル設計

# users テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name_last          | string | null: false               |
| name_first         | string | null: false               |
| name_last_kana     | string | null: false               |
| name_first_kana    | string | null: false               |
| birth_date         | date   | null: false               |

# Association
- has_many :items
- has_many :orders



# items テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| name           | string     | null: false                    |
| description    | text       | null: false                    |
| category_id    | integer    | null: false                    |
| status_id      | integer    | null: false                    |
| fee_id         | integer    | null: false                    |
| prefecture_id  | integer    | null: false                    |
| period_id      | integer    | null: false                    |
| price          | integer    | null: false                    |

# Association
- belongs_to :user
- has_one :order



# orders テーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

# Association
- belongs_to :user
- belongs_to :item
- has_one :address



# addresses テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| order         | references | null: false, foreign_key: true |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |

# Association
- belongs_to :order

