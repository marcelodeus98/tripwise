module Utils
    class Prompt
        def self.itineray_text(destination, start_date, end_date, budget, escorts)
            escorts_text = escorts[:hasEscorts] ? "com #{escorts[:quantity]} acompanhante(s)" : "sozinho"
            "Estou viajando para #{destination} entre #{start_date} até #{end_date}, #{escorts_text}. Com #{budget} de orçamento.
            Não deverá realizar perguntas, apenas gerar o roteiro."
        end

        def self.violence_info_text(destination)
            "Estou viajando para #{destination}. Me forneça informações sobre a seguranca da cidade, como quais sao os pontos de risco, quais sao os pontos de segurança."
        end

        def self.best_way_text(origin, destination)
            "Moro em #{origin} e pretendo viajar para #{destination}, qual a forma mais eficiente de realizar/chegar no destino ?"
        end

        def self.best_hotel_text(destination)
            "Qual o melhor hotel para ficar em #{destination}?"
        end
    end
end
