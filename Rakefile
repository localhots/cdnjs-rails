require 'bundler/gem_tasks'

namespace :cdnjs do
  desc 'Updates packages.json file from cdnjs.com'
  task :update do
    require 'open-uri'
    require 'multi_json'

    packages_url = 'http://cdnjs.com/packages.json'
    file_path = File.expand_path('../data/packages.json', __FILE__)
    json = open(packages_url).read

    # Remove all unnecessary data
    # Keep repo small and code fast
    data = MultiJson.load(json)['packages'].map do |pkg|
      {
        pkg['name'] => {
          'filename'       => pkg['filename'],
          'latest_version' => pkg['version'],
          'versions'       => pkg['assets'].map{ |asset| asset['version'] }
        }
      }
    end.inject(:merge)

    # Pretty format JSON for better diffs and smaller patches
    json = MultiJson.dump(data, :pretty => true)

    File.open file_path, 'wb' do |file|
      file.write json
      file.close
    end
  end
end
