require "alchemia/version"
require "crass"

class Alchemia

  def initialize(css)
    @tree = Crass.parse(css, :preserve_comments => true)
  end

  def use(plugin)
    plugin.process(@tree)
  end

  def to_s
    Crass::Parser.stringify(@tree)
  end

end
