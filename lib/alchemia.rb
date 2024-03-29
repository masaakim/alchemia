require "alchemia/version"
require "alchemia/plugins/base"
require "crass"

class Alchemia

  def self.parse(css)
    Crass.parse(css, :preserve_comments => true)
  end

  def initialize(css)
    @tree = Crass.parse(css, :preserve_comments => true)
  end

  def use(plugin)
    if plugin.class.superclass != Alchemia::Plugins::Base
      raise "Alchemia plugin must extend Alchemia::Plugins::Base"
    end
    plugin.process(@tree)
  end

  def to_s
    Crass::Parser.stringify(@tree)
  end

end
