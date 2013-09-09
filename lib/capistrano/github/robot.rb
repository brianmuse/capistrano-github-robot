require "octokit"

Capistrano::Configuration.instance(:must_exist).load do |configuration|
  default_run_options[:pty] = true

  after "deploy:update", "github:post_comment"

  namespace :github do
    desc "Posting the github comment based on the passed parameters"
    task :post_comment do
      if exists?(:pull_request_number) && fetch(:post_github_comment) == true
	    if exists?(:github_token) && exists?(:target_comment_repository) && exists?(:comment_body) && exists?(:pull_request_number)
	      logger.debug "Posting a comment to the PR issue thread on Github"
	      client = Octokit::Client.new :access_token => "#{github_token}"
	      client.add_comment("#{target_comment_repository}", "#{pull_request_number}", "#{comment_body}")
	    else 
	      puts "Cannot post Github comment. Missing access_token, target_comment_repository, or comment_body"
	    end
      end
    end
  end
end