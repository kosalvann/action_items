module ActionItems
    class Item
        attr_accessor :due_date
        attr_accessor :description

        # the constructor
        #
        # @param [String] due_date The due date for the item
        # @param [String] description The description for the item
        def initialize(due_date: nil, description: nil)
            @due_date = due_date
            @description = description
        end

    end
end
