class ProductController < ApplicationController

  def show
  end
  def search
    @token="020a5436c867942ff7dad6b8426ad5e9"
    @Link_encoded= url_encode(params[:link])
    @link_F = "https://api.diffbot.com/v3/product?token=" + @token + "&url=" + @Link_encoded
    # @link_F= "https://api.diffbot.com/v3/product?token=020a5436c867942ff7dad6b8426ad5e9&url=https%3A%2F%2Fwww.amazon.fr%2Fdp%2FB01E3SNO1G"
    @contenu=open(@link_F).read
    flash[:notice] = "Product Found"
    @json = JSON.parse(@contenu)
     if (!(@json["error"]))
        @product = Product.new(:text =>@json)
        @product.save
      else
        flash[:notice] = "Invalid Link"
    end
    render "show"
  end

  def delete
    Product.delete_all
    render "saved"
  end

end
