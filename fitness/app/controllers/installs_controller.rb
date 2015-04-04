class InstallsController < InheritedResources::Base

  private

    def install_params
      params.require(:install).permit(:product_id,:image, :title, :sku, :category, :price, :quantity, :description)
    end
end

