require_relative '__module__'

require_relative 'mod_info'

module DST::Mods

  class Mod

    attr_reader :path, :info

    def initialize(path:, info:)
      @path = path
      @info = info
    end

    def self.load!(path)
      info_path = File.join(path, "modinfo.lua")
      self.new(
        path: File.absolute_path(path),
        info: ModInfo.load!(info_path)
      )
    end


    # For convenience, we'll define a shortcut method for
    # each of the ModInfo::Keys.
    ModInfo::Keys.each do |k|
      define_method k do
        info[k]
      end
    end

  end

end
