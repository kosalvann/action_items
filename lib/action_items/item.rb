module ActionItems
    class Item
        attr_accessor :due_date
        attr_accessor :description

        def initialize(due_date: nil, description: nil)
            @due_date = due_date
            @description = description
        end

    end
end
