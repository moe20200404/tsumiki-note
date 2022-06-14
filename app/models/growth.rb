class Growth < ApplicationRecord
  belongs_to :kid

  with_options presence: true do
    validates :month
    validates :inspection_date
    validates :weight
    validates :height
    validates :kid_id
  end

  validates :weight, numericality: { greater_than: 2, message: '体重は2kgより大きい値を登録してください', allow_nil: true }
  validates :weight, numericality: { less_than: 30, message: '体重は30kgより小さい値を登録してください', allow_nil: true }

  validates :height, numericality: { greater_than: 40, message: '身長は40cmより大きい値を登録してください', allow_nil: true }
  validates :height, numericality: { less_than: 200, message: '身長は200cmより小さい値を登録してください', allow_nil: true }

  def self.import(file)
    column_names = [:kid_id, :kid_name, :kid_birth_date, :month, :inspection_date, :height, :weight]
    slice_column = [:kid_id, :month, :inspection_date, :height, :weight]

    CSV.foreach(file.path, headers: column_names) do |row|
      growth = Growth.new(row.to_hash.slice(*slice_column))
      if growth.valid?
        puts growth.valid?
        growth.save
      end
    end
  end
end
