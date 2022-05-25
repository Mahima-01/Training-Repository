class CreateNovels < ActiveRecord::Migration[7.0]
  def change
    create_table :novels do |t|
      t.text :title
      t.string :author

      t.timestamps
    end
  end
end

=begin
itsacheckmate@itsacheckmate:~/Training-Repository/Rails/Students$ rails g scaffold novel title:text author:string
      invoke  active_record
      create    db/migrate/20220525092516_create_novels.rb
      create    app/models/novel.rb
      invoke    test_unit
      create      test/models/novel_test.rb
      create      test/fixtures/novels.yml
      invoke  resource_route
       route    resources :novels
      invoke  scaffold_controller
      create    app/controllers/novels_controller.rb
      invoke    erb
      create      app/views/novels
      create      app/views/novels/index.html.erb
      create      app/views/novels/edit.html.erb
      create      app/views/novels/show.html.erb
      create      app/views/novels/new.html.erb
      create      app/views/novels/_form.html.erb
      create      app/views/novels/_novel.html.erb
      invoke    resource_route
      invoke    test_unit
      create      test/controllers/novels_controller_test.rb
      create      test/system/novels_test.rb
      invoke    helper
      create      app/helpers/novels_helper.rb
      invoke      test_unit
      invoke    jbuilder
      create      app/views/novels/index.json.jbuilder
      create      app/views/novels/show.json.jbuilder
      create      app/views/novels/_novel.json.jbuilder
      
itsacheckmate@itsacheckmate:~/Training-Repository/Rails/Students$ rails server
=> Booting Puma
=> Rails 7.0.3 application starting in development 
=> Run `bin/rails server --help` for more startup options
Puma starting in single mode...
* Puma version: 5.6.4 (ruby 3.0.0-p0) ("Birdie's Version")
*  Min threads: 5
*  Max threads: 5
*  Environment: development
*          PID: 17498
* Listening on http://127.0.0.1:3000
* Listening on http://[::1]:3000
=end
