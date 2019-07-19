require "pry"
class Doctor
    @@all = []

    attr_accessor :name

    def initialize(name)
        @name = name
        @@all << self
        
    end

    def self.all
        @@all
    end

    def new_appointment(patient, date)
        new_app = Appointment.new(date, patient, self)
        new_app
    end

    def appointments
        Appointment.all.select do |app|
            app.doctor = self
        end
    end

    def patients
        self.appointments.map do |app|
            app.patient
        end
    end
end