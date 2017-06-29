require 'ase/todo/cmp/version'
require 'ase/todo/cmp/add_task'
require 'ase/todo/cmp/in_memory'
require 'ase/todo/cmp/task'

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
      end
    end
  end
end
