require 'spec_helper'

describe Alchemia do
  it 'has a version number' do
    expect(Alchemia::VERSION).not_to be nil
  end

  css = ".selector { padding: 10px; }"

  it 'Alchemia::parse(css)' do
    expect(Alchemia::parse(css))
    .to eq(
      [{:node=>:style_rule, :selector=>{:node=>:selector, :value=>".selector", :tokens=>[{:node=>:delim, :pos=>0, :raw=>".", :value=>"."}, {:node=>:ident, :pos=>1, :raw=>"selector", :value=>"selector"}, {:node=>:whitespace, :pos=>9, :raw=>" "}]}, :children=>[{:node=>:whitespace, :pos=>11, :raw=>" "}, {:node=>:property, :name=>"padding", :value=>"10px", :children=>[{:node=>:whitespace, :pos=>20, :raw=>" "}, {:node=>:dimension, :pos=>21, :raw=>"10px", :repr=>"10", :type=>:integer, :unit=>"px", :value=>10}], :important=>false, :tokens=>[{:node=>:ident, :pos=>12, :raw=>"padding", :value=>"padding"}, {:node=>:colon, :pos=>19, :raw=>":"}, {:node=>:whitespace, :pos=>20, :raw=>" "}, {:node=>:dimension, :pos=>21, :raw=>"10px", :repr=>"10", :type=>:integer, :unit=>"px", :value=>10}, {:node=>:semicolon, :pos=>25, :raw=>";"}]}, {:node=>:whitespace, :pos=>26, :raw=>" "}]}]
    )
  end

  alchemia = Alchemia.new(css)

  it 'Alchemia.use(plugin)' do
  end

  it 'When plugin do not inherit Alchemia::Plugins::Base, rase error' do
    class TestPlugin
      def process
      end
    end
    plugin = TestPlugin.new

    proc{alchemia.use(plugin)}.should raise_error
  end

  it 'Alchemia.to_s' do
    expect(alchemia.to_s).to eq(
      ".selector { padding: 10px; }"
    )
  end
end
