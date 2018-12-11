require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
  let(:user) do
    User.create!(
      first_name: 'Test1',
      last_name: 'User1',
      email: 'test@gmail.ca',
      password: 'test1234',
      password_confirmation: 'test1234'
    )
  end

  let(:user2) do
    User.create!(
      first_name: 'Test2',
      last_name: 'User2',
      email: 'TEST@gmail.ca',
      password: 'test456',
      password_confirmation: 'test456'
    )
  end

    it 'is not valid without a first name' do
      user.first_name = nil
      expect { user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is not valid without a last name' do
      user.last_name = nil
      expect { user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is not valid without a password' do
      user.password = nil
      expect { user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'is not valid without an email' do
      user.email = nil
      expect { user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
    
    it 'is not valid without unique email' do
      user.save!
      user2.email = user.email
      expect { user2.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe '.authenticate_with_credentials' do
    let(:user) do
      User.create!(
        first_name: 'Bob',
        last_name: 'Barker',
        email: 'bob@gmail.ca',
        password: 'bob1234',
        password_confirmation: 'bob1234'
      )
    end
    it 'is valid with valid credentials' do
      user.save
      expect(User.authenticate_with_credentials('bob@gmail.ca', 'bob1234')).to be_truthy 
    end

    it 'is valid with spaces in front of email' do
      user.save
      expect(User.authenticate_with_credentials('    bob@gmail.ca', 'bob1234')).to be_truthy 
    end

    it 'is valid with different case letter in email' do
      user.save
      expect(User.authenticate_with_credentials('bOb@Gmail.cA', 'bob1234')).to be_truthy 
    end
  end
end

