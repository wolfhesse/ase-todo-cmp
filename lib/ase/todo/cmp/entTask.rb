module Ase
  module Todo
    module Cmp
      module Entities
        class Task
          require 'date'
          attr_accessor :id
          attr_reader :title
          attr_reader :job
          attr_reader :created_at
          attr_accessor :updated_at


          def initialize(title: '', job: '')
            @title = title
            @job = job
            @created_at = DateTime.now
          end

          def valid?
            String(title).length > 0
          end

        end
      end
    end
  end
end
