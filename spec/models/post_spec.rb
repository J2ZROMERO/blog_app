require 'rails_helper'

RSpec.describe Post, type: :model do
#   before(:all)do
#   # @first_user = User.create(Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.')
#   # @subject = Post.create(author_id: 1, Title: 'Hello', Text: 'This is my first post', LikesCounter: 10 ,CommentsCounter: 20)

#   #  10.times {Comment.create(posts_id: @subject.id, author_id: @first_user.id, Text: 'Hi Lilly!' ) }
# end

before(:each) do
  @first_user = User.new(id:1,Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.')
  @first_user.save
  @subject = Post.new(id:1,author_id: @first_user.id, Title: 'Hello', Text: 'This is my first post', LikesCounter: 10 ,CommentsCounter: 20)
  @subject.save
  5.times do |i|
    comment = Comment.new(posts_id: @subject.id, author_id: @first_user.id, Text: "Comment #{i}")
    comment.save
  end
end

  describe "When te test Post is executed" do
    it "Validates Title must not be blanck" do
      expect(@subject.Title).not_to be_empty
    end
  end


  describe "When te test Post is executed" do
    it "Validates Title must not exed 250 characters" do
      expect(@subject.Title.length).to be < 250
    end
  end

  describe "When te test Post is executed" do
    it "Validates the CommentsCounter = integer" do
      expect(@subject.CommentsCounter).to be_kind_of Numeric
    end
    end
  
    describe "When te test Post is executed" do
      it "Validates the CommentsCounter  >= 0" do
        expect(@subject.CommentsCounter).to be >= 0 
      end
      end

      
  describe "When te test Post is executed" do
    it "Validates the LikesCounter = integer" do
      expect(@subject.LikesCounter).to be_kind_of Numeric
    end
    end
  
    describe "When te test Post is executed" do
      it "Validates the LikesCounter  >= 0" do
        expect(@subject.LikesCounter).to be >= 0 
      end
      end

  describe "When te test Post is executed" do
    it "Must return 5 recents posts" do
      expect(Post.return5_recent_post(1).count).to eq(5)
    end
end

describe "When te test Post is executed" do
  it "Must Update the Postscounter frmo 0 to 10" do
    Post.update_post_counter(1,10)
    expect(User.find_by(id:1).PostsCounter).to eq(10)
  end
end

end
    
    
