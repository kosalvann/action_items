require 'spec_helper'
require 'action_items/item'

module ActionItems
    describe Item do
        describe '#initialize' do
            # ensure that the default param for
            # due_date and description are nil
            describe 'with no params' do

                let(:new_item) { Item.new }

                # test when param for description is nil
                it 'has a nil description' do
                    expect(new_item.description).to be(nil)
                end

                # test when param for due_date is nil
                it 'has a nil due date' do
                    expect(new_item.due_date).to be(nil)
                end

                it 'has a nil completed_date' do
                    expect(new_item.completed_date).to be_nil
                end
            end

            # ensure that the default param for
            # due_date and description aren't empty
            describe 'with params' do
                let(:description) { 'the best action item ever!' }
                let(:due_date) { '10/10/2018' }
                let(:completed_date) { '10/08/2018' }

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

                it 'has the passed completed date' do
                    new_item = Item.new(completed_date: completed_date)
                    expect(new_item.completed_date).to eq(completed_date)
                end
            end

            # testing the status completed for an item
            describe '#completed?' do
                # ensure that the default boolean is false
                it 'has false as default' do
                    new_item = Item.new
                    expect(new_item.completed?).to be(false)
                    # expect(new_item).not_to be_completed
                    # expect(new_item).to_not be_completed
                end
            end

            describe '#pending?' do
                # ensure that the default boolean is true
                it 'has true as default' do
                    new_item = Item.new
                    expect(new_item.pending?).to be(true)
                    # expect(new_item).not_to be_pending
                    # expect(new_item).to_not be_pending
                end
            end

            describe '#overdue?' do

                before(:all) do
                    # do some setup only once before all test
                    # puts "before:all\n"
                end

                before(:each) do
                    # before() is same
                    # do some setup before *each* test
                    # puts "before:each\n"
                end

                after(:all) do
                    # do some setup only once after all test
                    # puts "after:all\n"
                end

                after(:each) do
                    # do some setup after *each* test
                    # puts "after:each\n"
                end

                around(:each) do |example|
                    # do some setup before *each* test
                    # puts "around:before:each\n"
                    example.run
                    # do some setup only after *each* test
                    # puts "around:after:each\n"
                end
                
                let(:new_item) do
                    Item.new(due_date: due_date, completed_date: completed_date)
                end

                context 'when due date is greater than completed date' do
                    let(:due_date) { '10/10/2018' }
                    let(:completed_date) { '10/08/2018' }

                    it 'is not overdue' do
                        # the following line is the same as this:
                        # expect(new_item.overdue?).to be(false)
                        expect(new_item).not_to be_overdue
                    end
                end

                context 'when due date is less than completed date' do
                    let(:due_date) { '09/07/2018' }
                    let(:completed_date) { '10/08/2018' }

                    it 'is overdue' do
                        expect(new_item).to be_overdue
                    end
                end

                context 'when due date is also completed date' do
                    let(:due_date) { '01/01/2018'}
                    let(:completed_date) { due_date }
                    
                    it 'is not overdue' do
                        expect(new_item).to_not be_overdue
                    end
                end
            end
        end
    end
end
