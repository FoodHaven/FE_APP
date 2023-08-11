FactoryBot.define do
  factory :user do
    name { "John Doe" }
    email { "john@example.com" }
    password { "password" }
  end

  factory :market do
    listing_name { "Test Market" }
    location_address { "123 Test St" }
    location_description { "Test Location" }
    location_site { "Test Site" }
    acceptedpayment { "Test Payment" }
    FNAP { "Test FNAP" }
    SNAP_option { "Test SNAP" }
  end

  factory :farmers_market do 
    name { Faker::Name.first_name }
    address { addresses.sample }
    site { Faker::Address.community }
    description { Faker::TvShows::MichaelScott.quote }
    fnap {Faker::Dessert.flavor }
    snap_option { Faker::Food.dish }
    accepted_payment { Faker::Currency.name }
    latitude { -104.7890345 }
    longitude { 40.7698435 }
  end
end