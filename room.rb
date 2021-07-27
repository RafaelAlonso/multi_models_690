require_relative 'patient'

class Room
  attr_reader :patients

  # PROPRIEDADES
  # - patients
  # - capacity
  # - room_number
  def initialize(attrs = {})
    @patients = []
    @capacity = attrs[:capacity]
    @room_number = attrs[:room_number]
  end

  def add_patient(patient)
    # verifica a capacidade
    if @patients.size < @capacity
      # adiciona o patient se tiver espaço
      @patients << patient

      # falar que o patient esta na room atual
      # obs.: self eh a instancia que chamou o '#add_patient'
      patient.room = self
    end
  end
end

room1 = Room.new({ capacity: 5, room_number: 10 })

pat = Patient.new({name: 'Pat', cured: false, blood_type: 'O-'})

room1.add_patient(pat)

p room1.patients[0].name

p pat.room.room_number
