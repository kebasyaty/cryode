require "../../../../../spec_helper"

describe DynFork::Model do
  describe ".find_many_to_json" do
    it "=> find documents", tags: "find_many" do
      # Init data for test.
      #
      # To generate a key (This is not an advertisement): https://randompasswordgen.com/
      unique_app_key = "23316i6H423N69L3"
      database_name = "test_#{unique_app_key}"
      mongo_uri = "mongodb://localhost:27017"

      # Delete database before test.
      # (if the test fails)
      Spec::Support.delete_test_db(
        Mongo::Client.new(mongo_uri)[database_name])

      # Run migration.
      DynFork::Migration::Monitor.new(
        "app_name": "AppName",
        "unique_app_key": unique_app_key,
        "database_name": database_name,
        "mongo_uri": mongo_uri,
        "model_list": {
          Spec::Data::DefaultNoNil,
        }
      ).migrat
      #
      # HELLISH BURN
      # ------------------------------------------------------------------------
      json : String = Spec::Data::DefaultNoNil.find_many_to_json
      json.empty?.should be_true
      #
      m = Spec::Data::DefaultNoNil.new
      m.save
      m = Spec::Data::DefaultNoNil.new
      m.save
      Spec::Data::DefaultNoNil.count_documents.should eq(2)
      Spec::Data::DefaultNoNil.estimated_document_count.should eq(2)
      #
      json = Spec::Data::DefaultNoNil.find_many_to_json
      json.empty?.should be_false
      #
      FileUtils.rm_rf("assets/media/files")
      FileUtils.rm_rf("assets/media/images")
      # ------------------------------------------------------------------------
      #
      # Delete database after test.
      Spec::Support.delete_test_db(
        DynFork::Globals.cache_mongo_database)
      #
      DynFork::Globals.cache_mongo_client.close
    end
  end
end
