module ActionView
  class Component < ActionView::Base
    include ActiveModel::Validations
    include Rails.application.routes.url_helpers

    delegate :render, to: :view_context

    def render_in(view_context, &block)
      self.class.compile
      @view_context = view_context
      @content = view_context.capture(&block) if block_given?
      validate!
      rendered_template
    end

    def self.compile
      @compiled ||= nil
      return if @compiled

      class_eval(
        "def rendered_template; @output_buffer = ActionView::OutputBuffer.new; " +
        ActionView::Template::Handlers::ERB.erb_implementation.new(template, trim: true).src +
        "; end"
      )

      @compiled = true
    end

  private

    attr_reader :content, :view_context
  end
end
