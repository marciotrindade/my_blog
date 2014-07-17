module ActionView
  module Helpers
    class FormBuilder

      def error_class(method)
        "ls-error" if @object.errors[method].present?
      end

      def errors_for(method)
        if @object.errors[method].present?
          @template.content_tag :small, class: "ls-help-message" do
            @object.errors[method].join('<br>').html_safe
          end
        end
      end

    end
  end
end
