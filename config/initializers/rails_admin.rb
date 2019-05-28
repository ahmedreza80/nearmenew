RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true
  config.authenticate_with do
    authenticate_or_request_with_http_basic('Site Message') do |username, password|
      username == 'admin' && password == 'openbar'
    end
  end
  
  config.main_app_name = ["Cool app", "BackOffice"]
  # or something more dynamic
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  # Config for model products
  config.model Product do
    weight 1

    edit do
      include_all_fields
      field :state, :enum do
        def render
          bindings[:view].render :partial => 'rails_admin/main/state_name', :locals => { object: bindings[:object], :field => self, :form => bindings[:form] }
        end

        def form_value
          bindings[:object].state
        end
      end
      field :city, :enum do
        def render
          bindings[:view].render :partial => 'rails_admin/main/city_name', :locals => { object: bindings[:object], :field => self, :form => bindings[:form]}
        end

        def form_value
          bindings[:object].city
        end
      end

      field :area, :enum do
        def render
          bindings[:view].render :partial => 'rails_admin/main/area_name', :locals => { object: bindings[:object], :field => self, :form => bindings[:form]}
        end

        def form_value
          bindings[:object].area
        end
      end

    end
  end
end
