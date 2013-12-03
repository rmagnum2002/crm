class VersionsController < ApplicationController
  before_filter :authenticate_user!

  def revert
    @version = @current_site.versions.find(params[:id])

    if @version.reify
      @version.reify.save!
    else
      @version.item.destroy
    end

    link_name = params[:redo] == 'true' ? t(:undo) : t(:redo)
    link = view_context.link_to(link_name, revert_version_path(@version.next, :redo => !params[:redo]), :method => :post)
    redirect_to :back, :notice => t(:"restored_#{@version.event}") + "  #{link}"
  end
end
