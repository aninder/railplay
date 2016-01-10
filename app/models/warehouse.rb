                                                                              # == Schema Information
#
# Table name: warehouses
#
#  id   :integer          not null, primary key
#  name :string
#

class Warehouse < ActiveRecord::Base
  has_many :addresses,  :as => :addressable, :dependent => :destroy
  # validates_presence_of :name

  def billing_address
    self.addresses.billing_addresses.first
  end
  def shipping_address
    self.addresses.shipping_addresses.first
  end
end
