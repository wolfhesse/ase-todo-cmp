module Ase
  module Todo
    module Cmp
      module TasksRepository
        class InMemory
          def initialize
            @tasks = {}
            @id = 100
          end

          def clear
            @tasks = {}
              # // @id bleibt gleich
          end

          def persist(task)
            @id += 1
            task.id = @id
            task.updated_at = DateTime.now

            tasks[@id] = task
            task
          end

          def count
            tasks.length
          end

          def experIncrementId
            ## experimental features
            @id += 1
          end

          def experId
            @id
          end
          private

          attr_reader :tasks
        end
      end
    end
  end
end
