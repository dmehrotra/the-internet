class UsersHaveAndBelongToManyRoles < ActiveRecord::Migration
  def change
  	create_table :neighbors_roles, :id => false do |t|
      t.references :role, :neighbor
    end
  end
end
