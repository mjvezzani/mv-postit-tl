class User < ActiveRecord::Base

  include Sluggable

  has_secure_password

  has_many :posts
  has_many :comments
  has_many :votes

  sluggable_column :username

  #before_save :generate_slug

  #def generate_slug
  #  self.slug = self.username.gsub(' ', '-').downcase
  #end

  #def to_param
  #  self.slug
  #end

end
