package order;

import java.util.List;

public interface iorderDAO {

	boolean insertOrder(orderDTO odto);
	List<orderDTO> getadminOrderList();
}
