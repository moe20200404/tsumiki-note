# # 保育士レコードの生成
# users = []

# 3.times do |i|
#   users << User.new(
#     email: "test#{i + 1}@test.com",
#     password: '000000y',
#     name: "dummy#{i + 1}",
#     authority_id: 3,
#     # permission: true,
#     postal_code: '1234567',
#     pref: '山口県',
#     city: '山口市',
#     town: '小郡1234',
#     phone_number: '1234567890'
#   )
# end

# User.import users

# # 保護者レコードの生成
# users = []

# 30.times do |i|
#   users << User.new(
#     email: "test#{i + 4}@test.com",
#     password: '000000y',
#     name: "dummy#{i + 4}",
#     authority_id: 2,
#     # permission: true,
#     postal_code: '1234567',
#     pref: '山口県',
#     city: '山口市',
#     town: '小郡1234',
#     phone_number: '1234567890'
#   )
# end

# User.import users

# 園児レコードの生成
kids = []
r = Random.new

30.times do |i|
  kids << Kid.new(
    name: "kid#{i+1}",
    birth_date: "#{Date.jd(rand(2455928..2459740))}",
    gender_id: "#{rand(1..2)}",
    start_month: "202010",
    end_month: nil,
    grade_id: "#{rand(2..5)}",
    user_id: "#{i+4}"
  )
end
Kid.import kids
# 保護者1人目(name: dummy4)の子供に変更。兄弟の設定。
Kid.find(29).update(user_id: 4)
