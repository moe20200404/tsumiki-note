# 保育士レコードの生成
users = []

3.times do |i|
  users << User.new(
    email: "test#{i + 1}@test.com",
    password: '000000y',
    name: "大江　保育士#{i + 1}",
    authority_id: 3,
    # permission: true,
    postal_code: '1234567',
    pref: '山口県',
    city: '山口市',
    town: '小郡1234',
    phone_number: '1234567890'
  )
end

User.import users

# 保護者レコードの生成
users = []

30.times do |i|
  users << User.new(
    email: "test#{i + 4}@test.com",
    password: '000000y',
    name: "大江　保護者#{i + 4}",
    authority_id: 2,
    # permission: true,
    postal_code: '1234567',
    pref: '山口県',
    city: '山口市',
    town: '小郡1234',
    phone_number: '1234567890'
  )
end

User.import users

# クラスレコードの生成
grades = [
  {age: 0, name: "もも"},
  {age: 1, name: "いちご"}, 
  {age: 2, name: "さくらんぼ"},
  {age: 3, name: "ぶどう"}
]

Grade.import grades


# # 園児レコードの生成
# kids = []
# r = Random.new

# # 0歳児クラス
# 10.times do |i|
#   kids << Kid.new(
#     name: "大江　園児#{i+1}",
#     gender_id: "#{rand(1..2)}",
#     start_month: "202204",
#     end_month: nil,
#     grade_id: 1,
#     birth_date: "#{Date.jd(rand(2459307..2459671))}",
#     user_id: "#{i+4}"
#   )
# end

# # 1歳児クラス
# 10.times do |i|
#   kids << Kid.new(
#     name: "大江　園児#{i+11}",
#     gender_id: "#{rand(1..2)}",
#     start_month: "202104",
#     end_month: nil,
#     grade_id: 2,
#     birth_date: "#{Date.jd(rand(2458942..2459306))}",
#     user_id: "#{i+14}"
#   )
# end

# # 2歳児クラス
# 5.times do |i|
#   kids << Kid.new(
#     name: "大江　園児#{i+21}",
#     gender_id: "#{rand(1..2)}",
#     start_month: "202004",
#     end_month: nil,
#     grade_id: 3,
#     birth_date: "#{Date.jd(rand(2458576..2458941))}",
#     user_id: "#{i+24}"
#   )
# end

# # 3歳児クラス
# 5.times do |i|
#   kids << Kid.new(
#     name: "大江　園児#{i+26}",
#     gender_id: "#{rand(1..2)}",
#     start_month: "202004",
#     end_month: nil,
#     grade_id: 4,
#     birth_date: "#{Date.jd(rand(2458211..2458575))}",
#     user_id: "#{i+29}"
#   )
# end


# Kid.import kids
