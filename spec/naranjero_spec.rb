# -*- coding: utf-8 -*-
require 'spec_helper'
require './lib/naranjero.rb'

describe Naranja::Naranjero do
    before :all do
        @naranjero = Naranja::Naranjero.new
    end
    
    it "La clase debe tener un metodo que devuelva la altura actual del naranjero" do
      expect(@naranjero).to respond_to(:altura)
    end
    
    it "La clase debe tener un metodo que devuelva la edad actual del naranjero" do
      expect(@naranjero).to respond_to(:edad)
    end
    
    it "La clase debe tener un metodo que devuelva el numero de naranjas producidas este año" do
      expect(@naranjero).to respond_to(:numeroNaranjas)
    end
    
    it "La clase debe tener un metodo que aumente la edad del naranjero un año y todo lo que ello conlleva" do
      expect(@naranjero).to respond_to(:uno_mas)
    end
    
    it "La clase debe tener un metodo que haga que el recolector intente recoger una naranja" do
      expect(@naranjero).to respond_to(:recolectar_una)
    end
    
    it "La clase debe tener un metodo que cree los threads que representan el crecimiento y la recoleccion" do
      expect(@naranjero).to respond_to(:run)
    end
end

    
  