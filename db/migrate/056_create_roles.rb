class CreateRoles < ActiveRecord::Migration
  class User < ActiveRecord::Base; end
  class Role < ActiveRecord::Base; end

  def self.up
    create_table :roles do |t|
      t.column :name, :string
    end

    admin_role = Role.create(:name => 'admin')    
    moderator_role = Role.create(:name => 'moderator')
    member_role = Role.create(:name => 'member')            
    
    add_column :users, :role_id, :integer

    #set all existing users to 'member'
    User.update_all("role_id = #{member_role.id}", ["admin = ?", false])
    #set admins to 'admin'
    User.update_all("role_id = #{admin_role.id}", ["admin = ?", true])    

    remove_column :users, :admin
  end

  def self.down
    drop_table :roles
    remove_column :users, :role_id
    add_column :users, :admin, :boolean, :default => false
  end
end
