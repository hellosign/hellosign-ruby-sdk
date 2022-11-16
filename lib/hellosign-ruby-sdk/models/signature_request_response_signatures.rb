=begin
#Dropbox Sign API

#Dropbox Sign v3 API

The version of the OpenAPI document: 3.0.0
Contact: apisupport@hellosign.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.3.0

=end

require 'date'
require 'time'

module HelloSign
  # An array of signature objects, 1 for each signer.
  class SignatureRequestResponseSignatures
    # Signature identifier.
    attr_accessor :signature_id

    # The email address of the signer.
    attr_accessor :signer_email_address

    # The name of the signer.
    attr_accessor :signer_name

    # The role of the signer.
    attr_accessor :signer_role

    # If signer order is assigned this is the 0-based index for this signer.
    attr_accessor :order

    # The current status of the signature. eg: awaiting_signature, signed, declined.
    attr_accessor :status_code

    # The reason provided by the signer for declining the request.
    attr_accessor :decline_reason

    # Time that the document was signed or null.
    attr_accessor :signed_at

    # The time that the document was last viewed by this signer or null.
    attr_accessor :last_viewed_at

    # The time the last reminder email was sent to the signer or null.
    attr_accessor :last_reminded_at

    # Boolean to indicate whether this signature requires a PIN to access.
    attr_accessor :has_pin

    # Boolean to indicate whether this signature has SMS authentication enabled.
    attr_accessor :has_sms_auth

    # Boolean to indicate whether this signature has SMS delivery enabled.
    attr_accessor :has_sms_delivery

    # The SMS phone number used for authentication or signature request delivery.
    attr_accessor :sms_phone_number

    # Email address of original signer who reassigned to this signer.
    attr_accessor :reassigned_by

    # Reason provided by original signer who reassigned to this signer.
    attr_accessor :reassignment_reason

    # Previous signature identifier.
    attr_accessor :reassigned_from

    # Error message pertaining to this signer, or null.
    attr_accessor :error

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'signature_id' => :'signature_id',
        :'signer_email_address' => :'signer_email_address',
        :'signer_name' => :'signer_name',
        :'signer_role' => :'signer_role',
        :'order' => :'order',
        :'status_code' => :'status_code',
        :'decline_reason' => :'decline_reason',
        :'signed_at' => :'signed_at',
        :'last_viewed_at' => :'last_viewed_at',
        :'last_reminded_at' => :'last_reminded_at',
        :'has_pin' => :'has_pin',
        :'has_sms_auth' => :'has_sms_auth',
        :'has_sms_delivery' => :'has_sms_delivery',
        :'sms_phone_number' => :'sms_phone_number',
        :'reassigned_by' => :'reassigned_by',
        :'reassignment_reason' => :'reassignment_reason',
        :'reassigned_from' => :'reassigned_from',
        :'error' => :'error'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Returns attribute map of this model + parent
    def self.merged_attributes
      self.attribute_map
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'signature_id' => :'String',
        :'signer_email_address' => :'String',
        :'signer_name' => :'String',
        :'signer_role' => :'String',
        :'order' => :'Integer',
        :'status_code' => :'String',
        :'decline_reason' => :'String',
        :'signed_at' => :'Integer',
        :'last_viewed_at' => :'Integer',
        :'last_reminded_at' => :'Integer',
        :'has_pin' => :'Boolean',
        :'has_sms_auth' => :'Boolean',
        :'has_sms_delivery' => :'Boolean',
        :'sms_phone_number' => :'String',
        :'reassigned_by' => :'String',
        :'reassignment_reason' => :'String',
        :'reassigned_from' => :'String',
        :'error' => :'String'
      }
    end

    # Attribute type mapping of this model + parent
    def self.merged_types
      self.openapi_types
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'signer_name',
        :'signer_role',
        :'order',
        :'decline_reason',
        :'signed_at',
        :'last_viewed_at',
        :'last_reminded_at',
        :'has_sms_auth',
        :'has_sms_delivery',
        :'sms_phone_number',
        :'reassigned_by',
        :'reassignment_reason',
        :'reassigned_from',
        :'error'
      ])
    end

    # Returns list of attributes with nullable: true of this model + parent
    def self.merged_nullable
      self.openapi_nullable
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `HelloSign::SignatureRequestResponseSignatures` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.merged_attributes.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `HelloSign::SignatureRequestResponseSignatures`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'signature_id')
        self.signature_id = attributes[:'signature_id']
      end

      if attributes.key?(:'signer_email_address')
        self.signer_email_address = attributes[:'signer_email_address']
      end

      if attributes.key?(:'signer_name')
        self.signer_name = attributes[:'signer_name']
      end

      if attributes.key?(:'signer_role')
        self.signer_role = attributes[:'signer_role']
      end

      if attributes.key?(:'order')
        self.order = attributes[:'order']
      end

      if attributes.key?(:'status_code')
        self.status_code = attributes[:'status_code']
      end

      if attributes.key?(:'decline_reason')
        self.decline_reason = attributes[:'decline_reason']
      end

      if attributes.key?(:'signed_at')
        self.signed_at = attributes[:'signed_at']
      end

      if attributes.key?(:'last_viewed_at')
        self.last_viewed_at = attributes[:'last_viewed_at']
      end

      if attributes.key?(:'last_reminded_at')
        self.last_reminded_at = attributes[:'last_reminded_at']
      end

      if attributes.key?(:'has_pin')
        self.has_pin = attributes[:'has_pin']
      end

      if attributes.key?(:'has_sms_auth')
        self.has_sms_auth = attributes[:'has_sms_auth']
      end

      if attributes.key?(:'has_sms_delivery')
        self.has_sms_delivery = attributes[:'has_sms_delivery']
      end

      if attributes.key?(:'sms_phone_number')
        self.sms_phone_number = attributes[:'sms_phone_number']
      end

      if attributes.key?(:'reassigned_by')
        self.reassigned_by = attributes[:'reassigned_by']
      end

      if attributes.key?(:'reassignment_reason')
        self.reassignment_reason = attributes[:'reassignment_reason']
      end

      if attributes.key?(:'reassigned_from')
        self.reassigned_from = attributes[:'reassigned_from']
      end

      if attributes.key?(:'error')
        self.error = attributes[:'error']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          signature_id == o.signature_id &&
          signer_email_address == o.signer_email_address &&
          signer_name == o.signer_name &&
          signer_role == o.signer_role &&
          order == o.order &&
          status_code == o.status_code &&
          decline_reason == o.decline_reason &&
          signed_at == o.signed_at &&
          last_viewed_at == o.last_viewed_at &&
          last_reminded_at == o.last_reminded_at &&
          has_pin == o.has_pin &&
          has_sms_auth == o.has_sms_auth &&
          has_sms_delivery == o.has_sms_delivery &&
          sms_phone_number == o.sms_phone_number &&
          reassigned_by == o.reassigned_by &&
          reassignment_reason == o.reassignment_reason &&
          reassigned_from == o.reassigned_from &&
          error == o.error
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [signature_id, signer_email_address, signer_name, signer_role, order, status_code, decline_reason, signed_at, last_viewed_at, last_reminded_at, has_pin, has_sms_auth, has_sms_delivery, sms_phone_number, reassigned_by, reassignment_reason, reassigned_from, error].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      new.build_from_hash(attributes)
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      attribute_map = self.class.merged_attributes

      self.class.merged_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[attribute_map[key]]))
        end
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :Time
        Time.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :File
        if HelloSign.configure.instantiate_files && value.is_a?(String)
          filepath = value

          if HelloSign.configure.root_file_path
            filepath = "#{HelloSign.configure.root_file_path}/#{value}"
          end

          if File.exist? filepath
            value = File.new(filepath, "r")
          end
        end

        value
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        # models (e.g. Pet)
        klass = HelloSign.const_get(type)
        klass.respond_to?(:openapi_one_of) ? klass.build(value) : klass.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash(include_nil = true)
      hash = {}
      self.class.merged_attributes.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          next unless include_nil
          is_nullable = self.class.merged_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end

        hash[param] = _to_hash(value, include_nil)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value, include_nil = true)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v, include_nil) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v, include_nil) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash(include_nil)
      else
        value
      end
    end

  end

end
