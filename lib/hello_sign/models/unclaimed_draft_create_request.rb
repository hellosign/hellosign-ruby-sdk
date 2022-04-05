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
  class UnclaimedDraftCreateRequest
    # **file** or **file_url** is required, but not both.  Use `file[]` to indicate the uploaded file(s) to send for signature.  Currently we only support use of either the `file[]` parameter or `file_url[]` parameter, not both.
    attr_accessor :file

    # **file_url** or **file** is required, but not both.  Use `file_url[]` to have HelloSign download the file(s) to send for signature.  Currently we only support use of either the `file[]` parameter or `file_url[]` parameter, not both.
    attr_accessor :file_url

    # Allows signers to decline to sign a document if `true`. Defaults to `false`.
    attr_accessor :allow_decline

    attr_accessor :attachments

    # The email addresses that should be CCed.
    attr_accessor :cc_email_addresses

    # An array defining values and options for custom fields. Required when defining pre-set values in `form_fields_per_document` or [Text Tags](https://app.hellosign.com/api/textTagsWalkthrough#TextTagIntro).
    attr_accessor :custom_fields

    attr_accessor :field_options

    # Group information for fields defined in `form_fields_per_document`. String-indexed JSON array with `group_label` and `requirement` keys. `form_fields_per_document` must contain fields referencing a group defined in `form_field_groups`.
    attr_accessor :form_field_groups

    # Conditional Logic rules for fields defined in `form_fields_per_document`.
    attr_accessor :form_field_rules

    # The fields that should appear on the document, expressed as a 2-dimensional JSON array serialized to a string. The main array represents documents, with each containing an array of form fields. One document array is required for each file provided by the `file[]` parameter. In the case of a file with no fields, an empty list must be specified.  **NOTE**: Fields like **text**, **dropdown**, **checkbox**, **radio**, and **hyperlink** have additional required and optional parameters. Check out the list of [additional parameters](/api/reference/constants/#form-fields-per-document) for these field types.  * Text Field use `SubFormFieldsPerDocumentText` * Dropdown Field use `SubFormFieldsPerDocumentDropdown` * Hyperlink Field use `SubFormFieldsPerDocumentHyperlink` * Checkbox Field use `SubFormFieldsPerDocumentCheckbox` * Radio Field use `SubFormFieldsPerDocumentRadio` * Signature Field use `SubFormFieldsPerDocumentSignature` * Date Signed Field use `SubFormFieldsPerDocumentDateSigned` * Initials Field use `SubFormFieldsPerDocumentInitials` * Text Merge Field use `SubFormFieldsPerDocumentTextMerge` * Checkbox Merge Field use `SubFormFieldsPerDocumentCheckboxMerge`
    attr_accessor :form_fields_per_document

    # Send with a value of `true` if you wish to enable automatic Text Tag removal. Defaults to `false`. When using Text Tags it is preferred that you set this to `false` and hide your tags with white text or something similar because the automatic removal system can cause unwanted clipping. See the [Text Tags](https://app.hellosign.com/api/textTagsWalkthrough#TextTagIntro) walkthrough for more details.
    attr_accessor :hide_text_tags

    # The custom message in the email that will be sent to the signers.
    attr_accessor :message

    # Key-value data that should be attached to the signature request. This metadata is included in all API responses and events involving the signature request. For example, use the metadata field to store a signer's order number for look up when receiving events for the signature request.  Each request can include up to 10 metadata keys, with key names up to 40 characters long and values up to 1000 characters long.
    attr_accessor :metadata

    # Add Signers to your Unclaimed Draft Signature Request.
    attr_accessor :signers

    attr_accessor :signing_options

    # The URL you want signers redirected to after they successfully sign.
    attr_accessor :signing_redirect_url

    # The subject in the email that will be sent to the signers.
    attr_accessor :subject

    # Whether this is a test, the signature request created from this draft will not be legally binding if set to `true`. Defaults to `false`.
    attr_accessor :test_mode

    # The type of unclaimed draft to create. Use `send_document` to create a claimable file, and `request_signature` for a claimable signature request. If the type is `request_signature` then signers name and email_address are not optional.
    attr_accessor :type

    # Set `use_text_tags` to `true` to enable [Text Tags](https://app.hellosign.com/api/textTagsWalkthrough#TextTagIntro) parsing in your document (defaults to disabled, or `false`). Alternatively, if your PDF contains pre-defined fields, enable the detection of these fields by setting the `use_preexisting_fields` to `true` (defaults to disabled, or `false`). Currently we only support use of either `use_text_tags` or `use_preexisting_fields` parameter, not both.
    attr_accessor :use_preexisting_fields

    # Set `use_text_tags` to `true` to enable [Text Tags](https://app.hellosign.com/api/textTagsWalkthrough#TextTagIntro) parsing in your document (defaults to disabled, or `false`). Alternatively, if your PDF contains pre-defined fields, enable the detection of these fields by setting the `use_preexisting_fields` to `true` (defaults to disabled, or `false`). Currently we only support use of either `use_text_tags` or `use_preexisting_fields` parameter, not both.
    attr_accessor :use_text_tags

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'file' => :'file',
        :'file_url' => :'file_url',
        :'allow_decline' => :'allow_decline',
        :'attachments' => :'attachments',
        :'cc_email_addresses' => :'cc_email_addresses',
        :'custom_fields' => :'custom_fields',
        :'field_options' => :'field_options',
        :'form_field_groups' => :'form_field_groups',
        :'form_field_rules' => :'form_field_rules',
        :'form_fields_per_document' => :'form_fields_per_document',
        :'hide_text_tags' => :'hide_text_tags',
        :'message' => :'message',
        :'metadata' => :'metadata',
        :'signers' => :'signers',
        :'signing_options' => :'signing_options',
        :'signing_redirect_url' => :'signing_redirect_url',
        :'subject' => :'subject',
        :'test_mode' => :'test_mode',
        :'type' => :'type',
        :'use_preexisting_fields' => :'use_preexisting_fields',
        :'use_text_tags' => :'use_text_tags'
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
        :'file' => :'Array<File>',
        :'file_url' => :'Array<String>',
        :'allow_decline' => :'Boolean',
        :'attachments' => :'Array<SubAttachment>',
        :'cc_email_addresses' => :'Array<String>',
        :'custom_fields' => :'Array<SubCustomField>',
        :'field_options' => :'SubFieldOptions',
        :'form_field_groups' => :'Array<SubFormFieldGroup>',
        :'form_field_rules' => :'Array<SubFormFieldRule>',
        :'form_fields_per_document' => :'Array<Array<SubFormFieldsPerDocumentBase>>',
        :'hide_text_tags' => :'Boolean',
        :'message' => :'String',
        :'metadata' => :'Hash<String, Object>',
        :'signers' => :'Array<SubUnclaimedDraftSigner>',
        :'signing_options' => :'SubSigningOptions',
        :'signing_redirect_url' => :'String',
        :'subject' => :'String',
        :'test_mode' => :'Boolean',
        :'type' => :'String',
        :'use_preexisting_fields' => :'Boolean',
        :'use_text_tags' => :'Boolean'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `HelloSign::UnclaimedDraftCreateRequest` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.merged_attributes.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `HelloSign::UnclaimedDraftCreateRequest`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'file')
        if (value = attributes[:'file']).is_a?(Array)
          self.file = value
        end
      end

      if attributes.key?(:'file_url')
        if (value = attributes[:'file_url']).is_a?(Array)
          self.file_url = value
        end
      end

      if attributes.key?(:'allow_decline')
        self.allow_decline = attributes[:'allow_decline']
      else
        self.allow_decline = false
      end

      if attributes.key?(:'attachments')
        if (value = attributes[:'attachments']).is_a?(Array)
          self.attachments = value
        end
      end

      if attributes.key?(:'cc_email_addresses')
        if (value = attributes[:'cc_email_addresses']).is_a?(Array)
          self.cc_email_addresses = value
        end
      end

      if attributes.key?(:'custom_fields')
        if (value = attributes[:'custom_fields']).is_a?(Array)
          self.custom_fields = value
        end
      end

      if attributes.key?(:'field_options')
        self.field_options = attributes[:'field_options']
      end

      if attributes.key?(:'form_field_groups')
        if (value = attributes[:'form_field_groups']).is_a?(Array)
          self.form_field_groups = value
        end
      end

      if attributes.key?(:'form_field_rules')
        if (value = attributes[:'form_field_rules']).is_a?(Array)
          self.form_field_rules = value
        end
      end

      if attributes.key?(:'form_fields_per_document')
        if (value = attributes[:'form_fields_per_document']).is_a?(Array)
          self.form_fields_per_document = value
        end
      end

      if attributes.key?(:'hide_text_tags')
        self.hide_text_tags = attributes[:'hide_text_tags']
      else
        self.hide_text_tags = false
      end

      if attributes.key?(:'message')
        self.message = attributes[:'message']
      end

      if attributes.key?(:'metadata')
        if (value = attributes[:'metadata']).is_a?(Hash)
          self.metadata = value
        end
      end

      if attributes.key?(:'signers')
        if (value = attributes[:'signers']).is_a?(Array)
          self.signers = value
        end
      end

      if attributes.key?(:'signing_options')
        self.signing_options = attributes[:'signing_options']
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

      if attributes.key?(:'type')
        self.type = attributes[:'type']
      end

      if attributes.key?(:'use_preexisting_fields')
        self.use_preexisting_fields = attributes[:'use_preexisting_fields']
      else
        self.use_preexisting_fields = false
      end

      if attributes.key?(:'use_text_tags')
        self.use_text_tags = attributes[:'use_text_tags']
      else
        self.use_text_tags = false
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if !@message.nil? && @message.to_s.length > 5000
        invalid_properties.push('invalid value for "message", the character length must be smaller than or equal to 5000.')
      end

      if !@subject.nil? && @subject.to_s.length > 200
        invalid_properties.push('invalid value for "subject", the character length must be smaller than or equal to 200.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@message.nil? && @message.to_s.length > 5000
      return false if !@subject.nil? && @subject.to_s.length > 200
      type_validator = EnumAttributeValidator.new('String', ["send_document", "request_signature"])
      return false unless type_validator.valid?(@type)
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
      if !subject.nil? && subject.to_s.length > 200
        fail ArgumentError, 'invalid value for "subject", the character length must be smaller than or equal to 200.'
      end

      @subject = subject
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      validator = EnumAttributeValidator.new('String', ["send_document", "request_signature"])
      unless validator.valid?(type)
        fail ArgumentError, "invalid value for \"type\", must be one of #{validator.allowable_values}."
      end
      @type = type
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          file == o.file &&
          file_url == o.file_url &&
          allow_decline == o.allow_decline &&
          attachments == o.attachments &&
          cc_email_addresses == o.cc_email_addresses &&
          custom_fields == o.custom_fields &&
          field_options == o.field_options &&
          form_field_groups == o.form_field_groups &&
          form_field_rules == o.form_field_rules &&
          form_fields_per_document == o.form_fields_per_document &&
          hide_text_tags == o.hide_text_tags &&
          message == o.message &&
          metadata == o.metadata &&
          signers == o.signers &&
          signing_options == o.signing_options &&
          signing_redirect_url == o.signing_redirect_url &&
          subject == o.subject &&
          test_mode == o.test_mode &&
          type == o.type &&
          use_preexisting_fields == o.use_preexisting_fields &&
          use_text_tags == o.use_text_tags
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [file, file_url, allow_decline, attachments, cc_email_addresses, custom_fields, field_options, form_field_groups, form_field_rules, form_fields_per_document, hide_text_tags, message, metadata, signers, signing_options, signing_redirect_url, subject, test_mode, type, use_preexisting_fields, use_text_tags].hash
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
