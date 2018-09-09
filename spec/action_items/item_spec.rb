require 'spec_helper'
require 'action_items/item'

module ActionItems
    describe Item do
        describe 'constructor' do
            describe 'with no params' do
                it 'has a nil description' do
                    new_item = Item.new
                    expect(new_item.description).to be(nil)
                end

                it 'has a nil due date' do
                    new_item = Item.new
                    expect(new_item.due_date).to be(nil)
                end
            end

            describe 'with params' do
                let(:description) { 'the best action item ever!' }
                let(:due_date) { '10/10/2018' }

                it 'has the passed description' do
                    new_item = Item.new(description: description)
                    expect(new_item.description).to eq(description)
                end

                it 'has the passed due_date' do
                    new_item = Item.new(due_date: due_date)
                    expect(new_item.due_date).to eq(due_date)
                end

                it 'has the passed due date and description' do
                    new_item = Item.new(due_date: due_date, description: description)
                    expect(new_item.due_date).to eq(due_date)
                    expect(new_item.description).to eq(description)
                end
            end
        end
    end
end
