module All
  class << self
    def initialize!
      load_models
      load_apis
    end

    private

    def load_models
      Dir[Core.root_path("app/models/*.rb")].each {|model| require model }
    end


    def load_apis
      Dir[Core.root_path("app/controllers/**/*.rb")].each {|api| require api }
    end

  end
end

All.initialize!
