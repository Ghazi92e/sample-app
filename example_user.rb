class User
    attr_accessor :nom, :email #accesseur d'attribut, crée les methodes obteneur(get) et assigneur(set)
  
    def initialize(attributes = {})
      @nom  = attributes[:nom]
      @email = attributes[:email]
    end
  
    def formatted_email
      "#{@nom} <#{@email}>"
    end
end