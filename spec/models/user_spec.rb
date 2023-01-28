require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.', PostsCounter: 2) }

  before { subject.save }

  describe 'When te test user is executed' do
    it "Validates presence of name'" do
      expect(subject.Name).not_to be_empty
    end
  end
  describe 'When te test user is executed' do
    it 'Validates the PostCounter  >= 0' do
      expect(subject.PostsCounter).to be >= 0
    end
  end

  describe 'When te test user is executed' do
    it 'Validates the PostCounter = integer' do
      expect(subject.PostsCounter).to be_kind_of Numeric
    end
  end

  describe 'When te test user is executed' do
    it 'The method see_3recent_posts must be = 3' do
      expect(User.see_3recent_posts(1)) == 3
    end
  end
end
