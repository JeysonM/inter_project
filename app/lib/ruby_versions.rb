class RubyVersions
    def self.call
        # apiRelease = ENV["RUBY_VERSION"]
        apiRelease = ENV.fetch("RUBY_VERSION")
        # apiRelease = 'https://api.github.com/repos/rails/rails/releases'
        resp = HTTP.get(apiRelease).body
        releases = []
        json_data = JSON.parse(resp)
        json_data.each do |release|
            value = { release:  release['name']}
            releases << value
        end
        return {status: 200, message: releases}
    end
end