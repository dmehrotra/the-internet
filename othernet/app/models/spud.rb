class Spud < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :spudname

  has_and_belongs_to_many :roles, -> { uniq }
  has_many :posts,
		inverse_of: :user

	# def is_admin?
	# 	admin = self.roles.select{ |r| r.name == "Super Admin" || "Staff"}
	# 	admin.present?
	# end
	# def is_super_admin?
	# 	admin = self.roles.select{ |r| r.name == "Super Admin"}
	# 	admin.present?
	# end
	# def formatted_roles
	# 	roles = self.roles.map {|r| r.name }
	# 	roles.join(', ')
	# end
	# def assign_roles(role_ids)
	# 	self.roles = []
	# 	role_ids.each do |role_id|
	# 		self.roles << Role.find(role_id) unless role_id.blank?
	# 	end
	# end


end
