require 'spec_helper'
require 'action_items/item'

module ActionItems
    describe Item do
        describe 'constructor' do

            # ensures that the default param for
            # due_date and description are nil
            describe 'with no params' do

                # test when param for description is nil
                it 'has a nil description' do
                    new_item = Item.new
                    expect(new_item.description).to be(nil)
                end

                # test when param for due_date is nil
                it 'has a nil due date' do
                    new_item = Item.new
                    expect(new_item.due_date).to be(nil)
                end
            end

            # ensures that the default param for
            # due_date and description aren't empty
            describe 'with params' do
                let(:description) { 'the best action item ever!' }
                let(:due_date) { '10/10/2018' }

                # ensure there's a param for description
                it 'has the passed description' do
                    new_item = Item.new(description: description)
                    expect(new_item.description).to eq(description)
                end

                # ensure there's a param for due_date
                it 'has the passed due_date' do
                    new_item = Item.new(due_date: due_date)
                    expect(new_item.due_date).to eq(due_date)
                end

                # ensure there's a param for due_date and description
                it 'has the passed due date and description' do
                    new_item = Item.new(due_date: due_date, description: description)
                    expect(new_item.due_date).to eq(due_date)
                    expect(new_item.description).to eq(description)
                end
            end
        end
    end
end
