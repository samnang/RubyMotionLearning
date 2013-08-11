class Tag
  PROPERTIES = [:timestamp, :id, :name]
  attr_accessor *PROPERTIES

  def initialize(hash = {})
    hash.each do |key, value|
      if PROPERTIES.member? key.to_sym
        self.send("#{key}=", value)
      end
    end
  end
end
