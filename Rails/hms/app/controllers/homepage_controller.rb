class HomepageController < ApplicationController
  def index
    @patients = Patient.all
  end

  def patients
    @patients = Patient.all
  end
end