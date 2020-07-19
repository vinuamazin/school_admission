require 'rails_helper'

RSpec.describe Classroom, type: :model do
  context '#create' do
    it 'should create new classroom' do
      create(:classroom)
      expect(Classroom.count).to eq(1)
    end
    it 'should create classroom with valid attributes' do
      classroom = build(:classroom)
      classroom.save
      expect(classroom).to be_valid
    end
  end

  context '#validation' do
    it 'is not valid if medium is empty' do
      classroom = build(:classroom, medium: '')
      classroom.save
      expect(classroom).to_not be_valid
    end

    it 'is not valid if division is empty' do
      classroom = build(:classroom, division: '')
      classroom.save
      expect(classroom).to_not be_valid
    end

    it 'is not valid if intake is empty' do
      classroom = build(:classroom, intake: '')
      classroom.save
      expect(classroom).to_not be_valid
    end

    it 'should give error message if medium is empty' do
      classroom = build(:classroom, medium: '')
      classroom.save
      expect(classroom.errors.messages[:medium].first).to eq("can't be blank")
    end

    it 'should give error message if division is empty' do
      classroom = build(:classroom, division: '')
      classroom.save
      expect(classroom.errors.messages[:division].first).to eq("can't be blank")
    end

    it 'should give error message if intake is empty' do
      classroom = build(:classroom, intake: '')
      classroom.save
      expect(classroom.errors.messages[:intake].first).to eq("can't be blank")
    end

    it 'should give error message if intake is not a number' do
      classroom = build(:classroom, intake: 'invalid')
      classroom.save
      expect(classroom.errors.messages[:intake].first).to eq("is not a number")
    end
  end

  context '#ActiveRecord associations' do
    it 'should belongs_to teacher' do
      expect(Classroom.reflect_on_association(:teacher).macro).to be(:belongs_to)
    end

    it 'should belongs_to standard' do
      expect(Classroom.reflect_on_association(:standard).macro).to be(:belongs_to)
    end
  end
end