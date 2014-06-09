namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    pw = "foobar"
    User.create!(name: "Dili",
                 email: "Di@l.i",
                 password: pw,
                 password_confirmation: pw)
    User.create!(name: "John Fisher",
                 email: "Jo@h.n",
                 password: pw,
                 password_confirmation: pw)
    User.create!(name: "Black Jack",
                 email: "bj@j.k",
                 password: pw,
                 password_confirmation: pw)
  end
end