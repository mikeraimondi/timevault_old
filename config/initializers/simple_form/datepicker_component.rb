module SimpleForm
  module Components
    # Needs to be enabled in order to do automatic lookups
    module Datepicker
      # Name of the component method
      def addon
       '<i data-date-icon="icon-calendar" data-time-icon="icon-time" ></i>'.html_safe
      end

    end
  end
end

SimpleForm::Inputs::Base.send(:include, SimpleForm::Components::Datepicker)
