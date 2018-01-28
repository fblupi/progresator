require 'rails_helper'

RSpec.describe Session, type: :model do
  it 'is valid with valid attributes' do
    expect { create(:session) }.to change(Session, :count).by(1)
  end

  it 'is valid to add exercises in a session' do
    @session = create(:session)
    @exercise = create(:exercise)
    @another_exercise = create(:exercise)

    @session.exercises << [@exercise, @another_exercise]
    expect(@session.exercises.count).to be(2)
    expect(@exercise.sessions.count).to be(1)
    expect(@another_exercise.sessions.count).to be(1)
    expect(@session.exercises.first).to eql(@exercise)
    expect(@session.exercises.last).to eql(@another_exercise)
    expect(@exercise.sessions.first).to eql(@session)
    expect(@another_exercise.sessions.first).to eql(@session)
  end

  it 'is not valid to repeat an exercise in a session' do
    @session = create(:session)
    @exercise = create(:exercise)

    @session.exercises << @exercise
    expect { @session.exercises << @exercise }.to raise_error(ActiveRecord::RecordNotUnique)
  end
end
