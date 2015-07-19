require_relative '__module__'

require 'ruby-lua'

module DST::Mods

  module ModInfo
    # TODO: Figure out a better way to do this
    Keys = [
      :name, :description, :author, :version,
      :forumthread, :api_version, :priority,
      :dst_compatible, :all_clients_require_mod,
      :client_only_mod, :icon_atlas, :icon,
      :configuration_options
    ]


    class << self

      def extract_lua_vars(lua)
        retval = {}
        Keys.each do |k|
          retval[k] = lua.var(true, k.to_s)
        end
        retval
      end


      def load(path)
        lua = Language::Lua.new
        lua.load(path)
        extract_lua_vars(lua)
      end


    end


  end

end

