class Neighbor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :authentication_keys => [:another_name]

  attr_accessor :another_name


  validates_presence_of :another_name

  has_and_belongs_to_many :roles, -> { uniq }
  has_many :webpages,
		inverse_of: :neighbor,
		dependent: :destroy

	def is_admin?
		# admin = self.roles.select{ |r| r.name == "Super Spud" || "Staff"}
		admin = "super"
		admin.present?
	end



    def self.find_for_database_authentication(warden_conditions)
      
      conditions = warden_conditions.dup
      if another_name = conditions.delete(:another_name)
        where(conditions.to_h).where(["lower(another_name) = :value OR lower(email) = :value", { :value => another_name.downcase }]).first
      elsif conditions.has_key?(:another_name) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
    end

	def self.find_first_by_auth_conditions(warden_conditions)
	    conditions = warden_conditions.dup
	    if another_name = conditions.delete(:another_name)
	      where(conditions).where(["lower(another_name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
	    else
	      if conditions[:another_name].nil?
	        where(conditions).first
	      else
	        where(another_name: conditions[:another_name]).first
	      end
	    end
	 end

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
