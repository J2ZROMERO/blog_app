# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
def run
    first_user = User.create(Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.')
    puts first_user.save
    second_user = User.create(Name: 'Lilly', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Poland.')
    puts second_user.save
    first_post = Post.create(author_id: first_user.id, Title: 'Hello', Text: 'This is my first post')
    puts first_post.save
    second_post = Post.create(author_id: second_user.id, Title: 'Cats', Text: 'This is my a post of cats')
    puts second_post.save
    third_post = Post.create(author_id: second_user.id, Title: 'Birds', Text: 'This is my a post of Birds')
    puts third_post.save
    fourth_post = Post.create(author_id: first_user.id, Title: 'Bear', Text: 'This is my a post of Bear')
    puts fourth_post.save
  end
  run