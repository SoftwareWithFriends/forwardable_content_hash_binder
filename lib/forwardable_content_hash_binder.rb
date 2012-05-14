
class ForwardableContentHashBinder
  attr_reader :content_hash

  def initialize(content_hash)
    @content_hash = content_hash
  end

  def method_missing(method, *args)
    super(method, args) unless @content_hash[method.to_s]
    value = @content_hash[method.to_s]
    return value unless value.kind_of? Proc
    value.call
  end

  def []=(key,value)
    content_hash[key] = value
  end

  def get_binding
    binding
  end

end
