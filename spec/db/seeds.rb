require 'faker'

10.times do
  Note.create(
    title:   Faker::Lorem.words(4).join(" "),
    content: Faker::Lorem.sentence(3)
    )
end