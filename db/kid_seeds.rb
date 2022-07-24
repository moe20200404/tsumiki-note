
# 園児レコードの生成
kids = []
r = Random.new

# 0歳児クラス
10.times do |i|
  kids << Kid.new(
    id: i,
    name: "大江　園児#{i+1}",
    gender_id: "#{rand(2..3)}",
    start_month: "2022年04月",
    end_month: nil,
    grade_id: 0,
    birth_date: "#{Date.jd(rand(2459307..2459671))}",
    user_id: "#{i+4}"
  )
end

# 1歳児クラス
10.times do |i|
  kids << Kid.new(
    id: i+10,
    name: "大江　園児#{i+11}",
    gender_id: "#{rand(2..3)}",
    start_month: "2021年04月",
    end_month: nil,
    grade_id: 1,
    birth_date: "#{Date.jd(rand(2458942..2459306))}",
    user_id: "#{i+14}"
  )
end

# 2歳児クラス
5.times do |i|
  kids << Kid.new(
    id: i+20,
    name: "大江　園児#{i+21}",
    gender_id: "#{rand(2..3)}",
    start_month: "2020年04月",
    end_month: nil,
    grade_id: 2,
    birth_date: "#{Date.jd(rand(2458576..2458941))}",
    user_id: "#{i+24}"
  )
end

# 3歳児クラス
5.times do |i|
  kids << Kid.new(
    id: i+25,
    name: "大江　園児#{i+26}",
    gender_id: "#{rand(2..3)}",
    start_month: "2020年04月",
    end_month: nil,
    grade_id: 3,
    birth_date: "#{Date.jd(rand(2458211..2458575))}",
    user_id: "#{i+29}"
  )
end


Kid.import kids
