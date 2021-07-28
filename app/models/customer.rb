class Customer
  include ActiveModel::Model

  attr_accessor :full_name, :mobile, :pin, :address, :email

  validates :full_name, :mobile, :pin, :address, :email, presence: true

  def initialize(attrs)
  	@full_name = attrs['full_name']
  	@mobile = attrs['mobile']
  	@pin = attrs['pin']
  	@address = attrs['address']
  	@email = attrs['email']
  end

  def detailed_address
    [full_name, address, "PIN: #{pin}", "Mob: #{mobile}"].join(",\n") 
  end
end