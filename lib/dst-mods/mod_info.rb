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
      :dst_compatible, :all_clients_require_mod,
      :client_only_mod, :icon_atlas, :icon,
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

      RecSym.this(retval)
    end


  end

end

