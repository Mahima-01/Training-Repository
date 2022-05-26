# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

100000.times do |i|
  Author.create(title: "published_on #{i}")
end


=begin
Library_development=# select * from authors limit 10; 
 id |     title      |         created_at         |         updated_at         
----+----------------+----------------------------+----------------------------
  1 | published_on 0 | 2022-05-26 06:59:25.140685 | 2022-05-26 06:59:25.140685
  2 | published_on 1 | 2022-05-26 06:59:25.143651 | 2022-05-26 06:59:25.143651
  3 | published_on 2 | 2022-05-26 06:59:25.148842 | 2022-05-26 06:59:25.148842
  4 | published_on 3 | 2022-05-26 06:59:25.150607 | 2022-05-26 06:59:25.150607
  5 | published_on 4 | 2022-05-26 06:59:25.152317 | 2022-05-26 06:59:25.152317
  6 | published_on 5 | 2022-05-26 06:59:25.153977 | 2022-05-26 06:59:25.153977
  7 | published_on 6 | 2022-05-26 06:59:25.155644 | 2022-05-26 06:59:25.155644
  8 | published_on 7 | 2022-05-26 06:59:25.157281 | 2022-05-26 06:59:25.157281
  9 | published_on 8 | 2022-05-26 06:59:25.158939 | 2022-05-26 06:59:25.158939
 10 | published_on 9 | 2022-05-26 06:59:25.160626 | 2022-05-26 06:59:25.160626
(10 rows)
=end