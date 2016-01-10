# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string
#  category_id :integer
#

class Category < ActiveRecord::Base
  has_many :subcategories, :class_name  => "Category"
  # TODO  change category to PATENTCATEGORY
  belongs_to :parentcategory, :class_name => 'Category', foreign_key:'category_id'
  validates_presence_of :name
end
