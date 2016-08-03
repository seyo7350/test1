package product;

import java.util.List;

public interface iproductDAO {
	
	List<productDTO> getProductList(int product_price);
	boolean insertProduct(productDTO pdto, List<productOptionDTO> product_list);
	productDTO getProduct(int product_seq);
	List<productOptionDTO> getProductOptionList(int product_seq);
	productOptionDTO getProductOption(int product_seq, int productOption_seq);
	int getseq();

}
