require_relative '__module__'

require 'recsym'
require 'ruby-lua'

module DST::Mods

  module ModInfo

    # The variables have a special meaning when used inside
    # of a modinfo.lua file.  So, let's grab them!
    Keys = [
      :name, :description, :author, :version,
      :forumthread, :api_version, :priority,

      :dst_compatible,
      :dont_starve_compatible,
      :reign_of_giants_compatible,


      :all_clients_require_mod,

      :client_only_mod,


      :icon_atlas, :icon,

      :server_filter_tags,
      :configuration_options
    ]


    # Loads the specified modinfo.lua file and returns
    # the keys that we care about.
    def self.load!(path)
      lua = Language::Lua.new
      lua.load(path)

      retval = {}
      Keys.each do |k|
        retval[k] = lua.var(true, k.to_s)
      end

      # Convenience: this way, downstream code won't
      # need to check for nil.
      retval[:configuration_options] ||= {}

      RecSym.this(retval)
    end


  end

end

