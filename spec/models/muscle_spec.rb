require 'rails_helper'

RSpec.describe Muscle, type: :model do
  it 'is valid with valid attributes' do
    expect { create(:muscle) }.to change(Muscle, :count).by(1)
    expect { create(:muscle, name_en: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
