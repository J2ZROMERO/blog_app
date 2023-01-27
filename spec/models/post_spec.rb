require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { User.create(Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.',PostsCounter: 2) }

  before { subject.save }
  describe "When te test Post is executed" do
    it "Validates Title must not be blanck" do
      expect(subject.Name).not_to be_empty
    end
  end


end
