require 'csv'
require_relative 'patient'

class PatientRepository
  attr_reader :patients

  def initialize(csv_path)
    @csv_path = csv_path
    @patients = []
    @next_id = 1
    load_csv
  end

  def add(patient)
    patient.id = @next_id
    @patients << patient
    @next_id += 1
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_path, csv_options) do |row|
      row[:id]    = row[:id].to_i          # Convert column to Integer
      row[:cured] = row[:cured] == "true"  # Convert column to boolean

      # pegar o id da room
      # encontrar a room dentro do repo de rooms
      # se tiver, adicionar a room na minha row
      
      @patients << Patient.new(row)
    end
    @next_id = @patients.last.id + 1
  end
end

repo = PatientRepository.new('patients.csv')
p repo.patients

edu = Patient.new({name: 'edu', blood_type: 'B'})
repo.add(edu)
p repo.patients
