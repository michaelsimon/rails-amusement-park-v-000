class RemoveUserPasswordNull < ActiveRecord::Migration
  def change
    change_column_null(:users, :password, true)
  end
end
