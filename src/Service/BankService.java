package Service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import Bean.BankUser;
import Dao.BankDao;

@Component
public class BankService {
	BankDao bankDao;

	public BankDao getBankDao() {
		return bankDao;
	}
	@Resource
	public void setBankDao(BankDao bankDao) {
		this.bankDao = bankDao;
	}
	public int login(BankUser bankUser) {
		return bankDao.login(bankUser);
	}
	public int register(BankUser bankUser) {
		return bankDao.register(bankUser);
	}
	public List findByName(String userName) {
		return bankDao.findByName(userName);
	}
	public int getMoney(int id, int sum) {
		return bankDao.getMoney(id,sum);
	}
	public int setMoney(int id, int sum) {
		return bankDao.setMoney(id,sum);
	}
	public List selfInfo(int id) {
		return bankDao.selfInfo(id);
	}
	public int update(BankUser bankUser) {
		return bankDao.update(bankUser);
	}
	public int cancel(int id) {
		return bankDao.cancel(id);
	}
	public int findById(int n) {
		return bankDao.findById(n);
	}
	public int remittance(int id, int sum, String name, String number) {
		return bankDao.remittance(id,sum,name,number);
	}
	public int select(int id) {
		return bankDao.select(id);
	}

    public int setTimeMoney(int id, int sum,int year,String balanceDue) {
		return bankDao.setTimeMoney(id,sum,year,balanceDue);
    }

	public int selectTimeMoney(int id) {
		return bankDao.setTimeMoney(id);
	}
}
