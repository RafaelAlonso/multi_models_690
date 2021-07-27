class Patient
  attr_reader :name
  attr_accessor :room, :id

  # PROPRIEDADE / CARACTERISTICA / ESTADO
  # - name
  # - cured
  # - blood_type
  def initialize(attrs = {})
    @id = attrs[:id]
    @name = attrs[:name]
    @cured = attrs[:cured] || false
    @blood_type = attrs[:blood_type]
  end

  # COMPORTAMENTO
  def cure!
    @cured = true
  end
end

# gui = Patient.new({ name: 'gui', blood_type: 'A+' })
# p gui

# lucas = Patient.new({  cured: true, name: 'lucas' })
# p lucas

# Patient.new({})