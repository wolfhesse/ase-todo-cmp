require_relative 'cmp/version'
require_relative 'cmp/ucAddTask'
require_relative 'cmp/ucClearTasks.rb'
require_relative 'cmp/reposInMemory'
require_relative 'cmp/entTask'

module Ase
  module Todo
    module Cmp
      ### the 'component api'
      class << self
        attr_accessor :repo
        attr_accessor :configuration

        def configure
          @configuration ||= {}
          puts("inside #{Ase::Todo::Cmp}.configure() w/ configuration #{@configuration}")
          yield self
          puts("going out of #{Ase::Todo::Cmp}.configure() w/ configuration #{@configuration}")
        end

        def repo
          @repo ||= TasksRepository::InMemory.new
        end

        def add_task(title, job = nil)
          # maybe job is configured
          job ||= @configuration[:job]
          UseCases::AddTask.execute(title, job)
        end

        def clear
          UseCases::ClearTasks.execute
        end
      end
    end
  end
end
