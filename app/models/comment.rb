class Comment
  include Mongoid::Document
  # field :name, type: String
  field :user_id, type: String
  field :content, type: String
  field :created_at, type: Time, default: DateTime.now
  embedded_in :post, :inverse_of => :comments
end