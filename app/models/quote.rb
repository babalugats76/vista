class Quote
   include ActiveModel::Model
   attr_accessor :name, :city, :email, :phone, :details
   validates :name, :city, :details, presence: { message: "must be provided" }
   validates :email, presence: false,
                     format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, message: "must be a valid email address" }
   validates :phone, presence: false, 
                     format: { with: /\A[\(\)0-9\- \+\.]{10,20}\z/, message: "must be a valid telephone number" }
end
