module Categoryz3
  class Category < ActiveRecord::Base
    belongs_to :parent     , class_name: 'Categoryz3::Category'  , inverse_of: :children
    has_many :children     , class_name: 'Categoryz3::Category'  , foreign_key: :parent_id , inverse_of: :parent , dependent: :destroy
    has_many :direct_items , class_name: 'Categoryz3::Item'      , inverse_of: :category   , dependent: :destroy
    has_many :child_items  , class_name: 'Categoryz3::ChildItem' , inverse_of: :category   , dependent: :destroy
    validates :name        , presence: true

    scope :parent_categories, -> { where(parent_id: nil) }
    attr_accessible :name

    # Public: Returns the full categories path from the root category until this category
    #
    # Example:
    #
    #   subcategory3.path
    #   #=> [category, subcategory1, subcategory2, subcategory3]
    #
    def path
      return @path_array if @path_array
      parent_category = self
      @path_array = [parent_category]
      while (parent_category = parent_category.parent) != nil do
        @path_array.insert(0, parent_category) 
      end
      @path_array
    end

  end
end
