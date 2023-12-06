require "csv"

module RFaker
  module ModuleUtils
    def const_missing(const_name)
      if const_name.match?(/[a-z]/) # Not a constant, probably a class/module name.
        super const_name
      else
        mod_name = ancestors.first.to_s.split("::").last
        data_files = ["#{RFaker::BASE_LIB_PATH}/rfaker/data/#{underscore(mod_name)}", "#{RFaker::BASE_LIB_PATH}/rfaker/data/#{underscore(mod_name)}.csv"]
        data_path = data_files.find { |file| File.exist?(file) }
        data = CSV.read(data_path, headers: true).group_by { |row| row["country"] }
        const_set const_name, data
        data
      end
    end

    def underscore(string)
      string.gsub("::", "/")
        .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
        .gsub(/([a-z\d])([A-Z])/, '\1_\2')
        .tr("-", "_")
        .downcase
    end
  end
end
