class Layout
  def stylesheet_link_tag(*sheets)
    require 'action_view'
    ::ActionView::Helpers::AssetTagHelper::StylesheetTagHelpers
    sheets.collect do |sheet|
      "<link rel=\"stylesheet\" type=\"text/css\" href=\"/assets/#{sheet}.css\" />"
    end.join("\n")
  end
  
  def javascript_include_tag(*args); end
  
  def render(options = {})
    require 'erb'

    if options.class == String
      options.sub!("shared/", "shared/_")
    end

    ERB.new(File.open(File.dirname(__FILE__) + "/../app/views/#{options}.html.erb", "rb").read).result(Layout.new.get_binding  { |*pages| '{{ content }}' if pages.empty? })
#    "{{ include #{options[/[a-z_]*$/]}.html }}"
  end
  
  def get_binding
    binding
  end

  def csrf_meta_tags
    nil
  end

  def notice
    nil
  end

  def alert
    nil
  end

  def current_user
    nil
  end

  def new_user_registration_url
    nil
  end

  def new_user_session_url
    nil
  end
end