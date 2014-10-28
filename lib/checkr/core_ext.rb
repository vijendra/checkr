module ExtendCore
  def extend_if_nonexistant *methods
    methods.each do |method_name|
      if !String.method_defined? method_name
        alias_method method_name, "checkr__#{method_name}".to_sym
      end
    end
  end
end

class Hash
  extend ExtendCore

  def checkr__except_key(which)
    self.tap{ |h| h.delete(which) }
  end

  extend_if_nonexistant :except_key
end

class Object
  extend ExtendCore

  #From rails/Object/try
  def checkr__try(*a, &b)
    if a.empty? && block_given?
      yield self
    else
      public_send(*a, &b) if respond_to?(a.first)
    end
  end

  extend_if_nonexistant :try
end

class String
  extend ExtendCore

  def checkr__underscored_class_name
    self.split("::")[1].
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end

  def checkr__pluralize
    #TODO this is wrong. But works for now
    "#{self}s"
  end

  def checkr__tablelize
    self.underscored_class_name.pluralize
  end

  extend_if_nonexistant :pluralize, :tablelize, :underscored_class_name
end
