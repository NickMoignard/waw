class Base
    attr_accessor :errors

    def initialize(args = {})
        args.each do |k,v|
            attr_name = k.to_s.underscore
            
            if respond_to?("#{attr_name}=")
                send("#{attr_name}=", v)
            end
        end
    end
end
