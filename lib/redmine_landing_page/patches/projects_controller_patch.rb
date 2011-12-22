module RedmineLandingPage
  module Patches
    module ProjectsControllerPatch
      def self.included(base)
        base.class_eval do
          alias_method :show_without_landing_page, :show unless method_defined? :show_without_landing_page

          def show
            if !@project.landing_page.empty?
              redirect_to @project.landing_page
            else
              show_without_landing_page
            end
          end
        end

      end

    end
  end
end