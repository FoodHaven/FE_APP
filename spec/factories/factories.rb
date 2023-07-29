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
end