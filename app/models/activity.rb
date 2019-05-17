class Activity < ApplicationRecord
	has_many :operator_registers
	has_many :paths, :through => :operator_registers
end
