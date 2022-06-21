class Book < ApplicationRecord
  after_commit :delete_book_from_author, on: :destroy
  after_destroy_commit :delete_book_from_author

  def delete_book_from_author
    if Book.exist?(id)
      Book.delete(id)
    end
  end
end

=begin
# Transaction Callbacks
There are two additional callbacks that are triggered by the completion of a database transaction: after_commit and after_rollback. 
These callbacks are very similar to the after_save callback except that they don't execute until after database changes have either been committed or rolled back. 
They are most useful when your active record models need to interact with external systems which are not part of the database transaction.

Consider, for example, the previous example where the book model needs to delete a file after the corresponding record is destroyed. 
If anything raises an exception after the after_destroy callback is called and the transaction rolls back, the file will have been deleted and the model will be left in an inconsistent state. 
For example, suppose that book1.destroy in the code below is not valid and the save! method raises an error.
By using the after_commit callback we can account for this case.

The :on option specifies when a callback will be fired. If you don't supply the :on option the callback will fire for every action.

Since using the after_commit callback only on create, update, or delete is common, there are aliases for those operations:
after_create_commit
after_update_commit
after_destroy_commit

When a transaction completes, the after_commit or after_rollback callbacks are called for all models created, updated, or destroyed within 
that transaction. However, if an exception is raised within one of these callbacks, the exception will bubble up and any remaining after_commit or after_rollback methods will not be executed. As such, if your callback code could raise an exception, you'll need to rescue it and handle it within the callback in order to allow other callbacks to run.
The code executed within after_commit or after_rollback callbacks is itself not enclosed within a transaction.
Using both after_create_commit and after_update_commit with the same method name will only allow the last callback defined to take effect, 
as they both internally alias to after_commit which overrides previously defined callbacks with the same method name.


=end