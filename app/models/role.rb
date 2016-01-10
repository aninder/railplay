# == Schema Information
#
# Table name: roles
#
#  id   :integer          not null, primary key
#  name :string
#

class Role < ActiveRecord::Base
  has_many :memberships
  has_many :org, :through => :memberships
  has_many :users, :through => :memberships
  validates :name,
           presence:true,
           uniqueness: {case_sensitive: false}

  before_create do
    puts "sleeping"
    sleep 10;
    puts "resuming"
  end

end
