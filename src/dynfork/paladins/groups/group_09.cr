module DynFork::QPaladins::Groups
  # :nodoc:
  def group_09(
    field_ptr : Pointer(DynFork::Globals::FieldTypes),
    result_map_ptr : Pointer(Hash(String, DynFork::Globals::ResultMapType))
  ) : Nil
    # Create string for SlugField.
    # NOTE: This method is used within the `DynFork::QPaladins::Check#check` method.
    # <br>
    # <br>
    #
    raw_str_arr : Array(String) = Array(String).new
    slug_sources : Array(String) = field_ptr.value.slug_sources
    {% for field in @type.instance_vars %}
      if slug_sources.includes?({{ field.name.stringify }})
        if !(value = @{{ field }}.value? || @{{ field }}.default?).nil?
            raw_str_arr << value.to_s
        else
          msg = "Model: `#{@@full_model_name}` > " +
                "Field: `#{field_ptr.value.name}` => " +
                "`#{@{{ field }}.name}` - " +
                "This field is specified in slug_sources. " +
                "It requires a value or default value."
          raise DynFork::Errors::Panic.new msg
        end
      end
    {% end %}
    # Insert result.
    result_map_ptr.value[field_ptr.value.name] = Iom::WebSlug.slug(raw_str_arr.join("-"))
  end
end
