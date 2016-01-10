# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  name                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :memberships, dependent: :nullify
  has_many :roles , :through => :memberships
  has_many :org , :through => :memberships
  validates :name,
            presence:true,
            uniqueness: {case_sensitive: false}

  scope :unemployed, lambda{User.where('id not in (?)', Membership.all.pluck(:user_id).uniq).pluck :name}

  def cached_memberships
    puts "<<<---------------------CACHING------MEMBERSHIPS---------------->>>>>"
    Rails.cache.fetch([self,'memberships'])do
      logger.info "database hit memberships!!!!!"
      self.memberships
    end
  end

  def cached_roles
    puts "---------CACHING ROLES--------------------------------"
    Rails.cache.fetch([self,'roles']) do
      logger.info "database hit roles"
      self.roles
    end
  end
end
