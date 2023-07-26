require 'rails_helper'

RSpec.describe User do
  it "exists and has attributes" do
    data = { name: "BilBo", 
            email: "BilboBobs@email.email",
            city: "Hobbiton", 
            state: "Shire", 
            zip: 45678, 
            password: "goldrings" 
          } 

    user = User.new(data)
    expect(user).to be_a(User)
    expect(user.name).to eq(data[:name])
    expect(user.email).to eq(data[:email])
    expect(user.city).to eq(data[:city])
    expect(user.state).to eq(data[:state])
    expect(user.zip).to eq(data[:zip])
    expect(user.password).to eq(data[:password])
  end
end