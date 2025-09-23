module Workspaceble
  extend ActiveSupport::Concern

  included do
    before_action :ensure_workspace
  end

  def ensure_workspace
    return unless user_signed_in?
    return if current_workspace

    Current.workspace = if Current.user.workspaces.any?
                          Current.user.workspaces.first
                        else
                          Current.user.workspaces.create!(title: 'My Workspace')
                        end
    session[:cw_id] = Current.workspace.id
  end

  def workspace_from_session
    return unless session[:cw_id]

    Current.user.workspaces.find_by(id: session[:cw_id])
  end

  def current_workspace
    Current.workspace ||= workspace_from_session
  end

  def set_current_workspace(workspace)
    Current.workspace = workspace
    session[:cw_id] = Current.workspace.id
  end
end
