class ApplicationController < ActionController::Base
    #before_action :authenticate_user!
    
    private


    def after_sign_out_path_for(resource_or_scope)
        root_path
    end
end
