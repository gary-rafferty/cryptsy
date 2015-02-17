module Cryptsy
  class ApiResource

    def meta_class
      class << self; self end
    end

    def initialize attrs
      attrs.each do |name, val|
        if name[0].match(/\d/)
          name = "_#{name}"
        end

        instance_variable_set "@#{name}", val

        meta_class.send(:define_method, name) do
          instance_variable_get "@#{name}"
        end
      end
    end
  end
end
