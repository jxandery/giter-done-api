class GitService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new "https://api.github.com"
  end

  def repos(name)
    parse(connection.get("/users/#{name}/repos"))
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
