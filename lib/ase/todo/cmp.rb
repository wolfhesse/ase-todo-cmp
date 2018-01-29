require_relative 'cmp/version'
require_relative 'cmp/ucAddTask'
require_relative 'cmp/ucClearTask.rb'
require_relative 'cmp/reposInMemory'
require_relative 'cmp/entTask'

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
