require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    expect { create(:user) }.to change(User, :count).by(1)
  end

  it 'is invalid with nil attributes' do
    expect { create(:user, email: nil) }.to raise_error(ActiveRecord::RecordInvalid)
    expect { create(:user, password: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'returns the correct full name' do
    @user = create(:user, first_name: 'John', last_name: 'Doe')
    @user_no_first_nor_last_name = create(:user, first_name: nil, last_name: nil, email: 'john.doe@one.com')
    @user_no_first_name = create(:user, first_name: nil, last_name: 'Doe', email: 'john.doe@two.com')
    @user_no_last_name = create(:user, first_name: 'John', last_name: nil, email: 'john.doe@three.com')
    expect(@user.full_name).to eql("#{@user.first_name} #{@user.last_name}")
    expect(@user_no_first_nor_last_name.full_name).to eql(@user_no_first_nor_last_name.email)
    expect(@user_no_first_name.full_name).to eql(@user_no_first_name.last_name)
    expect(@user_no_last_name.full_name).to eql(@user_no_last_name.first_name)
  end
end
