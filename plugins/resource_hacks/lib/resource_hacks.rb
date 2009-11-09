module ActionController
  module Resources
    class Resource
    
      def member_path_with_override
        options[:member_path] || member_path_without_override
      end
      alias_method_chain :member_path, :override

      def nesting_path_prefix_with_override
        options[:nested_member_path] || options[:member_path] || nesting_path_prefix_without_override
      end
      alias_method_chain :nesting_path_prefix, :override
    end
  end
end
