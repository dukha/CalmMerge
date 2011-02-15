module ApplicationHelper
  $F="formtastic."
  $FL= $F+"labels."
  $FH=$F+"hints."
  $L="links."
  $AR="activerecord."
  $LU="lookups."
  $MU="menus."

  $application_name = ""
  $application_version ="0.0.0"
  def titler
    if @title.nil?
      $application_name
    else
      "#{$application_name} : #{@title}"
    end
  end

  def logo
    image_tag( "bodhi.gif", :alt => "Bodhi leaf not found", :height=>"50px")
  end
  # you need this if you are doing hebrew or arabic
  def text_direction
    I18n.translate(:'bidi.direction') == 'right-to-left' ? 'rtl' : 'ltr'
    # in ../locale/he.yml add
    # he:
        #bidi:
        #direction: right-to-left
    # then in ../locale/root.yml  add
    # root:
       #bidi:
       #  direction: left-to-right
  end

  #def set_user_language   # (id)
       #logger.info current_user
       #I18n.locale =:en
      #NOt until devise is installed :I18n.locale = Language.find_by_id(current_user.language_id).iso_code if current_user != nil
      #logger.info("App controller i18n.locale = " +I18n.locale.to_s)
      #I18n.locale= Language.find_by_id(id).iso_code
      #logger.info("App controller i18n.locale = " +I18n.locale.to_s)
      #default_url_options(options={})
  #end
end
