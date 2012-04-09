
class ForwardableContentHashBinder
  attr_reader :content_hash

  def initialize(content_hash)
    @content_hash = content_hash
  end

  def method_missing(method, *args)
    super(method, args) unless @content_hash[method.to_s]
    @content_hash[method.to_s]
  end

  def get_binding
    binding
  end

end
