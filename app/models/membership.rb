# == Schema Information
#
# Table name: memberships
#
#  id      :integer          not null, primary key
#  user_id :integer
#  role_id :integer
#  org_id  :integer
#

class Membership < ActiveRecord::Base
  belongs_to :user, touch:true
  belongs_to :role
  belongs_to :org

  validates_presence_of :user, :role, :org
end
