# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
def add_data
    first_user = User.create(Name: 'Tom', Photo: 'https://c.files.bbci.co.uk/48DD/production/_107435681_perro1.jpg', Bio: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae possimus sint facere 
    neque alias repellat asperiores quos eos commodi quibusdam et dolores placeat atque eius, ad excepturi corrupti labore fugiat!.',PostsCounter: 5, email: 'jose@hotmail.com', password: '1234567', confirmed_at: Time.now, role: 'admin')
    second_user = User.create(Name: 'Lilly', Photo: 'https://c.files.bbci.co.uk/48DD/production/_107435681_perro1.jpg', Bio: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae possimus sint facere neque 
    alias repellat asperiores quos eos commodi quibusdam et dolores placeat atque eius, ad excepturi corrupti labore fugiat!.',PostsCounter: 2, email: 'pedro@hotmail.com', password: '1234567', confirmed_at: Time.now)
    third_user = User.create(Name: 'Richard', Photo: 'https://c.files.bbci.co.uk/48DD/production/_107435681_perro1.jpg', Bio: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae possimus sint facere neque alias repellat as
    periores quos eos commodi quibusdam et dolores placeat atque eius, ad excepturi corrupti labore fugiat!.',PostsCounter: 0, email: 'juan@hotmail.com', password: '1234567', confirmed_at: Time.now)
    
    first_post = Post.create(author_id: first_user.id, Title: 'The jungle', Text:  'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae possimus sint facere neque alias 
    repellat asperiores quos eos commodi quibusdam et dolores placeat atque eius, ad excepturi corrupti labore fugiat!', LikesCounter: 1, CommentsCounter: 1)
    second_post = Post.create(author_id: second_user.id, Title: 'The cats', Text: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae possimus sint facere neque 
    alias repellat asperiores quos eos commodi quibusdam et dolores placeat atque eius, ad excepturi corrupti labore fugiat!', LikesCounter: 9, CommentsCounter: 3)
    third_post = Post.create(author_id: second_user.id, Title: 'Animals or pets', Text: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae possimus sint facere neque 
    alias repellat asperiores quos eos commodi quibusdam et dolores placeat atque eius, ad excepturi corrupti labore fugiat!', LikesCounter: 3, CommentsCounter: 1)
    four_post = Post.create(author_id: first_user.id, Title: 'The weater', Text:    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae possimus sint facere neque 
    alias repellat asperiores quos eos commodi quibusdam et dolores placeat atque eius, ad excepturi corrupti labore fugiat!', LikesCounter: 8, CommentsCounter: 0)
    five_post = Post.create(author_id: first_user.id, Title: 'Are you tired?', Text:    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae possimus sint facere neque 
    alias repellat asperiores quos eos commodi quibusdam et dolores placeat atque eius, ad excepturi corrupti labore fugiat!', LikesCounter: 5, CommentsCounter: 0)
    six_post = Post.create(author_id: first_user.id, Title: 'Pros and cons', Text:     'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae possimus sint facere neque 
    alias repellat asperiores quos eos commodi quibusdam et dolores placeat atque eius, ad excepturi corrupti labore fugiat!', LikesCounter: 10, CommentsCounter: 1)
    seven_post = Post.create(author_id: first_user.id, Title: 'The food', Text:   'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae possimus sint facere neque     
    alias repellat asperiores quos eos commodi quibusdam et dolores placeat atque eius, ad excepturi corrupti labore fugiat!', LikesCounter: 13, CommentsCounter: 2)

    Comment.create(posts_id: first_post.id, author_id: first_user.id, Text: 'Hi Tom!' )
    Comment.create(posts_id: six_post.id, author_id: first_user.id, Text: 'Hi Lilly!' )
    Comment.create(posts_id: seven_post.id, author_id: first_user.id, Text: 'Hi Tom!' )
    Comment.create(posts_id: seven_post.id, author_id: first_user.id, Text: 'Hi Lilly!' )
    Comment.create(posts_id: second_post.id, author_id: second_user.id, Text: 'Hi Tom!' )
    Comment.create(posts_id: second_post.id, author_id: second_user.id, Text: 'Hi Lilly!' )
    Comment.create(posts_id: second_post.id, author_id: third_user.id, Text: 'Hi Lilly!' )
    Comment.create(posts_id: third_post.id, author_id: second_user.id, Text: 'Hi Lilly!' )
  end



  add_data