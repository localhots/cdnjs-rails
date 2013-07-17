require 'multi_json'
require 'cdnjs_rails/railtie' if defined? Rails

module CdnjsRails
  URL_TEMPLATE = '%s//cdnjs.cloudflare.com/ajax/libs/%s/%s/%s'

  def package_url name, options = {}
    package = packages[name]
    raise UnknownPackageError.new(name) if package.nil?

    version = options[:version] || options[:ver] || options[:v]
    version = package['latest_version'] if version.nil? || version == 'latest'
    unless package['versions'].include?(version)
      raise UnknownPackageVersionError.new(name, version)
    end

    protocol = options[:protocol] || options[:proto]
    protocol = "#{protocol}:" unless protocol.nil?

    URL_TEMPLATE % [protocol.to_s, name, version, package['filename']]
  end

  private

  def packages
    @packages ||= MultiJson.load(packages_json)
  end

  def packages_json
    path = File.expand_path('../../data/packages.json', __FILE__)
    File.open(path).read
  end

  extend self

  class UnknownPackageError < ::Exception
    def initialize name
      super "Unknown package: #{name}"
    end
  end

  class UnknownPackageVersionError < ::Exception
    def initialize name, version
      super "Unknown #{name} version: #{version}"
    end
  end
end
