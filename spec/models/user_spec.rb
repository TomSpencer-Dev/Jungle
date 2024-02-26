require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
     it 'user is saved successfully' do
      user = User.new(first_name: "Carl", last_name: "Simpson", email: 'carl@carl.com', password: 'password', password_confirmation: 'password')
      
      expect(user).to be_valid
    end

     it 'validates presence of first name' do
      user = User.new(first_name: nil, last_name: "Simpson", email: 'carl@carl.com', password: 'password', password_confirmation: 'password')
      
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it 'validates presence of last name' do
      user = User.new(first_name: 'Carl', last_name: nil, email: 'carl@carl.com', password: 'password', password_confirmation: 'password')
      
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'validates presence of email' do
      user = User.new(first_name: 'Carl', last_name: "Simpson", email: nil, password: 'password', password_confirmation: 'password')
      
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'validates presence of password' do
      user = User.new(first_name: 'Carl', last_name: "Simpson", email: 'carl@carl.com', password: nil, password_confirmation: 'password')
      
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it 'validates presence of password_confirmation' do
      user = User.new(first_name: 'Carl', last_name: "Simpson", email: 'carl@carl.com', password: 'password', password_confirmation: nil)
      
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'validates passwords are matching' do
      user = User.new(first_name: 'Carl', last_name: "Simpson", email: 'carl@carl.com', password: 'password', password_confirmation: 'something')

      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

  end
end
