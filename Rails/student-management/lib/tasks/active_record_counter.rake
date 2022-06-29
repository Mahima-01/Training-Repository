namespace :active_record_counter do
  desc "Display the count of student model"
  task students_count: :environment do
    puts"Student Count = #{Student.count}"
  end
end

=begin
itsacheckmate@itsacheckmate:~/Html_Project/Training-Repository/Rails/student-management$ rails generate task active_record_counter students_count
      create  lib/tasks/active_record_counter.rake
itsacheckmate@itsacheckmate:~/Html_Project/Training-Repository/Rails/student-management$ rails active_record_counter:students_count
Student Count = 17

itsacheckmate@itsacheckmate:~/Html_Project/Training-Repository/Rails/student-management$ rails -T | grep active_record_counter
rails active_record_counter:students_count  # Display the count of student model

itsacheckmate@itsacheckmate:~/Html_Project/Training-Repository/Rails/student-management$ bundle exec rake -T | grep active_record_counter
rake active_record_counter:students_count  # Display the count of student model

=end