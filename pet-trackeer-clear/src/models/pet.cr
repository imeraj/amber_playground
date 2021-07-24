class Pet
  include Clear::Model

  column id : Int64, primary: true, presence: false
  column name : String
  column breed : String
  column age : Int32

  timestamps
end
