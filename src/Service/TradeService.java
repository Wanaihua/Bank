package Service;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import Bean.Page;
import Dao.TradeDao;
@Component
public class TradeService {
	TradeDao tradeDao;

	public TradeDao getTradeDao() {
		return tradeDao;
	}
	@Resource
	public void setTradeDao(TradeDao tradeDao) {
		this.tradeDao = tradeDao;
	}
	
	public Page getTradePage(int pageNum,int id) {
		return tradeDao.getTradePage(pageNum,id);
	}


    public Page getFixeDepositPage(int pageNum,int id) {
		return tradeDao.getFixeDepositPage(pageNum,id);
	}
}
