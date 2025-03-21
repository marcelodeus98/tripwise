require './lib/services/gemini_ai_service'
require './lib/utils/prompt_util'

class Travel
    def with_dates(start_date, end_date)
      @start_date = start_date
      @end_date = end_date
      self
    end
    
    def from(origin)
      @origin = origin
      self
    end

    def to(destination)
      @destination = destination
      self
    end

    def budget(budget)
      @budget = budget
      self  
    end

    def escorts(has_escorts, quantity = 0)
        @escorts = { hasEscorts: has_escorts, quantity: quantity }
        self
    end

    def plan!
      {
        itinerary: travel_itinerary,
        violence_info: violence_info,
        best_hotel: best_hotel,
        best_way: best_way
      }
    end

    private

    def travel_itinerary
        prompt = Utils::Prompt.itineray_text(@destination, @start_date, @end_date, @budget, @escorts)
        GeminiAiService.new.call(prompt)
    end

    def violence_info
        prompt = Utils::Prompt.violence_info_text(@destination)
        GeminiAiService.new.call(prompt)
    end

    def best_hotel
        prompt = Utils::Prompt.best_hotel_text(@destination)
        GeminiAiService.new.call(prompt)
    end

    def best_way
        prompt = Utils::Prompt.best_way_text(@origin, @destination)
        GeminiAiService.new.call(prompt)
    end
end