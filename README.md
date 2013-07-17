# [cdnjs](http://cdnjs.com) helpers for Rails apps

This gem adds view helpers to Ruby on Rails applications that embed javascripts
and stylesheets directly from [cdnjs](http://cdnjs.com)

## Installation

Add this line to your application's Gemfile:
```ruby
gem 'cdnjs-rails'
```

And then execute:
```
$ bundle
```

## Usage

From view files
```
<html>
<head>
  <title>Hello World!</title>
  <%= stylesheet_cdnjs_tag 'normalize' %>
</head>
<body>
  <%= yield %>
  <%= javascript_cdnjs_tag 'jquery', version: '2.0.3', protocol: 'https' %>
</body>
</html>
```

From anywhere in the app
```ruby
CdnjsRails.package_url('chosen', v: '0.9.10', proto: 'http')
```

## Options

`version` (aliases: `ver`, `v`): package version, latest by default

`protocol` (alias: `proto`): url protocol, relative by default

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
