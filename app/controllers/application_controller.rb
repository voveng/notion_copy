class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  include Authentication
  include Workspaceble
end
