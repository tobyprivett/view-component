class PostsComponent < ActionView::Component
  validates :posts, presence: true

  def initialize(posts:)
    @posts = posts
  end

  def self.template
    <<~'erb'
    <ul>
      <% @posts.each do |post| %>
        <li><%= link_to post[:title][:rendered], post_path(post[:id]) %></li>
    <% end %>
    </ul>
    erb
  end

  private

  attr_reader :posts
end
