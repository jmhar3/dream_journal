module ApplicationHelper
    def menu_icon display
        content_for :menu_icon, display
    end

    def tracker_title title
        content_for :tracker_title, title
    end
end