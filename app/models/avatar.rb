class Avatar < ActiveRecord::Base
   GRAVATAR_BASE_URL = "http://www.gravatar.com/avatar/"
   GRAVATAR_DEFAULT = "mm"
   SIZE = 90
  
  def self.from_user(user)
    new(email: user.email)
  end
  
  def initialize(attributes)
    @email = attributes[:email]
  end
  
  def to_s
    if @email.present?
      gravatar_url
    else
      fallback_url
    end
  end
  
  private
  
  def gravatar_url
    gravatar_from_digest Digest::MD5.hexdigest(@email)
  end
  
  def fallback_url
    gravatar_from_digest(123)
  end
  
  def gravatar_from_digest(digest)
    "#{GRAVATAR_BASE_URL}#{digest}?s=#{SIZE}&d=#{GRAVATAR_DEFAULT}"
  end
      
end
