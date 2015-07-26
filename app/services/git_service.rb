class GitService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new "https://api.github.com"
  end

  def repos(name)
    parse(connection.get("/users/#{name}/repos"))
  end

  def info(name)
    parse(connection.get("/users/#{name}"))
  end

  def starred_repos(name)
    parse(connection.get("/users/#{name}/starred"))
  end

  def organizations(token)
    parse(connection.get("/user/orgs?access_token=#{token}"))
  end

  def notifications(token)
    parse(connection.get("/notifications?access_token=#{token}"))
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
