require 'rails_helper'

RSpec.describe ExercisesMuscle, type: :model do
  before(:each) do
    @exercise = create(:exercise)
    @muscle = create(:muscle)
  end

  it 'is valid when adding a muscle to an existing exercise' do
    expect { ExercisesMuscle.create!(exercise: @exercise, muscle: @muscle, intensity: 80) }.to change(ExercisesMuscle, :count).by(1)
    expect(@exercise.muscles.count).to be(1)
    expect(@exercise.exercises_muscles.count).to be(1)
    expect(@muscle.exercises.count).to be(1)
    expect(@muscle.exercises_muscles.count).to be(1)
    expect(@exercise.muscles.first).to eql(@muscle)
    expect(@exercise.exercises_muscles.first).to eql(ExercisesMuscle.first)
    expect(@muscle.exercises.first).to eql(@exercise)
    expect(@muscle.exercises_muscles.first).to eql(ExercisesMuscle.first)
  end

  it 'is invalid when some attribute is missing' do
    expect { ExercisesMuscle.create!(exercise: @exercise, muscle: nil, intensity: 80) }.to raise_error(ActiveRecord::RecordInvalid)
    expect { ExercisesMuscle.create!(exercise: nil, muscle: @muscle, intensity: 80) }.to raise_error(ActiveRecord::RecordInvalid)
    expect { ExercisesMuscle.create!(exercise: @exercise, muscle: @muscle, intensity: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'is invalid when the pair exercise-muscle is repeated' do
    expect { ExercisesMuscle.create!(exercise: @exercise, muscle: @muscle, intensity: 80) }.to change(ExercisesMuscle, :count).by(1)
    expect { ExercisesMuscle.create!(exercise: @exercise, muscle: @muscle, intensity: 75) }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
