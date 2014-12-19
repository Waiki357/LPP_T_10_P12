# -*- coding: utf-8 -*-
#require 'thread'

module Naranja
  
    class Naranjero
        EDAD_MUERTE = 7
        EDAD_PRODUCCION = 3
        INCREMENTO_ANUAL = 10
        CRECIMIENTO_ANUAL = 1

        #attr_reader :altura, :edad, :numeroNaranjas
    
        def initialize
            @altura = 0
            @edad = 0
            @numeroNaranjas = 0
            @naranjasRecolectadas = 0
            @contador_rec = 0
            @contador_cre = 0
        end
    
        def altura
            return @altura
        end
    
        def edad
            return @edad
        end
    
        def numeroNaranjas
            return @numeroNaranjas
        end
        
        def uno_mas
            if (@edad == EDAD_MUERTE)
                print "Sorry, the Orange tree is dead\n"
            else
                @edad += 1
                @altura += CRECIMIENTO_ANUAL
                if @edad >= EDAD_PRODUCCION
                    #@numeroNaranjas = (rand(edad..EDAD_MUERTE) * Math.log(edad) * INCREMENTO_ANUAL).to_i
                    @numeroNaranjas = rand(0..@edad * INCREMENTO_ANUAL).to_i
                else
                    @numeroNaranjas = 0
                end
                print "Age increaser increased the age. (#{edad}). It has produced #{numeroNaranjas} oranges.\n"
            end
        end
    
        def recolectar_una
            if (@edad == EDAD_MUERTE)
                print "Sorry, the Orange tree is dead.\n"
                print "#{@naranjasRecolectadas} oranges have been picked from this tree in total.\n"
            else
                if (@orange_count == 0)
                    print "Sorry, no Oranges to pick\n"
                else
                    @naranjasRecolectadas += 1
                    @numeroNaranjas -= 1
                    print "The Orange is delicious\n"
                end
            end
        end

        def run
            m = Mutex.new
            c = ConditionVariable.new
            
            recolectar = Thread.new do
                until (@edad == EDAD_MUERTE)
                    @contador_rec += 1
                    m.synchronize {
                        if @contador_rec > @contador_cre then
                            c.wait(m)
                        else
                            c.signal
                        end
                    }
                    sleep_time = rand(0..3)
                    print "Orange picker going to sleep for #{sleep_time} zzZZ\n"
                    sleep(sleep_time)
                    print "Orange picker woke up after sleeping for #{sleep_time}\n"
                    recolectar_una
                    print "Orange picker waiting patiently...\n"
                end
            end
        
            crecer = Thread.new do
                until (@edad == EDAD_MUERTE)
                    @contador_cre += 1
                    m.synchronize {
                        if @contador_cre > @contador_rec then
                            c.wait(m)
                        else
                            c.signal
                        end
                    }
                    sleep_time = rand(2..6)
                    print "Age increaser going to sleep for #{sleep_time} zzZZ\n"
                    sleep(sleep_time)
                    print "Age increaser woke up after sleeping for #{sleep_time}\n"
                    uno_mas
                end
                recolectar.kill
                recolectar_una
            end
        
            crecer.join
            recolectar.join

        end
    end
end