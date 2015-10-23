class Category
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :created_at, type: Time, default: DateTime.now
  field :modified_at,    type: Time
   mount_uploader :image, ImageUploader
  has_many :posts
end
