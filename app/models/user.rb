class User < ActiveRecord::Base  
  acts_as_taggable_on :flags

  belongs_to :organization
  has_many :pets, :through => :organization

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessor :affiliate
  attr_accessible :email, :password, :password_confirmation, 
                  :remember_me, :provider, :uid, :affiliate

  validates :email, :presence => true

  replicate_associations :flags

  before_create :check_affiliate

  def check_affiliate
    puts "check affiliate"
    puts self.inspect
    if self.affiliate == 'on'
      puts "new affiliate signed up!"
      self.flag_list = self.flag_list.push('affiliate')
      #send email to admins
    end
  end

  def admin?
    self.flag_list.include? "admin"
  end

  def add_flag(flag)
    self.flag_list = self.flag_list.push(flag)
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(
                         provider:auth.provider,
                         uid:auth.uid,
                         email:auth.info.email,
                         password:Devise.friendly_token[0,20]
                         )
    end
    user
  end


end
