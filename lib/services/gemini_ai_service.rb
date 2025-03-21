require 'gemini_api_ruby'
require 'dotenv'

Dotenv.load(File.expand_path('../../.env', __dir__))

class GeminiAiService
    def initialize
        @client = GeminiApiRuby::Client.new(api_key: ENV['GEMINI_API_KEY'])
    end

    def call(prompt)
        response = @client.generate_content(prompt)

        cleaned_response(response)

        return cleaned_response(response)
    end

    private

    def cleaned_response(response)
        cleaned_text = response.gsub("\n", " ").squeeze(" ").strip

        formatted_text = cleaned_text
          .gsub(/\*\*(.*?)\*\*/, '\1')
          .gsub(/\*(.*?)\*/, '\1')    
          .gsub(/\s+/, ' ')           
          .strip                      
  
        formatted_text
    end      
end