class User < ActiveRecord::Base

  def self.service
    @service ||= GitService.new
  end

  def self.find_or_create_from_oauth(oauth)
    user = User.find_or_create_by(provider: oauth.provider, uid: oauth.uid)

    user.email = oauth.info.email
    user.nickname = oauth.info.nickname
    user.image_url = oauth.info.image
    user.token = oauth.credentials.token
    user.save

    user
  end

  def self.info(owner)
    service.info(owner)
  end

  def self.starred_repos(owner)
    service.starred_repos(owner)
  end

  def self.organizations(token)
    service.organizations(token)
  end

  def self.notifications(token)
    service.notifications(token)
  end
end
