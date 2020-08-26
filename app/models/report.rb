class Report < ActiveRecord::Base
    belongs_to :user
    # validates :username, presence: true

    # def fix_blank_entries
    #     params.each do |k|
    #         params[:k].gsub("", "N/A")
    #     end
    # end

end