class ThirdParty < ActiveRecord::Base
  attr_accessible :name, :password, :username

  belongs_to :organization

  before_create :pass_sec

  private
    def pass_sec
       require "encryptor"
       puts "doing pass sec"
       puts self.name
       puts self.password

       k = Digest::SHA256.hexdigest(self.name + ENV["EK"])
       enc = Encryptor.encrypt(self.password, :key => k)
       puts "enc is"
       puts enc

       utf8_enc = enc.force_encoding("UTF-8")
       puts "utf8 enc"
       puts utf8_enc

       puts utf8_enc.encoding

       self.password = utf8_enc
   end
end
