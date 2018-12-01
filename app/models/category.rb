class Category < ActiveHash::Base
  include ActiveHash::Associations
  fields :name

  has_many :recipes

  self.data = [
      {:id => 1, :name => "和食"},
      {:id => 2, :name => "洋食"},
      {:id => 3, :name => "中華"},
      {:id => 4, :name => "フレンチ"}
  ]
end