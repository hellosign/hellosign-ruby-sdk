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
  class SignatureRequestBulkSendWithTemplateRequest
    # Use `template_ids` to create a SignatureRequest from one or more templates, in the order in which the template will be used.
    attr_accessor :template_ids

    # `signer_file` is a CSV file defining values and options for signer fields. Required unless a `signer_list` is used, you may not use both. The CSV can have the following columns:  - `name`: the name of the signer filling the role of RoleName - `email_address`: email address of the signer filling the role of RoleName - `pin`: the 4- to 12-character access code that will secure this signer's signature page (optional) - `sms_phone_number`: An E.164 formatted phone number that will receive a code via SMS to access this signer's signature page. (optional)      **Note**: Not available in test mode and requires a Standard plan or higher. - `*_field`: any column with a _field\" suffix will be treated as a custom field (optional)      You may only specify field values here, any other options should be set in the custom_fields request parameter.  Example CSV:  ``` name, email_address, pin, company_field George, george@example.com, d79a3td, ABC Corp Mary, mary@example.com, gd9as5b, 123 LLC ```
    attr_accessor :signer_file

    # `signer_list` is an array defining values and options for signer fields. Required unless a `signer_file` is used, you may not use both.
    attr_accessor :signer_list

    # Allows signers to decline to sign a document if `true`. Defaults to `false`.
    attr_accessor :allow_decline

    # Add CC email recipients. Required when a CC role exists for the Template.
    attr_accessor :ccs

    # An array defining values and options for custom fields. Required when defining pre-set values in `form_fields_per_document` or [Text Tags](https://app.hellosign.com/api/textTagsWalkthrough#TextTagIntro).
    attr_accessor :custom_fields

    # The custom message in the email that will be sent to the signers.
    attr_accessor :message

    # Key-value data that should be attached to the signature request. This metadata is included in all API responses and events involving the signature request. For example, use the metadata field to store a signer's order number for look up when receiving events for the signature request.  Each request can include up to 10 metadata keys, with key names up to 40 characters long and values up to 1000 characters long.
    attr_accessor :metadata

    # The URL you want signers redirected to after they successfully sign.
    attr_accessor :signing_redirect_url

    # The subject in the email that will be sent to the signers.
    attr_accessor :subject

    # Whether this is a test, the signature request will not be legally binding if set to `true`. Defaults to `false`.
    attr_accessor :test_mode

    # The title you want to assign to the SignatureRequest.
    attr_accessor :title

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'template_ids' => :'template_ids',
        :'signer_file' => :'signer_file',
        :'signer_list' => :'signer_list',
        :'allow_decline' => :'allow_decline',
        :'ccs' => :'ccs',
        :'custom_fields' => :'custom_fields',
        :'message' => :'message',
        :'metadata' => :'metadata',
        :'signing_redirect_url' => :'signing_redirect_url',
        :'subject' => :'subject',
        :'test_mode' => :'test_mode',
        :'title' => :'title'
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
        :'template_ids' => :'Array<String>',
        :'signer_file' => :'File',
        :'signer_list' => :'Array<SubBulkSignerList>',
        :'allow_decline' => :'Boolean',
        :'ccs' => :'Array<SubCC>',
        :'custom_fields' => :'Array<SubCustomField>',
        :'message' => :'String',
        :'metadata' => :'Hash<String, Object>',
        :'signing_redirect_url' => :'String',
        :'subject' => :'String',
        :'test_mode' => :'Boolean',
        :'title' => :'String'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `HelloSign::SignatureRequestBulkSendWithTemplateRequest` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.merged_attributes.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `HelloSign::SignatureRequestBulkSendWithTemplateRequest`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'template_ids')
        if (value = attributes[:'template_ids']).is_a?(Array)
          self.template_ids = value
        end
      end

      if attributes.key?(:'signer_file')
        self.signer_file = attributes[:'signer_file']
      end

      if attributes.key?(:'signer_list')
        if (value = attributes[:'signer_list']).is_a?(Array)
          self.signer_list = value
        end
      end

      if attributes.key?(:'allow_decline')
        self.allow_decline = attributes[:'allow_decline']
      else
        self.allow_decline = false
      end

      if attributes.key?(:'ccs')
        if (value = attributes[:'ccs']).is_a?(Array)
          self.ccs = value
        end
      end

      if attributes.key?(:'custom_fields')
        if (value = attributes[:'custom_fields']).is_a?(Array)
          self.custom_fields = value
        end
      end

      if attributes.key?(:'message')
        self.message = attributes[:'message']
      end

      if attributes.key?(:'metadata')
        if (value = attributes[:'metadata']).is_a?(Hash)
          self.metadata = value
        end
      end

      if attributes.key?(:'signing_redirect_url')
        self.signing_redirect_url = attributes[:'signing_redirect_url']
      end

      if attributes.key?(:'subject')
        self.subject = attributes[:'subject']
      end

      if attributes.key?(:'test_mode')
        self.test_mode = attributes[:'test_mode']
      else
        self.test_mode = false
      end

      if attributes.key?(:'title')
        self.title = attributes[:'title']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @template_ids.nil?
        invalid_properties.push('invalid value for "template_ids", template_ids cannot be nil.')
      end

      if !@message.nil? && @message.to_s.length > 5000
        invalid_properties.push('invalid value for "message", the character length must be smaller than or equal to 5000.')
      end

      if !@subject.nil? && @subject.to_s.length > 255
        invalid_properties.push('invalid value for "subject", the character length must be smaller than or equal to 255.')
      end

      if !@title.nil? && @title.to_s.length > 255
        invalid_properties.push('invalid value for "title", the character length must be smaller than or equal to 255.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @template_ids.nil?
      return false if !@message.nil? && @message.to_s.length > 5000
      return false if !@subject.nil? && @subject.to_s.length > 255
      return false if !@title.nil? && @title.to_s.length > 255
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] message Value to be assigned
    def message=(message)
      if !message.nil? && message.to_s.length > 5000
        fail ArgumentError, 'invalid value for "message", the character length must be smaller than or equal to 5000.'
      end

      @message = message
    end

    # Custom attribute writer method with validation
    # @param [Object] metadata Value to be assigned
    def metadata=(metadata)
      @metadata = metadata
    end

    # Custom attribute writer method with validation
    # @param [Object] subject Value to be assigned
    def subject=(subject)
      if !subject.nil? && subject.to_s.length > 255
        fail ArgumentError, 'invalid value for "subject", the character length must be smaller than or equal to 255.'
      end

      @subject = subject
    end

    # Custom attribute writer method with validation
    # @param [Object] title Value to be assigned
    def title=(title)
      if !title.nil? && title.to_s.length > 255
        fail ArgumentError, 'invalid value for "title", the character length must be smaller than or equal to 255.'
      end

      @title = title
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          template_ids == o.template_ids &&
          signer_file == o.signer_file &&
          signer_list == o.signer_list &&
          allow_decline == o.allow_decline &&
          ccs == o.ccs &&
          custom_fields == o.custom_fields &&
          message == o.message &&
          metadata == o.metadata &&
          signing_redirect_url == o.signing_redirect_url &&
          subject == o.subject &&
          test_mode == o.test_mode &&
          title == o.title
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [template_ids, signer_file, signer_list, allow_decline, ccs, custom_fields, message, metadata, signing_redirect_url, subject, test_mode, title].hash
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
        if attributes[attribute_map[key]].nil? && self.class.merged_nullable.include?(key)
          self.send("#{key}=", nil)
        elsif type =~ /\AArray<(.*)>/i
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
    def to_hash
      hash = {}
      self.class.merged_attributes.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = self.class.merged_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end

        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end