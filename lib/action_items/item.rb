module ActionItems
    class Item
        attr_accessor :due_date
        attr_accessor :description
        attr_accessor :completed_date

        # the constructor
        #
        # @param [String] due_date The due date for the item
        # @param [String] description The description for the item
        # @param [Boolean] completed If an item is completed or not
        def initialize(due_date: nil, description: nil, completed_date: nil)
            @due_date = due_date
            @description = description
            @completed_date = completed_date
        end

        def pending?
            completed_date.nil?
        end

        # Determine wether or not item is completed
        # 
        # @return [Boolean] false Return true if task is completed
        def completed?
            !pending?
        end

        def overdue?
            if completed_date.nil?
                if due_date # completed date = nil and due_date != nil
                    return (Time.now > due_date)
                else # completed date = nil and due_date = nil
                    return false
                end
            else # completed date != nil
                if completed_date > due_date
                    return true
                else
                    return false
                end
            end
        end
    end
end
