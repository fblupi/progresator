require 'rails_helper'

RSpec.describe Muscle, type: :model do
  it 'is valid with valid attributes' do
    expect { create(:muscle) }.to change(Muscle, :count).by(1)
    expect { create(:muscle, name_en: 'Pectoralis major', name_es: 'Pectoral mayor') }.to change(Muscle, :count).by(1)
  end

  it 'is invalid with nil name attributes' do
    expect { create(:muscle, name_en: nil) }.to raise_error(ActiveRecord::RecordInvalid)
    expect { create(:muscle, name_es: nil) }.to raise_error(ActiveRecord::RecordInvalid)
    expect { create(:muscle, name_en: nil, name_es: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
