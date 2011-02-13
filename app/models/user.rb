class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :login

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :twitter, :github, :name, :city, :username, :login

  validates_uniqueness_of :username

  [:twitter, :github].each do |c|
    validates_length_of c, :maximum => 64
  end

  def city=(c)
    write_attribute :city, c.downcase
  end

  def city
    read_attribute(:city).capitalize if !self.new_record?
  end

  def avatar_url
    default_url = "/images/guest.png"
    gravatar_id = Digest::MD5.hexdigest(email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=75"
  end

  def self.find_by_city(c, options={})
    return all(:conditions => {:city => c.downcase}.merge(options))
  end

  protected

  def self.find_for_database_authentication(conditions)
    login = conditions.delete(:login)
    where(conditions).where(["username = :value OR email = :value", { :value => login }]).first
  end

end
