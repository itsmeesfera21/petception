class Connect
  include Mongoid::Document
  field :firstname, type: String 
  field :lastname, type: String
  field :email, type: String
  field :petnames, type: String
  field :pet_id, type: String
  field :created_at, type: Time, default: DateTime.now
  belongs_to :pet  #relatioship with another table
  validates_presence_of :firstname
  validates_presence_of :email
end