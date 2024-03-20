require "./field"

module DynFork::Fields
  # Type of selective field with static of elements.
  # NOTE: With a single choice.
  struct ChoiceF64Field < DynFork::Fields::Field
    # Field type - Structure Name.
    getter field_type : String = "ChoiceF64Field"
    # Sets the value of an element.
    property! value : Float64?
    # Value by default.
    getter! default : Float64?
    # Specifies that multiple options can be selected at once.
    getter? multiple : Bool = false
    # Html tag: select.
    # <br>
    # _Example: [{5.0, "Title"}, {5.25, "Title 2"}]_
    getter! choices : Array(Tuple(Float64, String))?
    # To optimize field traversal in the `paladins/check()` method.
    # WARNING: It is recommended not to change.
    getter group : UInt8 = 3
    #
    # :nodoc:
    getter! max : Nil
    # :nodoc:
    getter! min : Nil
    # :nodoc:
    getter! regex : Nil
    # :nodoc:
    getter! regex_err_msg : Nil
    # :nodoc:
    getter! maxlength : Nil
    # :nodoc:
    getter! minlength : Nil
    # :nodoc:
    getter maxsize : Float32 = 0
    # :nodoc:
    getter? unique : Bool = false
    # :nodoc:
    getter! input_type : Nil
    # :nodoc:
    getter media_root : String = ""
    # :nodoc:
    getter media_url : String = ""
    # :nodoc:
    getter target_dir : String = ""
    # :nodoc:
    getter! thumbnails : Nil

    # :nodoc:
    def refrash_val_i64(val : Int64); end

    # :nodoc:
    def refrash_val_bool(val : Bool); end

    # :nodoc:
    def refrash_val_str(val : String); end

    # :nodoc:
    def refrash_val_arr_str(val : Array(String)); end

    # :nodoc:
    def refrash_val_arr_i64(val : Array(Int64)); end

    # :nodoc:
    def refrash_val_arr_f64(val : Array(Float64)); end

    # :nodoc:
    def refrash_val_file_data(val : DynFork::Globals::FileData); end

    # :nodoc:
    def refrash_val_img_data(val : DynFork::Globals::ImageData); end

    # :nodoc:
    def refrash_val_datetime(val : Time); end

    # :nodoc:
    def refrash_val_date(val : Time); end

    # :nodoc:
    def extract_file_data : DynFork::Globals::FileData?; end

    def initialize(
      @label : String = "",
      @default : Float64? = nil,
      @hide : Bool = false,
      @required : Bool = false,
      @disabled : Bool = false,
      @readonly : Bool = false,
      @ignored : Bool = false,
      @hint : String = "",
      @choices : Array(Tuple(Float64, String))? = Array(Tuple(Float64, String)).new
    ); end

    def refrash_val_f64(val : Float64)
      @value = val
    end

    # Does the field value match the possible options in choices.
    def has_value? : Bool
      if value = @value || @default
        value_list : Array(Float64) = self.choices.map { |item| item[0] }
        return false unless value_list.includes?(value)
      end
      true
    end
  end

  # Type of selective field with static of elements.
  # NOTE: With multiple choice.
  struct ChoiceF64MultField < DynFork::Fields::Field
    # Field type - Structure Name.
    getter field_type : String = "ChoiceF64MultField"
    # Sets the value of an element.
    property! value : Array(Float64)?
    # Value by default.
    getter! default : Array(Float64)?
    # Specifies that multiple options can be selected at once.
    getter? multiple : Bool = true
    # Html tag: select multiple.
    # <br>
    # _Example: [{5.0, "Title"}, {5.25, "Title 2"}]_
    getter! choices : Array(Tuple(Float64, String))?
    # To optimize field traversal in the `paladins/check()` method.
    # WARNING: It is recommended not to change.
    getter group : UInt8 = 3
    #
    # :nodoc:
    getter! max : Nil
    # :nodoc:
    getter! min : Nil
    # :nodoc:
    getter! regex : Nil
    # :nodoc:
    getter! regex_err_msg : Nil
    # :nodoc:
    getter! maxlength : Nil
    # :nodoc:
    getter! minlength : Nil
    # :nodoc:
    getter maxsize : Float32 = 0
    # :nodoc:
    getter? unique : Bool = false
    # :nodoc:
    getter! input_type : Nil
    # :nodoc:
    getter media_root : String = ""
    # :nodoc:
    getter media_url : String = ""
    # :nodoc:
    getter target_dir : String = ""
    # :nodoc:
    getter! thumbnails : Nil

    # :nodoc:
    def refrash_val_i64(val : Int64); end

    # :nodoc:
    def refrash_val_f64(val : Float64); end

    # :nodoc:
    def refrash_val_bool(val : Bool); end

    # :nodoc:
    def refrash_val_str(val : String); end

    # :nodoc:
    def refrash_val_arr_str(val : Array(String)); end

    # :nodoc:
    def refrash_val_arr_i64(val : Array(Int64)); end

    # :nodoc:
    def refrash_val_file_data(val : DynFork::Globals::FileData); end

    # :nodoc:
    def refrash_val_img_data(val : DynFork::Globals::ImageData); end

    # :nodoc:
    def refrash_val_datetime(val : Time); end

    # :nodoc:
    def refrash_val_date(val : Time); end

    # :nodoc:
    def extract_file_data : DynFork::Globals::FileData?; end

    def initialize(
      @label : String = "",
      @default : Array(Float64)? = nil,
      @hide : Bool = false,
      @required : Bool = false,
      @disabled : Bool = false,
      @readonly : Bool = false,
      @ignored : Bool = false,
      @hint : String = "",
      @choices : Array(Tuple(Float64, String))? = Array(Tuple(Float64, String)).new
    ); end

    def refrash_val_arr_f64(val : Array(Float64))
      @value = val
    end

    # Does the field value match the possible options in choices.
    def has_value? : Bool
      if value = @value || @default
        value_list : Array(Float64) = self.choices.map { |item| item[0] }
        value.each do |elem|
          return false unless value_list.includes?(elem)
        end
      end
      true
    end
  end

  # Type of selective field with dynamic addition of elements.
  # NOTE: For simulate relationship Many-to-One.
  # NOTE: Elements are added via the `ModelName.update_dyn_field()` method.
  struct ChoiceF64DynField < DynFork::Fields::Field
    # Field type - Structure Name.
    getter field_type : String = "ChoiceF64DynField"
    # Sets the value of an element.
    property! value : Float64?
    # Specifies that multiple options can be selected at once.
    getter? multiple : Bool = false
    # Html tag: select.
    # <br>
    # _Example: [{5.0, "Title"}, {5.25, "Title 2"}]_
    getter! choices : Array(Tuple(Float64, String))?
    # To optimize field traversal in the `paladins/check()` method.
    # WARNING: It is recommended not to change.
    getter group : UInt8 = 3
    #
    # :nodoc:
    getter! default : Nil
    # :nodoc:
    getter! max : Nil
    # :nodoc:
    getter! min : Nil
    # :nodoc:
    getter! regex : Nil
    # :nodoc:
    getter! regex_err_msg : Nil
    # :nodoc:
    getter! maxlength : Nil
    # :nodoc:
    getter! minlength : Nil
    # :nodoc:
    getter maxsize : Float32 = 0
    # :nodoc:
    getter? unique : Bool = false
    # :nodoc:
    getter! input_type : Nil
    # :nodoc:
    getter media_root : String = ""
    # :nodoc:
    getter media_url : String = ""
    # :nodoc:
    getter target_dir : String = ""
    # :nodoc:
    getter! thumbnails : Nil

    # :nodoc:
    def refrash_val_i64(val : Int64); end

    # :nodoc:
    def refrash_val_bool(val : Bool); end

    # :nodoc:
    def refrash_val_str(val : String); end

    # :nodoc:
    def refrash_val_arr_str(val : Array(String)); end

    # :nodoc:
    def refrash_val_arr_i64(val : Array(Int64)); end

    # :nodoc:
    def refrash_val_arr_f64(val : Array(Float64)); end

    # :nodoc:
    def refrash_val_file_data(val : DynFork::Globals::FileData); end

    # :nodoc:
    def refrash_val_img_data(val : DynFork::Globals::ImageData); end

    # :nodoc:
    def refrash_val_datetime(val : Time); end

    # :nodoc:
    def refrash_val_date(val : Time); end

    # :nodoc:
    def extract_file_data : DynFork::Globals::FileData?; end

    def initialize(
      @label : String = "",
      @hide : Bool = false,
      @required : Bool = false,
      @disabled : Bool = false,
      @readonly : Bool = false,
      @ignored : Bool = false,
      @hint : String = ""
    ); end

    # Add data for dynamic fields from the local `@@meta` cache.
    def choices_from_json(json : String)
      @choices = Array(Tuple(Float64, String)).from_json(json)
    end

    def refrash_val_f64(val : Float64)
      @value = val
    end

    # Does the field value match the possible options in choices.
    def has_value? : Bool
      if value = @value || @default
        value_list : Array(Float64) = self.choices.map { |item| item[0] }
        return false unless value_list.includes?(value)
      end
      true
    end
  end

  # Type of selective field with dynamic addition of elements.
  # NOTE: For simulate relationship Many-to-Many.
  # NOTE: Elements are added via the `ModelName.update_dyn_field()` method.
  struct ChoiceF64MultDynField < DynFork::Fields::Field
    # Field type - Structure Name.
    getter field_type : String = "ChoiceF64MultDynField"
    # Sets the value of an element.
    property! value : Array(Float64)?
    # Specifies that multiple options can be selected at once.
    getter? multiple : Bool = true
    # Html tag: select.
    # <br>
    # _Example: [{5.0, "Title"}, {5.25, "Title 2"}]_
    getter! choices : Array(Tuple(Float64, String))?
    # To optimize field traversal in the `paladins/check()` method.
    # WARNING: It is recommended not to change.
    getter group : UInt8 = 3
    #
    # :nodoc:
    getter! default : Nil
    # :nodoc:
    getter! max : Nil
    # :nodoc:
    getter! min : Nil
    # :nodoc:
    getter! regex : Nil
    # :nodoc:
    getter! regex_err_msg : Nil
    # :nodoc:
    getter! maxlength : Nil
    # :nodoc:
    getter! minlength : Nil
    # :nodoc:
    getter maxsize : Float32 = 0
    # :nodoc:
    getter? unique : Bool = false
    # :nodoc:
    getter! input_type : Nil
    # :nodoc:
    getter media_root : String = ""
    # :nodoc:
    getter media_url : String = ""
    # :nodoc:
    getter target_dir : String = ""
    # :nodoc:
    getter! thumbnails : Nil

    # :nodoc:
    def refrash_val_i64(val : Int64); end

    # :nodoc:
    def refrash_val_f64(val : Float64); end

    # :nodoc:
    def refrash_val_bool(val : Bool); end

    # :nodoc:
    def refrash_val_str(val : String); end

    # :nodoc:
    def refrash_val_arr_str(val : Array(String)); end

    # :nodoc:
    def refrash_val_arr_i64(val : Array(Int64)); end

    # :nodoc:
    def refrash_val_file_data(val : DynFork::Globals::FileData); end

    # :nodoc:
    def refrash_val_img_data(val : DynFork::Globals::ImageData); end

    # :nodoc:
    def refrash_val_datetime(val : Time); end

    # :nodoc:
    def refrash_val_date(val : Time); end

    # :nodoc:
    def extract_file_data : DynFork::Globals::FileData?; end

    def initialize(
      @label : String = "",
      @hide : Bool = false,
      @required : Bool = false,
      @disabled : Bool = false,
      @readonly : Bool = false,
      @ignored : Bool = false,
      @hint : String = ""
    ); end

    # Add data for dynamic fields from the local `@@meta` cache.
    def choices_from_json(json : String)
      @choices = Array(Tuple(Float64, String)).from_json(json)
    end

    def refrash_val_arr_f64(val : Array(Float64))
      @value = val
    end

    # Does the field value match the possible options in choices.
    def has_value? : Bool
      if value = @value || @default
        value_list : Array(Float64) = self.choices.map { |item| item[0] }
        value.each do |elem|
          return false unless value_list.includes?(elem)
        end
      end
      true
    end
  end
end
