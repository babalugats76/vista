class HomeController < ApplicationController
  
  def index
    set_meta_tags title: 'There is a Difference',
              description: 'Established in 1992, Vista Hardwood Floors specializes in restoring and repairing hardwood floors in the Denver, CO metro area',
              keywords: 'hardwood, floors, flooring, wood, repair, restore, Denver, vista'
  end
end
