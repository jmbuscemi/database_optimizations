class ReportsController < ApplicationController
  def all_data
    @assembly = Assembly.find_by_name(params[:name])
    @hits = []
    genes = Gene.joins(sequence: [:assembly]).where('assemblies.name ="'+"#{params[:name]}"+'"')
    genes.each do |g|
      g.hits.each do |h|
        @hits << h
      end
    end
    @hits.sort! {|a, b| b.percent_similarity <=> a.percent_similarity}
  end
end
