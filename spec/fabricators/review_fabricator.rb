Fabricator(:review) do
  rating { (1..5).to_a.sample }
  content { Faker::Lorem.paragraph(3 ) }
  created_at { Faker::Date.backward(20) }
end