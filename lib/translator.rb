module Translator
  DATABASES = {
    "development" => 0,
    "test" => 1,
    "production" => 2
  }
  
  autoload :App, "translator/app"
  
  def self.store
    @store ||= Redis.new(:db => DATABASES[Rails.env.to_s])
  end
  
  def self.reload!
    Translator.store.flushdb
    I18n.backend.load_translations
  end
  
  class Backend < I18n::Backend::KeyValue
    include I18n::Backend::Memoize
    
    def initialize
      super(Translator.store)
    end
  end
end