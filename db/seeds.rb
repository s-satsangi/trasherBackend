# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
User.destroy_all
Post.destroy_all
Comment.destroy_all
Like.destroy_all

5.times do 
    User.create( 
        first_name: Faker::Name.first_name,
        middle_name: Faker::Name.middle_name,
        last_name: Faker::Name.last_name,
        username: Faker::Esport.player
    )
end

30.times do 
    Post.create(
        user_id: User.all.sample.id,
        text: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4),
    )
end

20.times do 
    Comment.create(
        post_id: Post.all.sample.id,
        user_id: User.all.sample.id,
        text: Faker::Lorem.sentence(word_count: 2, supplemental: true, random_words_to_add: 3)
    )
end

30.times do 
    Like.create(
        upvote_id: Comment.all.sample.id,
        user_id: User.all.sample.id,
        upvote_type: Comment
    )
end

30.times do 
    Like.create(
        upvote_id: Post.all.sample.id,
        user_id: User.all.sample.id,
        upvote_type: Post
    )
end