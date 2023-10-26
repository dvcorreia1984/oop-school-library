require_relative 'person'

class Student < Person
  attr_reader :classroom
  attr_accessor :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true, classroom: '')
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'classroom' => @classroom,
      'age' => @age,
      'name' => @name,
      'parent_permission' => @parent_permission
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['classroom'], object['age'], object['name'], object['parent_permission'])
  end
end
