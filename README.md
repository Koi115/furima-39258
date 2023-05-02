# テーブル設計

# users テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false, unique: true |
| email              | string | null: false               |
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
| item_name      | string     | null: false                    |
| description    | text       | null: false                    |
| category       | string     | null: false                    |
| status         | string     | null: false                    |
| shipping_fee   | string     | null: false                    |
| prefecture     | string     | null: false                    |
| preparing_days | string     | null: false                    |
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
| postal_code   | integer    | null: false                    |
| pref          | string     | null: false                    |
| city          | string     | null: false                    |
| street        | string     | null: false                    |
| building      | string     |                                |
| phone_number  | integer    | null: false, unique: true      |

# Association
- belongs_to :order
- belongs_to :prefecture
