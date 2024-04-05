require "../../../spec_helper"

describe DynFork::Model do
  describe "self.manager_dyn_unit" do
    it "=> call Model class method", tags: "unit" do
      unit = DynFork::Globals::Unit.new(
        field_name: "field_name",
        title: "Title",
        value: "value",
        delete: true
      )
      Spec::Data::UnitModel.unit_manager(unit).should be_nil
    end
  end
end
