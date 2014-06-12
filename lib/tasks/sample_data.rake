namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    
    pw = "foobar"

    @user = User.create!(name: "Dili",
                 email: "Di@l.i",
                 password: pw,
                 password_confirmation: pw)
    Game.create(user_id:@user.id, game_type:"Beginner")
    Game.create(user_id:@user.id, game_type:"Intermediate")
    Game.create(user_id:@user.id, game_type:"High Roller")

    @user = User.create!(name: "John Fisher",
                 email: "Jo@h.n",
                 password: pw,
                 password_confirmation: pw)
    Game.create(user_id:@user.id, game_type:"Beginner")
    Game.create(user_id:@user.id, game_type:"Intermediate")
    Game.create(user_id:@user.id, game_type:"High Roller")

    @user = User.create!(name: "Black Jack",
                 email: "bj@j.k",
                 password: pw,
                 password_confirmation: pw)
    Game.create(user_id:@user.id, game_type:"Beginner")
    Game.create(user_id:@user.id, game_type:"Intermediate")
    Game.create(user_id:@user.id, game_type:"High Roller")
  end
end