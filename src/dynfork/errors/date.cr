require "./root"

# Errors associated with the date and time.
module DynFork::Errors::Date
  # Invalid date.
  class InvalidDate < DynFork::Errors::DynForkException
    def initialize
      super(I18n.t(:invalid_date).colorize.fore(:red).mode(:bold))
    end
  end

  # Invalid date and time.
  class InvalidDateTime < DynFork::Errors::DynForkException
    def initialize
      super(I18n.t(:invalid_datetime).colorize.fore(:red).mode(:bold))
    end
  end
end
