# == Schema Information
#
# Table name: orgs
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Org < ActiveRecord::Base
  has_many :memberships
  has_many :roles, :through => :memberships
  has_many :users, :through => :memberships

  validates :name,
            presence:true,
            uniqueness: {case_sensitive: false}

  scope :num_of_roles, lambda{Org.joins(:roles).select("orgs.name as organisation, count(roles.name) as num_of_roles").group('orgs.name').order('num_of_roles DESC')}

  # before_create do
  #   logger.info("sleeping")
  #   sleep 20
  #   logger.info("resuming")
  # end

  after_rollback do
    puts "@@@@@@@@@@@@@@@@ rollback callback @@@@@@@@@@@@@@@"
  end
end
