class UsersHaveAndBelongToManyRoles < ActiveRecord::Migration
  def change
  	create_table :anothers_roles, :id => false do |t|
      t.references :role, :another
    end
  end
end
