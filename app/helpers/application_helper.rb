module ApplicationHelper
# Retourner un titre basé sur la page.
    def titre
        base_titre = "Simple App du Tutoriel Ruby on Rails"
        if @titre.nil?
            base_titre
        else
            "#{base_titre} | #{@titre}"
        end
    end

    def logo
        image_tag("logo_sample_app.png", :alt => "Application Exemple", :class => "round")

        #"/assets/logo_sample_app.png"
    end
end
