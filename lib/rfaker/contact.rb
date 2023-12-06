module RFaker
  module Contact
    extend self
    extend ModuleUtils

    Contact = Struct.new("Contact", :first_name, :last_name, :address, :title, :role, :company) do |klass|
    end

    [:first_name, :last_name, :country].each do |key|
      define_method(key) do |country: self.country|
        sample(key, country:)
      end
    end

    def country
      DATA.keys.sample
    end

    private

    def sample(key = nil, country: self.country)
      if key
        DATA[country].sample[key.to_s]
      else
        DATA[country].sample
      end
    end
  end
end
