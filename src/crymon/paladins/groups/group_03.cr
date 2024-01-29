module Crymon::Paladins::Groups
  # Validation of `date` type fields:
  # <br>
  # "DatField" | "DateTimeField"
  def group_03(
    field_ptr : Pointer,
    is_error_symptom_ptr : Pointer(Bool),
    is_save? : Bool,
    result_bson_ptr : Pointer(BSON)
  )
    # Get from cache Time objects - Max, min and default.
    time_objects = @@meta.not_nil![field_ptr.value.name]
    # Get current value.
    current_value : Time = (
      value = field_ptr.value.value || field_ptr.value.default
      # Validation, if the field is required and empty, accumulate the error.
      # ( The default value is used whenever possible )
      if value.nil?
        if field_ptr.value.is_required?
          self.accumulate_error(
            I18n.t(:required_field),
            field_ptr,
            is_error_symptom_ptr?
          )
        end
        (result_bson_ptr.value[field_ptr.value.name] = nil) if is_save?
        return
      end
      #
      err_msg : String? = nil
      case field_ptr.value.field_type
      when "DateField"
        begin
          value = self.date_parse(value.to_s)
        rescue ex
          err_msg = ex.message
        end
      when "DateTimeField"
        begin
          value = self.datetime_parse(value.to_s)
        rescue ex
          err_msg = ex.message
        end
      end
      unless err_msg.nil?
        self.accumulate_error(
          err_msg.not_nil!,
          field_ptr,
          is_error_symptom_ptr?
        )
        return
      end
      value
    )
    # Validation the `max` field attribute.
    if max = time_objects[:max]
      if (current_value <=> max) == 1
        err_msg = I18n.t(
          "date_not_greater_max.interpolation",
          curr_date: field_ptr.value.value || field_ptr.value.default,
          max_date: field_ptr.value.max
        )
        self.accumulate_error(
          err_msg,
          field_ptr,
          is_error_symptom_ptr?
        )
      end
    end
    # Validation the `min` field attribute.
    if min = time_objects[:min]
      if (current_value <=> min) == 1
        err_msg = I18n.t(
          "data_not_less_min.interpolation",
          curr_date: field_ptr.value.value || field_ptr.value.default,
          min_date: field_ptr.value.min
        )
        self.accumulate_error(
          err_msg,
          field_ptr,
          is_error_symptom_ptr?
        )
      end
    end
  end
end
