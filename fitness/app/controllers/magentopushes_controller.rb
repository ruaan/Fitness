class MagentopushesController < InheritedResources::Base
def new

end
def create

end
  private

    def magentopush_params
      params.require(:magentopush).permit()
    end
end

