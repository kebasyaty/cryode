require "../spec_helper"

describe Fields do
  describe "Fields::U32Field" do
    describe ".new" do
      it "create an instance of the UInt32 field" do
        f = Fields::U32Field.new
        f.id.should eq("")
        f.label.should eq("")
        f.field_type.should eq("U32Field")
        f.input_type.should eq("number")
        f.name.should eq("")
        f.value.should be_nil
        f.default.should be_nil
        f.placeholder.should eq("")
        f.is_disabled.should be_false
        f.is_readonly.should be_false
        f.is_hide.should be_false
        f.is_required.should be_false
        f.is_unique.should be_false
        f.max.should eq(UInt32::MAX)
        f.min.should eq(0)
        f.step.should eq(1)
        f.other_attrs.should eq("")
        f.css_classes.should eq("")
        f.hint.should eq("")
        f.warning.should eq("")
        f.errors.should eq(Array(String).new)
        f.group.should eq(11_u32)
      end
    end
  end
end
