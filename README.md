Forwardable Content Hash Binder
===============================
A small helper class for exposing Hashes to ERB templates or other binding scoped scenarios.

Installation
------------
gem install forwardable_content_hash_binder

Usage
-----
```ruby
require 'forwardable_content_hash_binder'

fchb = ForwardableContentHashBinder.new("title" => "Best Gem Ever", "body" => "This gem has the potential to save lives")

fchb.title
 => "Best Gem Ever"

fchb.get_binding
 => #<Binding:0x007fb1fb0570d0>

require 'erb'
template = '<h1> <%= title %> </h1> <p> <%= body %> </p>'
ERB.new(template).result(fchb.get_binding)
 => "<h1> Best Gem Ever </h1> <p> This gem has the potential to save lives </p>"
 ```

