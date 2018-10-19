require 'rails_helper'

RSpec.describe Task, type: :model do
# Define User to be used in tests
  let(:user) do
    user = User.new(
        email: 'someone@example.com',
        password: 'some_password_to_test',
        name: 'some_name'
    )
    user.save
    user
  end

  # Define todo_list to be used in tests
  let(:todo) do
    todo = user.todos.new(
        title: 'New_todo_todo',
        description: 'Amazing_description_:D'
    )
    todo.save
    todo
  end

  # Define todo_list to be used in tests
  let(:task) do
    task = todo.tasks.new(
        title: 'New task',
        status: false
    )
    task.save
    task
  end

  context 'validation test' do
    it 'ensures pesence of title' do
      task = todo.tasks.new(
          status: false
      ).save
      expect(task).to eq(false)
    end
  end

  context 'creation test' do
    it 'ensures that a task can be created' do
      task = todo.tasks.new(
          title: 'New task',
          status: false
      ).save
      expect(task).to eq(true)
    end
  end

  context 'modification test' do
    it 'ensures that a task can be status' do
      task = todo.tasks.new(
          title: 'New task',
          status: false
      )
      task.save
      task.status = true
      task.save
      expect(task.status).to eq(true)
    end

    it 'ensures that a task can be status' do
      task = todo.tasks.new(
          title: 'New task',
          status: true
      )
      task.save
      task.status = false
      task.save
      expect(task.status).to eq(false)
    end

    it 'ensures that a task can title' do
      task = todo.tasks.new(
          title: 'New task',
          status: false
      )
      task.save
      task.title= 'New title'
      task.save
      expect(task.title).to eq('New title')
    end
  end
end
