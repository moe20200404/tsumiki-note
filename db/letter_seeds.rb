letters = []

3.times do |genre_id|
  genre_id += 2
  3.times do |i|
    i +=1
    letters << Letter.new(
      title: "#{i}月の#{Genre.find(genre_id).name}",
      genre_id: genre_id,
      user_id: 1
    )
  end 
end

Letter.import letters