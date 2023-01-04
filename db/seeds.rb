# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
second_post = Post.create(author: second_user, title: 'This is my second post!',
                          text: 'Second post is always better than the first one')
third_post = Post.create(author: first_user, title: 'Going again!', text: 'We\'re going to the moon!')
fourth_post = Post.create(author: second_user, title: 'Second on the run', text: 'This is my second post')

Comment.create(post: first_post, author: second_user, text: 'Hi Tom!')
Comment.create(post: first_post, author: second_user, text: 'Hello Tom')
Comment.create(post: first_post, author: second_user, text: 'Hola Tom')
Comment.create(post: first_post, author: second_user, text: 'Wassup Tom')
Comment.create(post: first_post, author: second_user, text: 'How are you, Tom?')
Comment.create(post: first_post, author: second_user, text: 'Good to see you, Tom')
