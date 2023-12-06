# frozen_string_literal: true

require "test_helper"

class TestAddress < Minitest::Test
  def test_address
    assert_instance_of(RFaker::Address::Address, RFaker::Address.address)
  end

  def test_full_address
    assert_match(/[\w+,]/, RFaker::Address.full_address)
  end

  def test_street
    assert_match(/[\w+]/, RFaker::Address.street)
  end

  def test_housenumber
    assert_match(/[\w+]/, RFaker::Address.housenumber)
  end

  def test_postcode
    assert_match(/[a-zA-Z0-9]/, RFaker::Address.postcode)
  end

  def test_city
    assert_match(/[a-z]/, RFaker::Address.city)
  end

  def test_state
    assert_match(/[a-z]/, RFaker::Address.state(country: "DE"))
  end

  def test_coordinates
    assert_pattern { RFaker::Address.coordinates => [Float, Float] }
  end

  def test_country
    assert_match(/[A-Z]{2}/, RFaker::Address.country)
  end
end
