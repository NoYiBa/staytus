class PagesController < ApplicationController

  before_filter { prepend_view_path(File.join(Staytus::Config.theme_root, 'views')) }
  layout Staytus::Config.theme_name

  def index
    @services = Service.ordered.includes(:status, {:active_maintenances => :service_status}).to_a
    @issues = Issue.ongoing.ordered.to_a
    @maintenances = Maintenance.open.ordered.to_a
  end

  def issue
    @issue = Issue.find_by_identifier!(params[:id])
    @updates = @issue.updates.includes(:user).ordered
  end

  def maintenance
    @maintenance = Maintenance.find_by_identifier!(params[:id])
    @updates = @maintenance.updates.includes(:user).ordered
  end

  def history
    @items = HistoryItem.includes(:item).ordered.page(params[:page])
  end

  def robots
    text = []
    text << "User-agent: *"
    text << "Disallow: /admin"
    unless site.crawling_permitted?
      text << "Disallow: /"
    end
    render :text => text.join("\n"), :content_type => 'text/plain'
  end

end
