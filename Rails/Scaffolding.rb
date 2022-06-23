Scaffolding:

Scaffolding is a quick way to produce some major pieces of an application. 
For auto generating a set of models, views and controllers for a new resource in a single operation, scaffolding is used.
Scaffolding is a technique supported by MVC frameworks in which programmers can specify how application database may be used. 
The framework or compiler uses it together with pre-defined code templates to generate the final code that the application can use to perform CRUD in database entries, effectively treating the templates as a "scaffold" on which to build a more powerful application.
Scaffolding occurs at two different phases of the program lifecycle, design time and run time. 
Design time scaffolding produces files of code that can later be modified by the programmer. 
Run time scaffolding produces code on the fly. It allows changes to the design of the templates to be immediately reflected throughout the application.

Scaffolding on Rails
Scaffolding was made popular by the Rails framework. 

When line scaffold :model_name is added to a controller, Rails will automatically generate all the appropriate data interfaces at run time.

An external command can also be used to generate Ruby code for the scaffold in advance, which is rails generate scaffold model_name. 
The generated script will produce files of Ruby code that application can use to interact with database.

# To generate a scaffold for the post resource, enter the following command:
 rails generate scaffold Post name:string title:string content:text  

The scaffold generator will build several files in your application with some folders.

Following files will be created with scaffolding.

File	                                                                          Purpose
db/migrate/20100207214725_create_posts.rb	                        Creates the post table in your database
app/models/post.rb	                                                     The Post model
test/unit/post_test.rb	                                               Unit testing harness for posts model
test/fixtures/posts.yml	                                       Sample posts for use in testing
config/routes.rb	                                               Edited to include routing information for posts
app/controllers/posts_controller.rb	                               The posts controller
app/views/posts/index.html.erb	                               A view to display index of all posts
app/views/posts/edit.html.erb	                                       A view to edit an existing post
app/views/posts/show.html.erb	                                       A view to display a single post
app/views/posts/new.html.erb	                                       A view to create a new post
app/views/posts/_form.html.erb	                               A partial to control the overall look and feel of the form used in edit and new views
test/functional/post_controller_test.rb	                       Functional testing harness for posts controller
app/helpers/posts_helper.rb	                                      Helper functions to be used from the post views
test/unit/helpers/posts_helper_test.rb	                       Unit testing harness for the posts helper
app/assets/javascripts/posts.js.coffee	                      Coffee script for post controller
app/assets/stylesheets/posts.css.scss	                              Cascading style sheet for post controller
app/assets/stylesheets/scaffolds.css.scss	                      Cascading style sheet to make scaffolded views look better




