class Alchemia
  module Plugins
    class Base

      def initialize(tree)
        @tree = tree
      end

      def process
        nil
      end

      def all_selectors
        selectors = []
        @tree.each do |t|
          if is_rule(t)
            selectors.push t[:selector][:value]
          end
        end
        selectors
      end

      def selector(selector)
        @tree.each do |t|
          if is_rule(t)
            if selector == t[:selector][:value]
              return t[:selector][:tokens][1][:raw]
            end
          end
        end
      end

      def all_properties(selector)
        properties = []
        @tree.each do |t|
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

      def is_child(child)
        true if child[:node] == :property
      end

    end
  end
end
