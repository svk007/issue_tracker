class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
    accepts_nested_attributes_for :roles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :issues
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def role_symbols
    (roles || []).map {|r| r.title.to_sym}
  end

end
