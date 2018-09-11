module ActionItems
    class Item
        attr_accessor :due_date
        attr_accessor :description
        attr_accessor :completed

        # the constructor
        #
        # @param [String] due_date The due date for the item
        # @param [String] description The description for the item
        # @param [Boolean] completed If an item is completed or not
        def initialize(due_date: nil, description: nil, isCompleted: false)
            @due_date = due_date
            @description = description
            @completed = isCompleted
        end

        # Determine the completed status for an action item
        # 
        # @return [Boolean] false Return true if task is completed
        def isCompleted?(completed)
            if (completed.length == 0)
                return false
            end
            puts completed
        end
    end
end
