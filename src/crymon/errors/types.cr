require "./root"

# Errors associated with the data types.
module Crymon::Errors::Types
  # Invalid type.
  class InvalidType < Crymon::Errors::CrymonException
    def initialize(message : String)
      super
    end
  end
end
