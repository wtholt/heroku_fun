task create_blogs: :environment do 
  25.times do
    Blog.create!({
      name: Faker::Company.bs,
      content: Faker::Lorem.paragraph(4),

      }) 
  end
end