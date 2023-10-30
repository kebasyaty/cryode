require "./field"

module Crymon
  module Fields
    # A field for entering a date in the format yyyy-mm-dd.
    # NOTE: Example: 1970-01-01
    struct DateField < Crymon::Fields::Field
      # Field type - Structure Name.
      getter field_type : String = "DateField"
      # Html tag: input type="date".
      getter input_type : String = "date"
      # Sets the value of an element.
      # NOTE: Example: 1970-01-01
      property value : String | Nil = nil
      # Value by default.
      # NOTE: Example: 1970-01-01
      getter default : String | Nil
      # Displays prompt text.
      getter placeholder : String
      # The top value for entering a date.
      getter max : String
      # The lower value for entering a date.
      getter min : String
      # The unique value of a field in a collection.
      getter is_unique : Bool
      # Additional explanation for the user.
      getter hint : String
      # To optimize field traversal in the `paladins/check()` method.
      # WARNING: It is recommended not to change.
      getter group : UInt8 = 3

      def initialize(
        @label : String = "",
        @default : String | Nil = nil,
        @placeholder : String = "",
        @max : String = "",
        @min : String = "",
        @is_hide : Bool = false,
        @is_unique : Bool = false,
        @is_required : Bool = false,
        @is_disabled : Bool = false,
        @is_readonly : Bool = false,
        @other_attrs : String = "",
        @css_classes : String = "",
        @hint : String = "Format: yyyy-mm-dd"
      ); end
    end
  end
end
