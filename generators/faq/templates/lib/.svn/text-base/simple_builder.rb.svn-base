# This allows the overriding of form methods
# to make generating forms very easy!
class SimpleBuilder < ActionView::Helpers::FormBuilder

  (field_helpers - %w(check_box radio_button hidden_field) + %w(select)).each do |selector|
    src = <<-END_SRC
    def #{selector}(field, options = {})
      @template.content_tag("p",
      @template.content_tag("label", field.to_s.humanize + ":") +
      @template.content_tag("br") +
      super)
    end
    END_SRC
    class_eval src, __FILE__, __LINE__
  end

end
