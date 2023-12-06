module RFaker
  module Address
    extend self
    extend ModuleUtils

    Address = Struct.new("Address", :street, :housenumber, :postcode, :city, :state, :country, :lat, :lon) do |klass|
      def to_s
        [
          [street, housenumber].join(" "),
          postcode,
          city,
          state,
          country
        ].compact.join(", ")
      end
    end

    def full_address(country: self.country)
      Address.new(*sample(country:).deconstruct).to_s
    end

    def address(country: self.country)
      Address.new(*sample(country:).deconstruct)
    end

    [:street, :housenumber, :postcode, :city, :state].each do |key|
      define_method(key) do |country: self.country|
        sample(key, country:)
      end
    end

    def coordinates(country: self.country)
      row = sample(country:)

      [row["lat"].to_f, row["lon"].to_f]
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
