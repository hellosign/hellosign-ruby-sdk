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
  class UnclaimedDraftEditAndResendRequest
    # Client id of the app used to create the draft. Used to apply the branding and callback url defined for the app.
    attr_accessor :client_id

    attr_accessor :editor_options

    # The request created from this draft will also be signable in embedded mode if set to `true`.
    attr_accessor :is_for_embedded_signing

    # The email address of the user that should be designated as the requester of this draft. If not set, original requester's email address will be used.
    attr_accessor :requester_email_address

    # The URL you want signers redirected to after they successfully request a signature.
    attr_accessor :requesting_redirect_url

    # When only one step remains in the signature request process and this parameter is set to `false` then the progress stepper will be hidden.
    attr_accessor :show_progress_stepper

    # The URL you want signers redirected to after they successfully sign.
    attr_accessor :signing_redirect_url

    # Whether this is a test, the signature request created from this draft will not be legally binding if set to `true`. Defaults to `false`.
    attr_accessor :test_mode

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'client_id' => :'client_id',
        :'editor_options' => :'editor_options',
        :'is_for_embedded_signing' => :'is_for_embedded_signing',
        :'requester_email_address' => :'requester_email_address',
        :'requesting_redirect_url' => :'requesting_redirect_url',
        :'show_progress_stepper' => :'show_progress_stepper',
        :'signing_redirect_url' => :'signing_redirect_url',
        :'test_mode' => :'test_mode'
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
        :'client_id' => :'String',
        :'editor_options' => :'SubEditorOptions',
        :'is_for_embedded_signing' => :'Boolean',
        :'requester_email_address' => :'String',
        :'requesting_redirect_url' => :'String',
        :'show_progress_stepper' => :'Boolean',
        :'signing_redirect_url' => :'String',
        :'test_mode' => :'Boolean'
      }
    end

    # Attribute type mapping of this model + parent
    def self.merged_types
      self.openapi_types
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `HelloSign::UnclaimedDraftEditAndResendRequest` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.merged_attributes.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `HelloSign::UnclaimedDraftEditAndResendRequest`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'client_id')
        self.client_id = attributes[:'client_id']
      end

      if attributes.key?(:'editor_options')
        self.editor_options = attributes[:'editor_options']
      end

      if attributes.key?(:'is_for_embedded_signing')
        self.is_for_embedded_signing = attributes[:'is_for_embedded_signing']
      end

      if attributes.key?(:'requester_email_address')
        self.requester_email_address = attributes[:'requester_email_address']
      end

      if attributes.key?(:'requesting_redirect_url')
        self.requesting_redirect_url = attributes[:'requesting_redirect_url']
      end

      if attributes.key?(:'show_progress_stepper')
        self.show_progress_stepper = attributes[:'show_progress_stepper']
      else
        self.show_progress_stepper = true
      end

      if attributes.key?(:'signing_redirect_url')
        self.signing_redirect_url = attributes[:'signing_redirect_url']
      end

      if attributes.key?(:'test_mode')
        self.test_mode = attributes[:'test_mode']
      else
        self.test_mode = false
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @client_id.nil?
        invalid_properties.push('invalid value for "client_id", client_id cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @client_id.nil?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          client_id == o.client_id &&
          editor_options == o.editor_options &&
          is_for_embedded_signing == o.is_for_embedded_signing &&
          requester_email_address == o.requester_email_address &&
          requesting_redirect_url == o.requesting_redirect_url &&
          show_progress_stepper == o.show_progress_stepper &&
          signing_redirect_url == o.signing_redirect_url &&
          test_mode == o.test_mode
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [client_id, editor_options, is_for_embedded_signing, requester_email_address, requesting_redirect_url, show_progress_stepper, signing_redirect_url, test_mode].hash
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