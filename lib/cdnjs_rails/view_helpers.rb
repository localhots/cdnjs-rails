module CdnjsRails
  module ViewHelpers
    def javascript_cdnjs_tag name, options = {}
      javascript_include_tag CdnjsRails.package_url(name, options)
    end

    def stylesheet_cdnjs_tag name, options = {}
      stylesheet_include_tag CdnjsRails.package_url(name, options)
    end
  end
end
