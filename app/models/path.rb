class Path < ApplicationRecord
	has_many :operator_registers
	has_many :activities, :through => :operator_registers
end
