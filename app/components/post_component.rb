class PostComponent < ActionView::Component
  validates :post, presence: true

  def initialize(post:)
    @post = post
  end

  def self.template
    <<~'erb'
    <h1><%= @post[:title][:rendered] %></h1>
    <%= @post[:content][:rendered].html_safe %>
    erb
  end

  private

  attr_reader :post
end
