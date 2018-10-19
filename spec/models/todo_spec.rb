require 'rails_helper'

RSpec.describe Todo, type: :model do
  let(:user) do
    user = User.new(
        email: 'someone@example.com',
        password: 'some_password_to_test',
        name: 'some_name'
    )
    user.save
    user
  end

  # Define List to be used in tests
  let(:todo) do
    todo = user.todos.new(
      title: 'New_todo_list',
      description: 'Amazing_description_:D'
    )
    todo.save
    todo
  end

  context 'creation test' do
    it 'ensures that a list can be created' do
      list = user.todos.new(
          title: 'New_list',
          description: 'Amazing_description_:D'
      ).save
      expect(list).to eq(true)
    end

    it 'ensures that a todo_list can create a task' do
      task = todo.tasks.new(title: 'Task', description: 'Amazing_description_:D', status: false).save
      expect(task).to eq(true)
    end
  end

  context 'update test' do
    it 'ensueres that a todo_list can be updated' do
      todo.update!(title: 'Updated title')
      expect(todo.title).to eq('Updated title')
    end
  end

end
