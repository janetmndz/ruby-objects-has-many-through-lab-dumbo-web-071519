require "pry"
class Patient
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
        
    end

    def self.all
        @@all
    end

    def new_appointment(doctor, date)
        new_app = Appointment.new(date, self, doctor)
        new_app
    end

    def appointments
        Appointment.all.select do |app|
            app.patient == self
        end
    end

    def doctors
        self.appointments.map do |app|
            app.doctor
        end
    end
end