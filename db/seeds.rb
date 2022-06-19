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

