# Custom exceptions for Crymon.
module Crymon::Errors
  # Root custom exception.
  class CrymonException < Exception; end

  # The allowed number of characters in global settings has been exceeded.
  class CacheSettingsExcessChars < CrymonException
    def initialize(parameter_name : String, limit_size : UInt32)
      super(%(Global settings > Parameter: "#{parameter_name}" => The line size of #{limit_size} characters has been exceeded.))
    end
  end

  # The global settings fails regular expression validation.
  class CacheSettingsRegexFails < CrymonException
    def initialize(parameter_name : String, regex_str : String)
      super(%(Global settings > Parameter: "#{parameter_name}" => Regular expression check fails: #{regex_str}.))
    end
  end

  # Missing parameter for Metadata.
  class MetaParameterMissing < CrymonException
    def initialize(model_name : String, parameter_name : String)
      super(%(Model: #{model_name} => Missing "#{parameter_name}" parameter for Meta.))
    end
  end

  # The names in the list of ignored fields do not match.
  class MetaIgnoredFieldMissing < CrymonException
    def initialize(model_name : String, parameter_name : String, field_name : String)
      super(%(Model: #{model_name} > Meta parameter: "#{parameter_name}" => The "#{field_name}" field is missing from the list of ignored fields.))
    end
  end

  # The allowed number of characters in the metadata parameters has been exceeded.
  class MetaParamExcessChars < CrymonException
    def initialize(model_name : String, parameter_name : String, limit_size : UInt32)
      super(%(Model: #{model_name} > Meta parameter: "#{parameter_name}" => The line size of #{limit_size} characters has been exceeded.))
    end
  end

  # The metadata parameter fails regular expression validation.
  class MetaParamRegexFails < CrymonException
    def initialize(model_name : String, parameter_name : String, regex_str : String)
      super(%(Model: #{model_name} > Meta parameter: "#{parameter_name}" => Regular expression check fails: #{regex_str}.))
    end
  end

  # The Model has no fields.
  class ModelFieldsMissing < CrymonException
    def initialize(model_name : String)
      super(%(Model "#{model_name}" has no fields.))
    end
  end

  # The maximum number of characters in the model name has been exceeded.
  class ModelNameExcessChars < CrymonException
    def initialize(model_name : String)
      super(%(Model: #{model_name} => The Model name exceeds 25 characters.))
    end
  end

  # The Model name fails regular expression validation.
  class ModelNameRegexFails < CrymonException
    def initialize(model_name : String, regex_str : String)
      super(%(Model: #{model_name} => The model name fails the regular expression test #{regex_str}.))
    end
  end

  # Invalid input type.
  class InvalidInputType < CrymonException
    def initialize(input_type : String)
      super(%(The "#{input_type}" invalid input type.))
    end
  end

  # Invalid type.
  class InvalidType < CrymonException
    def initialize(message : String)
      super
    end
  end
end
