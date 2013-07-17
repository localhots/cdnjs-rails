module CdnjsRails
  module ViewHelpers
    def javascript_cdnjs_tag name, version = nil
      javascript_include_tag CdnjsRails.package_url(name, version)
    end

    def stylesheet_cdnjs_tag name, version = nil
      stylesheet_include_tag CdnjsRails.package_url(name, version)
    end
  end
end
