require "./field"

module Crymon::Fields
  # Type of selective field with static of elements.
  # NOTE: With a single choice.
  struct ChoiceI64Field < Crymon::Fields::Field
    # Field type - Structure Name.
    getter field_type : String = "ChoiceI64Field"
    # Sets the value of an element.
    property value : Int64?
    # Value by default.
    getter default : Int64?
    # Specifies that multiple options can be selected at once.
    getter? multiple : Bool = false
    # Html tag: select.
    # <br>
    # _Example: [{5, "Title"}, {10, "Title 2"}]_
    getter choices : Array(Tuple(Int64, String))?
    # To optimize field traversal in the `paladins/check()` method.
    # WARNING: It is recommended not to change.
    getter group : UInt8 = 3
    #
    # :nodoc:
    getter max : Nil
    # :nodoc:
    getter min : Nil
    # :nodoc:
    getter regex : Nil
    # :nodoc:
    getter regex_err_msg : Nil
    # :nodoc:
    getter maxlength : Nil
    # :nodoc:
    getter minlength : Nil
    # :nodoc:
    getter maxsize : Float32 = 0
    # :nodoc:
    getter? unique : Bool = false

    def initialize(
      @label : String = "",
      @default : Int64? = nil,
      @hide : Bool = false,
      @required : Bool = false,
      @disabled : Bool = false,
      @readonly : Bool = false,
      @ignored : Bool = false,
      @hint : String = "",
      @choices : Array(Tuple(Int64, String))? = Array(Tuple(Int64, String)).new
    ); end

    # Does the field value match the possible options in choices.
    def has_value? : Bool
      if value = @value || @default
        value_list : Array(Int64) = @choices.not_nil!.map { |item| item[0] }
        return false unless value_list.includes?(value.not_nil!)
      end
      true
    end
  end

  # Type of selective field with static of elements.
  # NOTE: With multiple choice.
  struct ChoiceI64MultField < Crymon::Fields::Field
    # Field type - Structure Name.
    getter field_type : String = "ChoiceI64MultField"
    # Sets the value of an element.
    property value : Array(Int64)?
    # Value by default.
    getter default : Array(Int64)?
    # Specifies that multiple options can be selected at once.
    getter? multiple : Bool = true
    # Html tag: select multiple.
    # <br>
    # _Example: [{5, "Title"}, {10, "Title 2"}]_
    getter choices : Array(Tuple(Int64, String))?
    # To optimize field traversal in the `paladins/check()` method.
    # WARNING: It is recommended not to change.
    getter group : UInt8 = 3
    #
    # :nodoc:
    getter max : Nil
    # :nodoc:
    getter min : Nil
    # :nodoc:
    getter regex : Nil
    # :nodoc:
    getter regex_err_msg : Nil
    # :nodoc:
    getter maxlength : Nil
    # :nodoc:
    getter minlength : Nil
    # :nodoc:
    getter maxsize : Float32 = 0
    # :nodoc:
    getter? unique : Bool = false

    def initialize(
      @label : String = "",
      @default : Array(Int64)? = nil,
      @hide : Bool = false,
      @required : Bool = false,
      @disabled : Bool = false,
      @readonly : Bool = false,
      @ignored : Bool = false,
      @hint : String = "",
      @choices : Array(Tuple(Int64, String))? = Array(Tuple(Int64, String)).new
    ); end

    # Does the field value match the possible options in choices.
    def has_value? : Bool
      if value = @value || @default
        value_list : Array(Int64) = @choices.not_nil!.map { |item| item[0] }
        value.not_nil!.each do |elem|
          return false unless value_list.includes?(elem)
        end
      end
      true
    end
  end

  # Type of selective field with dynamic addition of elements.
  # NOTE: For simulate relationship Many-to-One.
  # NOTE: Elements are added via the `ModelName.update_dyn_field()` method.
  struct ChoiceI64DynField < Crymon::Fields::Field
    # Field type - Structure Name.
    getter field_type : String = "ChoiceI64DynField"
    # Sets the value of an element.
    property value : Int64?
    # Specifies that multiple options can be selected at once.
    getter? multiple : Bool = false
    # Html tag: select.
    # <br>
    # _Example: [{5, "Title"}, {10, "Title 2"}]_
    getter choices : Array(Tuple(Int64, String))?
    # To optimize field traversal in the `paladins/check()` method.
    # WARNING: It is recommended not to change.
    getter group : UInt8 = 3
    #
    # :nodoc:
    getter default : Nil
    # :nodoc:
    getter max : Nil
    # :nodoc:
    getter min : Nil
    # :nodoc:
    getter regex : Nil
    # :nodoc:
    getter regex_err_msg : Nil
    # :nodoc:
    getter maxlength : Nil
    # :nodoc:
    getter minlength : Nil
    # :nodoc:
    getter maxsize : Float32 = 0
    # :nodoc:
    getter? unique : Bool = false

    def initialize(
      @label : String = "",
      @hide : Bool = false,
      @required : Bool = false,
      @disabled : Bool = false,
      @readonly : Bool = false,
      @ignored : Bool = false,
      @hint : String = ""
    ); end

    # To insert data from global storage.
    def json_to_choices(json : String)
      @choices = Array(Tuple(Int64, String)).from_json(json)
    end

    # Does the field value match the possible options in choices.
    def has_value? : Bool
      if value = @value || @default
        value_list : Array(Int64) = @choices.not_nil!.map { |item| item[0] }
        return false unless value_list.includes?(value.not_nil!)
      end
      true
    end
  end

  # Type of selective field with dynamic addition of elements.
  # NOTE: For simulate relationship Many-to-Many.
  # NOTE: Elements are added via the `ModelName.update_dyn_field()` method.
  struct ChoiceI64MultDynField < Crymon::Fields::Field
    # Field type - Structure Name.
    getter field_type : String = "ChoiceI64MultDynField"
    # Sets the value of an element.
    property value : Array(Int64)?
    # Specifies that multiple options can be selected at once.
    getter? multiple : Bool = true
    # Html tag: select.
    # <br>
    # _Example: [{5, "Title"}, {10, "Title 2"}]_
    getter choices : Array(Tuple(Int64, String))?
    # To optimize field traversal in the `paladins/check()` method.
    # WARNING: It is recommended not to change.
    getter group : UInt8 = 3
    #
    # :nodoc:
    getter default : Nil
    # :nodoc:
    getter max : Nil
    # :nodoc:
    getter min : Nil
    # :nodoc:
    getter regex : Nil
    # :nodoc:
    getter regex_err_msg : Nil
    # :nodoc:
    getter maxlength : Nil
    # :nodoc:
    getter minlength : Nil
    # :nodoc:
    getter maxsize : Float32 = 0
    # :nodoc:
    getter? unique : Bool = false

    def initialize(
      @label : String = "",
      @hide : Bool = false,
      @required : Bool = false,
      @disabled : Bool = false,
      @readonly : Bool = false,
      @ignored : Bool = false,
      @hint : String = ""
    ); end

    # To insert data from global storage.
    def json_to_choices(json : String)
      @choices = Array(Tuple(Int64, String)).from_json(json)
    end

    # Does the field value match the possible options in choices.
    def has_value? : Bool
      if value = @value || @default
        value_list : Array(Int64) = @choices.not_nil!.map { |item| item[0] }
        value.not_nil!.each do |elem|
          return false unless value_list.includes?(elem)
        end
      end
      true
    end
  end
end
