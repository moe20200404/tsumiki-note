3.times do |genre_id|
  genre_id += 2
  3.times do |i|
    i +=1
    letter = Letter.new(
      title: "#{i}月の#{Genre.find(genre_id).name}",
      genre_id: genre_id,
      user_id: 1
    )

    letter.pdf_file.attach(
      io: File.open('public/ex_letter.pdf'),
      filename: 'file.pdf',
      content_type: 'application/pdf',
    )

    letter.pdf_file.attach(
      io: File.open('public/ex_letter.pdf'), 
      filename: 'file.pdf'
    )
    letter.save
    if i == 1
      binding.pry
    end
  end 
end
