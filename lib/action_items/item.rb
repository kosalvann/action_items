module ActionItems
    
    require 'yaml'

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
            
            yamlFile = 'data.yaml'
        end

        # Determine if an item isn't due
        #
        # @return [Boolean]
        def pending?
            completed_date.nil?
        end

        # Determine wether or not item is completed
        # 
        # @return [Boolean] false Return true if task is completed
        def completed?
            !pending?
        end

        # Determine if an item is overdue
        #
        # @return [Boolean]
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

        # Ensure description, completed date
        # and due date isn't nil
        #
        # @return [Boolean]
        def valid?
            description_valid? &&
            completed_date_valid? &&
            due_date_valid?
        end

        # Ensure description isn't nil
        #
        # @return [Boolean]
        def description_valid?
            !description.nil?
        end

        # Ensure completed date isn't nil
        #
        # @return [Boolean]
        def completed_date_valid?
            !completed_date.nil?
        end

        # Ensure due date isn't nil
        #
        # @return [Boolean]
        def due_date_valid?
            !due_date.nil?
        end

        # Save data to yaml
        #
        # @return
        def save_data
            yaml = File.open(yamlFile, 'w')
            yaml.write hash.to_yaml
            yaml.close
        end
    end
end
