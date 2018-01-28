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

  it 'is valid to add sessions in an exercise' do
    @exercise = create(:exercise)
    @session = create(:session)
    @another_session = create(:session)

    @exercise.sessions << [@session, @another_session]
    expect(@exercise.sessions.count).to be(2)
    expect(@session.exercises.count).to be(1)
    expect(@another_session.exercises.count).to be(1)
    expect(@session.exercises.first).to eql(@exercise)
    expect(@another_session.exercises.first).to eql(@exercise)
    expect(@exercise.sessions.first).to eql(@session)
    expect(@exercise.sessions.last).to eql(@another_session)
    expect(@another_session.exercises.first).to eql(@exercise)
  end

  it 'is not valid to repeat an exercise in a session' do
    @session = create(:session)
    @exercise = create(:exercise)

    @exercise.sessions << @session
    expect { @exercise.sessions << @session }.to raise_error(ActiveRecord::RecordNotUnique)
  end
end
