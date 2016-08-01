package product;

import java.util.List;

public interface iproductDAO {
	
	List<productDTO> getProductList();
	boolean insertProduct(productDTO pdto, productOptionDTO podto);
	productDTO getProduct(int product_seq);
	List<productOptionDTO> getProductOptionList(int product_seq);

}
