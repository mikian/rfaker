# frozen_string_literal: true

require_relative "rfaker/version"

module RFaker
  BASE_LIB_PATH = File.expand_path(__dir__)

  require_relative "rfaker/module_utils"

  require_relative "rfaker/address"
end
