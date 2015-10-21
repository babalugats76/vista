class Quote
   include ActiveModel::Model
   attr_accessor :name, :city, :email, :phone, :details
   validates :name, :city, :email, :details, presence: true
   validates :phone, presence: false, 
                     format: { with: /\A[\(\)0-9\- \+\.]{10,20}\z/, message: "must be a valid telephone number." }
end
