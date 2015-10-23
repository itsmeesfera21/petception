class Contact
  include Mongoid::Document
  field :email, type: String
  field :firstname, type: String
  field :lastname, type: String
  field :petnames, type: String   
  field :inquiry_id, type: String
  field :help_reason, type: String
  field :created_at, type: Time, default: DateTime.now
  belongs_to :inquiry
  validates_presence_of :firstname, :email, :help_reason
end