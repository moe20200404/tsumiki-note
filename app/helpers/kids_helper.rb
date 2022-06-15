module KidsHelper
  attr_accessor :age, :age_in_month

  # 年齢と月齢を設定する
  def cal_age_in_month(kid)
    reference_date = Date.today

    today_m = reference_date.year * 12 + reference_date.month
    birth_date_m = kid.birth_date.year * 12 + kid.birth_date.month
    month = today_m - birth_date_m

    month -= 1 if reference_date.mday < kid.birth_date.mday

    @age = (month / 12).floor
    @age_in_month = month % 12
  end
end
