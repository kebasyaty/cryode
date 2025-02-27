require "../../../../spec_helper"

describe DynFork::Model do
  describe "#save-(update)" do
    it "=> validation of instance of `DefaultNoNil` model", tags: "save_update" do
      # To generate a key (This is not an advertisement): https://randompasswordgen.com/
      unique_key = "924992B27o5zf40f"
      database_name = "test_#{unique_key}"
      mongo_uri = "mongodb://localhost:27017"

      # Delete database before test.
      # (if the test fails)
      mongo_client = Mongo::Client.new(mongo_uri)
      Spec::Support.delete_test_db(mongo_client[database_name])
      mongo_client.close

      # Run migration.
      m = DynFork::Migration::Monitor.new(
        database_name: database_name,
      )
      m.migrat
      #
      # HELLISH BURN
      # ------------------------------------------------------------------------
      # Create
      m = Spec::Data::DefaultNoNil.new
      flag : Bool = m.save
      m.print_err unless flag
      flag.should be_true
      m.color.value?.should eq("#ff0000")
      # Update
      m.url.value = "https://randompasswordgen.com/"
      m.phone.value = "+18004444455"
      m.ip.value = "124.255.255.255"
      m.email.value = "gene.cost@example.com"
      m.color.value = "#340000"
      m.date.value = "2024-03-23"
      m.datetime.value = "2024-03-23T07:46:00"
      m.choice_text.value = "value 2"
      m.choice_text_mult.value = ["value 2"]
      m.choice_i64.value = 10_i64
      m.choice_i64_mult.value = [5_i64, 10_i64]
      m.choice_f64.value = 5.25
      m.choice_f64_mult.value = [5.0, 5.25]
      m.file.from_path(delete: true)
      m.image.from_path("public/media/default/no_photo.jpeg")
      m.i64.value = 20_i64
      m.f64.value = 20.2
      m.bool.value = false
      #
      flag = m.save
      m.print_err unless flag
      flag.should be_true
      #
      Spec::Data::DefaultNoNil.estimated_document_count.should eq(3) # + 2 fixtures
      #
      # Param `value`
      m.hash.value.empty?.should be_false
      m.created_at.value.empty?.should be_false
      m.updated_at.value.empty?.should be_false
      DynFork::Globals.regex[:datetime_parse_reverse].matches?(m.created_at.value).should be_true
      DynFork::Globals.regex[:datetime_parse_reverse].matches?(m.updated_at.value).should be_true
      #
      m.url.value?.should eq("https://randompasswordgen.com/")
      m.text.value?.should eq("Some text")
      m.phone.value?.should eq("+18004444455")
      m.password.value?.should be_nil
      m.ip.value?.should eq("124.255.255.255")
      m.hash2.value?.should be_nil
      m.email.value?.should eq("gene.cost@example.com")
      m.color.value?.should eq("#340000")
      m.slug.value?.should eq(m.hash.value?)
      #
      m.date.value?.should eq("2024-03-23")
      m.datetime.value?.should eq("2024-03-23T07:46:00")
      #
      m.choice_text.value?.should eq("value 2")
      m.choice_text_mult.value?.should eq(["value 2"])
      m.choice_text_dyn.value?.should be_nil
      m.choice_text_mult_dyn.value?.should be_nil
      #
      m.choice_i64.value?.should eq(10_i64)
      m.choice_i64_mult.value?.should eq([5_i64, 10_i64])
      m.choice_i64_dyn.value?.should be_nil
      m.choice_i64_mult_dyn.value?.should be_nil
      #
      m.choice_f64.value?.should eq(5.25)
      m.choice_f64_mult.value?.should eq([5.0, 5.25])
      m.choice_f64_dyn.value?.should be_nil
      m.choice_f64_mult_dyn.value?.should be_nil
      #
      m.file.value.name.should eq("no_doc.odt")
      m.image.value.name.should eq("no_photo.jpeg")
      #
      m.i64.value?.should eq(20_i64)
      m.f64.value?.should eq(20.2)
      #
      m.bool.value?.should be_false
      #
      # Param `default`
      m.url.default?.should eq("https://translate.google.com/")
      m.text.default?.should eq("Some text")
      m.phone.default?.should eq("+18004444444")
      m.password.default?.should be_nil
      m.ip.default?.should eq("126.255.255.255")
      m.hash2.default?.should be_nil
      m.email.default?.should eq("john.smith@example.com")
      m.color.default?.should eq("#ff0000")
      m.slug.default?.should be_nil
      #
      m.date.default?.should eq("1970-01-01")
      m.datetime.default?.should eq("1970-01-01T00:00:00")
      #
      m.choice_text.default?.should eq("value")
      m.choice_text_mult.default?.should eq(["value"])
      m.choice_text_dyn.default?.should be_nil
      m.choice_text_mult_dyn.default?.should be_nil
      #
      m.choice_i64.default?.should eq(5_i64)
      m.choice_i64_mult.default?.should eq([5_i64])
      m.choice_i64_dyn.default?.should be_nil
      m.choice_i64_mult_dyn.default?.should be_nil
      #
      m.choice_f64.default?.should eq(5.0)
      m.choice_f64_mult.default?.should eq([5.0])
      m.choice_f64_dyn.default?.should be_nil
      m.choice_f64_mult_dyn.default?.should be_nil
      #
      m.file.default?.should eq("public/media/default/no_doc.odt")
      m.image.default?.should eq("public/media/default/no_photo.jpeg")
      #
      m.i64.default?.should eq(10_i64)
      m.f64.default?.should eq(10.2)
      #
      m.bool.default?.should be_true
      #
      FileUtils.rm_rf("public/media/uploads/files")
      FileUtils.rm_rf("public/media/uploads/images")
      # ------------------------------------------------------------------------
      #
      # Delete database after test.
      Spec::Support.delete_test_db(
        DynFork::Globals.mongo_database)
      #
      DynFork::Globals.mongo_client.close
    end
  end
end
