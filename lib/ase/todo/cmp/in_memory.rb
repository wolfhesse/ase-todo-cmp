module Ase
  module Todo
    module Cmp
      module TasksRepository
        class InMemory
          def initialize
            @tasks = {}
            @id = 0
          end

          def persist(task)
            @id += 1
            task.id = @id
            tasks[@id] = task
            task
          end

          def count
            tasks.length
          end

          private

          attr_reader :tasks
        end
      end
    end
  end
end
