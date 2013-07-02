Forwardable Content Hash Binder
===============================
A small helper class for exposing Hashes to ERB templates or other binding scoped scenarios.

[![Gem Version](https://badge.fury.io/rb/forwardable_content_hash_binder.png)](http://badge.fury.io/rb/forwardable_content_hash_binder)

Installation
------------
gem install forwardable_content_hash_binder

Usage
-----
Access top level keys as methods
```ruby
require 'forwardable_content_hash_binder'

fchb = ForwardableContentHashBinder.new("title" => "Best Gem Ever", "body" => "This gem has the potential to save lives")

fchb.title
 => "Best Gem Ever"
```
If any key in the Hash is a Proc, it will execute it on call
```ruby
fchb["Time"] = Proc.new { Time.new}
 => #<Proc:0x00000002345a10@(irb):5> 
fchb.time
 => 2013-07-02 08:41:49 -0400
fchb.time
 => 2013-07-02 08:42:32 -0400
```

Pass the binding to ERB for easy templating
```ruby
fchb.get_binding
 => #<Binding:0x007fb1fb0570d0>

require 'erb'
template = '<h1> <%= title %> </h1> <p> <%= body %> at <%= time %> </p>'
ERB.new(template).result(fchb.get_binding)
 => "<h1> Best Gem Ever </h1> <p> This gem has the potential to save lives at 2013-07-02 08:43:02 -0400 </p>"
 ```


