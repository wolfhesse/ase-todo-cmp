require_relative 'cmp/version'
require_relative 'cmp/add_task'
require_relative 'cmp/clear_task.rb'
require_relative 'cmp/in_memory'
require_relative 'cmp/task'

module Ase
  module Todo
    module Cmp
      class << self
        attr_accessor :repo

        def configure
          yield self
        end

        def repo
          @repo ||= TasksRepository::InMemory.new
        end

        def add_task(title)
          UseCases::AddTask.add(title)
        end

        def clear
          UseCases::ClearTask.execute
        end
      end
    end
  end
end
