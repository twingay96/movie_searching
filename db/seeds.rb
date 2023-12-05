# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
150.times do
    Movie.create(title: Faker::Movie.unique.title)
end
# bundle add faker
# rails db:seed -> db/seeds.rb 파일내 작성된 코드를 실행하여 데이터베이스 초기화에 필요한 데이터를 추가하는데 사용
# 위의 사항을 진행한 후 , rails c -> Model.count 해보면 갯수가 출력될 것 


