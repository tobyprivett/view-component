class PostComponent < ActionView::Component
  validates :content, :title, presence: true

  def initialize(title:)
    @title = title
  end

  def self.template
    <<~'erb'
    <h1><%= title %></h1>
    <p><%= content %></p>
    erb
  end

  private

  attr_reader :title
end
