=begin
#HelloSign API

#HelloSign v3 API

The version of the OpenAPI document: 3.0.0
Contact: apisupport@hellosign.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.3.0

=end

require 'date'
require 'time'

module HelloSign
  class SignatureRequestResponseDataTypeEnum
    TEXT = "text".freeze
    CHECKBOX = "checkbox".freeze
    DATE_SIGNED = "date_signed".freeze
    DROPDOWN = "dropdown".freeze
    INITIALS = "initials".freeze
    RADIO = "radio".freeze
    SIGNATURE = "signature".freeze
    TEXT_MERGE = "text-merge".freeze
    CHECKBOX_MERGE = "checkbox-merge".freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def self.build_from_hash(value)
      new.build_from_hash(value)
    end

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = SignatureRequestResponseDataTypeEnum.constants.select { |c| SignatureRequestResponseDataTypeEnum::const_get(c) == value }
      raise "Invalid ENUM value #{value} for class #SignatureRequestResponseDataTypeEnum" if constantValues.empty?
      value
    end
  end
end