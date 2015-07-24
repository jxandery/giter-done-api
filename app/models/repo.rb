class Repo < OpenStruct

  def self.service
    @service ||= GitService.new
  end

  def self.all_repos(owner)
    service.repos(owner).map do |repo|
      Repo.new(repo)
    end
  end
end
