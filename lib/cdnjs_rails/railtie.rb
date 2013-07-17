require 'cdnjs_rails/view_helpers'

module CdnjsRails
  class Railtie < Rails::Railtie
    initializer 'cdnjs_rails.view_helpers' do |app|
      ActionView::Base.send(:include, ViewHelpers)
    end
  end
end
