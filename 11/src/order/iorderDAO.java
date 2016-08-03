package order;

import java.util.List;

public interface iorderDAO {

	boolean insertOrder(orderDTO odto);
	List<orderDTO> getadminOrderList();
	boolean updateorder_confirm(int order_seq);
}
