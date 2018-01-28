require 'rails_helper'

RSpec.describe Exercise, type: :model do
  it 'is valid with valid attributes' do
    expect { create(:exercise) }.to change(Exercise, :count).by(1)
  end

  it 'is invalid with nil title attributes' do
    expect { create(:exercise, title_es: nil) }.to raise_error(ActiveRecord::RecordInvalid)
    expect { create(:exercise, title_en: nil) }.to raise_error(ActiveRecord::RecordInvalid)
    expect { create(:exercise, title_es: nil, title_en: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
