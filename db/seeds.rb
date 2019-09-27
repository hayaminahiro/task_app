# coding: utf-8

User.create!( name: "Sample User",
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password",
              admin: true)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email:  email,
               password:               password,
               password_confirmation:  password
  )
end

users = User.order(:created_at).take(1)
a = 0
b = 0
50.times do
  users.each do |user|
    user.tasks.create!(task_title: "タスク#{a += 1}", task_details: "タスク詳細#{b += 1}")
  end
end