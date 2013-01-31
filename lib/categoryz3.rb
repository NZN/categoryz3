require "categoryz3/engine"
require "categoryz3/config"
require "categoryz3/categorizable"
require "categoryz3/validators/child_item_category_validator"
require "categoryz3/validators/parent_category_validator"

module Categoryz3
  mattr_reader :config
  @@config = Config.new

  def self.setup(&block)
    config = Config.new
    yield config
    @@config = config
  end
end
