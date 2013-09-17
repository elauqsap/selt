# Metaprogramming example to add history to 
# attr accessor. Stores all the values the
# accessor has been set to in an array. A
# reader allows the user to view the history.
class Class

  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s   			# make sure it's a string
    attr_reader attr_name        			# create the attribute's getter
    attr_reader attr_name+"_history" 		# create bar_history getter    
    class_eval %Q{
            def #{attr_name}=(attr_name)
                if (!defined? @#{attr_name}_history)
                    @#{attr_name}_history.push(@#{attr_name})
                end
                @#{attr_name} = attr_name
                @#{attr_name}_history.push(attr_name)
            end
        }
  end
end
