require "./aliases"
require "./types"
require "./date"

# Global storage for data cache.
module DynFork::Globals
  include DynFork::Globals::Aliases
  include DynFork::Globals::Types
  include DynFork::Globals::Date

  # Mongo client caching.
  class_property! mongo_client : Mongo::Client
  # Mongo database caching.
  class_property! mongo_database : Mongo::Database
  # Database name.
  class_property database_name : String = ""
  # Super collection name caching.
  # <br>
  # <br>
  # Super collection is used for:
  # - _Store technical data for Models migration into a database._
  # - _Store dynamic field data for simulate relationship Many-to-One and Many-to-Manyю._
  class_getter super_collection_name = "SUPER_COLLECTION"
  # Regex caching.
  class_getter regex : CacheRegexType = NamedTuple.new(
    database_name: /^[a-zA-Z][-_a-zA-Z0-9]{0,59}$/,
    service_name: /^[A-Z][a-zA-Z0-9]{0,24}$/,
    model_name: /^[A-Z][a-zA-Z0-9]{0,24}$/,
    get_type_marker: /(Text|U32|I64|F64)/,
    date_parse: /^(?P<d>[0-9]{2})[-\/\.](?P<m>[0-9]{2})[-\/\.](?P<y>[0-9]{4})$/,
    date_parse_reverse: /^(?P<y>[0-9]{4})[-\/\.](?P<m>[0-9]{2})[-\/\.](?P<d>[0-9]{2})$/,
    datetime_parse: /^(?P<d>[0-9]{2})[-\/\.](?P<m>[0-9]{2})[-\/\.](?P<y>[0-9]{4})(?:T|\s)(?<t>[0-9]{2}:[0-9]{2}:[0-9]{2})/,
    datetime_parse_reverse: /^(?P<y>[0-9]{4})[-\/\.](?P<m>[0-9]{2})[-\/\.](?P<d>[0-9]{2})(?:T|\s)(?<t>[0-9]{2}:[0-9]{2}:[0-9]{2})/,
    color_code: /^(?:#|0x)(?:[a-f0-9]{3}|[a-f0-9]{6}|[a-f0-9]{8})\b|(?:rgb|hsl)a?\([^\)]*\)$/i,
    password: /^[-._!"`'#%&,:;<>=@{}~\$\(\)\*\+\/\\\?\[\]\^\|a-zA-Z0-9]+$/,
    phone_number: /^\+?\d{1,4}?[-.\s]?\(?\d{1,3}?\)?[-.\s]?\d{1,4}[-.\s]?\d{1,4}[-.\s]?\d{1,9}$/,
  )
end
