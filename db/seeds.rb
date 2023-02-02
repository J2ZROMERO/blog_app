# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
def add_data
    first_user = User.create(Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.',PostsCounter: 0)
    second_user = User.create(Name: 'Lilly', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Poland.',PostsCounter: 0)
    
    first_post = Post.create(author_id: first_user.id, Title: 'Hello', Text: 'This is my first post', LikesCounter: 1, CommentsCounter: 0)
    second_post = Post.create(author_id: second_user.id, Title: 'Cats', Text: 'This is my a post of cats', LikesCounter: 9, CommentsCounter: 0)
    third_post = Post.create(author_id: second_user.id, Title: 'Birds', Text: 'This is my a post of Birds', LikesCounter: 3, CommentsCounter: 0)
    four_post = Post.create(author_id: first_user.id, Title: 'Bear', Text: 'This is my a post of Bear', LikesCounter: 8, CommentsCounter: 0)
    five_post = Post.create(author_id: first_user.id, Title: 'Bear', Text: 'This is my a post of Bear', LikesCounter: 5, CommentsCounter: 0)
    six_post = Post.create(author_id: first_user.id, Title: 'Bear', Text: 'This is my a post of Bear', LikesCounter: 10, CommentsCounter: 0)
    seven_post = Post.create(author_id: first_user.id, Title: 'Bear', Text: 'This is my a post of Bear', LikesCounter: 13, CommentsCounter: 0)

    Comment.create(posts_id: first_post.id, author_id: first_user.id, Text: 'Hi Tom!' )
    Comment.create(posts_id: six_post.id, author_id: first_user.id, Text: 'Hi Lilly!' )
    Comment.create(posts_id: seven_post.id, author_id: first_user.id, Text: 'Hi Tom!' )
    Comment.create(posts_id: seven_post.id, author_id: first_user.id, Text: 'Hi Lilly!' )
    Comment.create(posts_id: second_post.id, author_id: second_user.id, Text: 'Hi Tom!' )
    Comment.create(posts_id: second_post.id, author_id: second_user.id, Text: 'Hi Lilly!' )
    Comment.create(posts_id: second_post.id, author_id: second_user.id, Text: 'Hi Lilly!' )
    Comment.create(posts_id: third_post.id, author_id: second_user.id, Text: 'Hi Lilly!' )
  end



  add_data