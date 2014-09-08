require "alchemia/version"
require "crass"

class Alchemia

  def self.parse(css)
    Crass.parse(css, :preserve_comments => true)
  end

  def initialize(css)
    @tree = self.parse(css)
  end

  def use(plugin)
    plugin.process(@tree)
  end

  def to_s
    Crass::Parser.stringify(@tree)
  end

end
