module Core
  class << self

    def root
      ::File.expand_path('../../', __FILE__)
    end

    def root_path *dirs
      ::File.join(root, *dirs)
    end

    def initialize!
      load_path
      load_init_files
      load_application
    end

    private
    def load_path
      %w[app/apis app/models].each {|folder| $: << File.expand_path("./#{folder}", root) }
    end

    def load_init_files
      Dir[File.expand_path("./config/initializers/*.rb", root)].each {|file| require file }
    end

    def load_application
      require File.expand_path("./config/all", root)
    end

  end
end

# Initialize environment
Core.initialize!
