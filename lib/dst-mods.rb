
require 'dst-mods/mod_info'
require 'dst-mods/mod'

module DST

  module Mods


    class << self

      def each_in_directory(d)
        return enum_for(__callee__, d) unless block_given?

        Dir[File.join(d, "*")].each do |path|
          begin
            m = Mod.load!(path)
          rescue
            # Not a valid module.  Move on.
          else
            yield m
          end
        end
      end
      alias_method :each_in_folder, :each_in_directory


      def in_directory(d)
        each_in_directory(d).to_a
      end
      alias_method :in_folder, :in_directory

    end

  end

end
