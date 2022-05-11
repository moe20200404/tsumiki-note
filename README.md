#　テーブル設計
## nurseries

| Column              | Type      | Options                        |
|---------------------|-----------|--------------------------------|
| nursery_name        | string    | null: false                    |

### Association
has_many :users
has_many :classes
has_many :letters

## users

| Column              | Type      | Options                        |
|---------------------|-----------|--------------------------------|
| email               | string    | null: false                    |
| encrypted_password  | string    | null: false                    |
| name                | string    | null: false                    |
| authority_id        | integer   | null: false                    |
| permission          | boolean   | null: false                    |
| nursery_id          | reference | null: false, foreign_key: true |
| postal_code         | string    | null: false                    |
| prefecture_code_id  | integer   | null: false                    |
| city                | string    | null: false                    |
| street              | string    | null: false                    |
| building            | string    |                                |
| phone_number        | string    | null: false                    |

### Association
belongs_to :nursery
has_many :letters
has_many :childcare_fees
has_many :children

## classes

| Column              | Type      | Options                        |
|---------------------|-----------|--------------------------------|
| class_age           | integer   | null: false                    |
| class_name          | string    | null: false                    |
| nursery_id          | integer   | null: false                    |

### Association
belongs_to :nursery
has_many :children

## children

| Column              | Type      | Options                        |
|---------------------|-----------|--------------------------------|
| name                | string    | null: false                    |
| birth_ date         | date      | null: false                    |
| start_month         | string    | null: false                    |
| end_month           | string    | null: false                    |
| class_id            | reference | null: false                    |
| user_id             | reference | null: false                    |

### Association
belongs_to :class
belongs_to :user
has_many :growths

## growths

| Column              | Type      | Options                        |
|---------------------|-----------|--------------------------------|
| weight              | integer   | null: false                    |
| height              | integer   | null: false                    |
| child_id            | reference | null: false                    |

### Association
belongs_to :child

## letters

| Column              | Type      | Options                        |
|---------------------|-----------|--------------------------------|
| title               | string    | null: false                    |
| genre_id            | integer   | null: false                    |
| nursery_id          | reference | null: false                    |
| user_id             | reference | null: false                    |

### Association
belongs_to :nursery
belongs_to :user

## childcare_fees

| Column              | Type      | Options                        |
|---------------------|-----------|--------------------------------|
| year_months         | string    | null: false                    |
| fee                 | integer   | null: false                    |
| user_id             | reference | null: false                    |

### Association
belongs_to :user
