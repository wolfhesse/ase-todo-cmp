module Ase
  module Todo
    module Cmp
      module Entities
        class Task
          attr_accessor :id
          attr_reader :title


          def initialize(title: '')
            @title = title
          end

          def valid?
            String(title).length > 0
          end

        end
      end
    end
  end
end
