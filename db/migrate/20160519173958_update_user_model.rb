class UpdateUserModel < ActiveRecord::Migration
  def change
    change_column_default(:users, :admin, false)
    change_column_null(:users, :password, false)
  end
end
