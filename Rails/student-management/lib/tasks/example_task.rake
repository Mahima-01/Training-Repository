namespace :example_task do
  desc 'Greeting message task'

  task greet_the_user: :environment do
    puts"Hello User! Welcome to the rake world!"
  end
  task say_bye_to_user: :environment do
    puts"Hello user! It is time to signoff now. Please try this at your end"
  end
end

=begin
# Ways to create a rake task:
Write a rake task from scratch.
Use rails generator to create rake task.

itsacheckmate@itsacheckmate:~/Html_Project/Training-Repository/Rails/student-management$ rails example_task:greet_the_user
Hello User! Welcome to the rake world!

itsacheckmate@itsacheckmate:~/Html_Project/Training-Repository/Rails/student-management$ rails example_task:say_bye_to_user
Hello user! It is time to signoff now. Please try this at your end

=end
