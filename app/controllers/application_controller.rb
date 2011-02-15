class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_user_language

  # Is Authorization.current_user the same as current_user???
  before_filter {|contr| Authorization.current_user = contr.current_user}
  # This function, together with the scope in routes.rb allows the setting of urls like http://example.com/en/products/1
  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end

  def set_user_language   # (id)
       #logger.info current_user
      if current_user != nil then
          I18n.locale = Language.find_by_id(current_user.language_id).iso_code
      end
  end
end
