class Alchemia
  module Plugins
    class Base

      def process
        nil
      end

      def selectors(tree)
        selectors = []
        tree.each do |t|
          if is_rule(t)
            selectors.push t[:selector][:tokens][1][:raw]
            selectors.push t[:selector][:value]
          end
        end
        selectors
      end

      def properties(tree, selector)
        properties = []
        tree.each do |t|
          if is_rule(t)
            t[:children].each do |child|
              if is_property(child)
                properties.push child[:name]
              end
            end
          end
        end
        ptoperties
      end


      private

      def is_rule(node)
        true if node[:node] == :style_rule
      end

      def is_property(node)
        true if node[:property] == :property
      end

    end
  end
end
