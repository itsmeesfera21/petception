class Post
  include Mongoid::Document
  field :category_id, type: String
  field :name, type: String
  field :content, type: String
  field :created_at, type: Time, default: DateTime.now
  field :modified_at,    type: Time
  mount_uploader :image, ImageUploader
  validates_presence_of :name
  embeds_many :comments
  accepts_nested_attributes_for :comments
  belongs_to :category
  rails_admin do
  	list do
      include_all_fields
      exclude_fields :_id
    end
  end

end
