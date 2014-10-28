class Hash
  def except_key(which)
    self.tap{ |h| h.delete(which) }
  end
end

class Object
  #From rails/Object/try
  def try(*a, &b)
    if a.empty? && block_given?
      yield self
    else
      public_send(*a, &b) if respond_to?(a.first)
    end
  end
end

class String
  def underscored_class_name
    self.split("::")[1].
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end

  def pluralize
    #TODO this is wrong. But works for now
    "#{self}s"
  end

  def tablelize
    self.underscored_class_name.pluralize
  end
end
