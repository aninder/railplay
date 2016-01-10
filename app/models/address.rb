# == Schema Information
#
# Table name: addresses
#
#  id               :integer          not null, primary key
#  city             :string
#  category_id      :integer
#  addressable_id   :integer
#  addressable_type :string
#

class Address < ActiveRecord::Base
  belongs_to :category
  belongs_to :addressable, :polymorphic => true

  scope :billing_addresses ,  proc{ where(:categories => {:name => 'billing'}).includes(:category) }
  scope :shipping_addresses, proc{ where(:categories => {:name => 'shipping'}).includes(:category) }
end
