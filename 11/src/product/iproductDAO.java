package product;

import java.util.List;

public interface iproductDAO {
	
	List<productDTO> getProductList();
	boolean insertProduct(productDTO pdto, List<productOptionDTO> product_list);
	productDTO getProduct(int product_seq);
	List<productOptionDTO> getProductOptionList(int product_seq);
	int getseq();

}
