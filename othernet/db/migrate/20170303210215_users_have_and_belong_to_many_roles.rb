class UsersHaveAndBelongToManyRoles < ActiveRecord::Migration
  def change
  	create_table :roles_spuds, :id => false do |t|
      t.references :role, :spud
    end
  end
end
