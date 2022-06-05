#　テーブル設計
## users

| Column              | Type      | Options                        |
|---------------------|-----------|--------------------------------|
| email               | string    | null: false, unique: true      |
| encrypted_password  | string    | null: false                    |
| name                | string    | null: false                    |
| authority_id        | integer   | null: false                    |
| permission          | boolean   | null: false                    |
| postal_code         | string    | null: false                    |
| pref                | string    | null: false                    |
| city                | string    | null: false                    |
| town                | string    | null: false                    |
| building            | string    |                                |
| phone_number        | string    | null: false                    |

### Association
has_many :letters
has_many :childcare_fees
has_many :users_children

## child_classes

| Column              | Type      | Options                        |
|---------------------|-----------|--------------------------------|
| class_age           | integer   | null: false, unique: true      |
| class_name          | string    | null: false, unique: true      |

### Association
has_many :users_children

## users_children

| Column              | Type      | Options                        |
|---------------------|-----------|--------------------------------|
| name                | string    | null: false                    |
| birth_date          | date      | null: false                    |
| gender_id           | integer   | null: false                    |
| start_month         | string    | null: false                    |
| end_month           | string    |                                |
| class_id            | references| null: false                    |
| user_id             | references|                                |

### Association
belongs_to :child_class
belongs_to :user
has_many :growths

## growths

| Column              | Type      | Options                        |
|---------------------|-----------|--------------------------------|
| month               | string    | null: false                    |
| inspection_date     | date      | null: false                    |
| weight              | integer   | null: false                    |
| height              | integer   | null: false                    |
| child_id            | references| null: false                    |

### Association
belongs_to :users_child

## letters

| Column              | Type      | Options                        |
|---------------------|-----------|--------------------------------|
| title               | string    | null: false                    |
| genre_id            | integer   | null: false                    |
| user_id             | references| null: false                    |

### Association
belongs_to :user

## childcare_fees

| Column              | Type      | Options                        |
|---------------------|-----------|--------------------------------|
| year_months         | string    | null: false                    |
| fee                 | integer   | null: false                    |
| user_id             | references| null: false                    |

### Association
belongs_to :user
