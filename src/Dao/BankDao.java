package Dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import Bean.BankUser;

@Component
public class BankDao {
	JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Resource
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}


	public int login(BankUser bankUser) {
		try {
			String sql = "select id from t_user where userName=? and passWord=?";
			int n = jdbcTemplate.queryForInt(sql, bankUser.getUserName(), bankUser.getPassWord());
			return n;
		}catch (Exception e) {
			return 0;
		}

	}
	public int register(BankUser bankUser) {
		try{
			String sqll="select id from t_user where card=?";
			List q=jdbcTemplate.queryForList(sqll,bankUser.getCard());
			if(q.size()>0){
				String s=bankUser.getCard();
				int sum=Integer.parseInt(s);
				sum++;
				s=Integer.toString(sum);
				bankUser.setCard(s);
			}
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String sql="insert into t_user(userName,passWord,userFlag,userAge,idCard,tel,city,userAddress,sex,card,money,time_money) values(?,?,?,?,?,?,?,?,?,?,?,?)";
			int n=jdbcTemplate.update(sql,bankUser.getUserName(),bankUser.getPassWord(),1,bankUser.getUserAge(),bankUser.getIdCard(),bankUser.getTel(),bankUser.getCity(),bankUser.getUserAddress(),bankUser.getSex(),bankUser.getCard(),0,0);
			String sql1="select id from t_user where userName=?";
			int m=jdbcTemplate.queryForInt(sql1,bankUser.getUserName());
			String sql2="insert into t_trade(trade,balance,dataTime,userOf,money) values('开户',0,?,?,0)";
			int l=jdbcTemplate.update(sql2,df.format(new Date()),m);
			return n;
		}catch(Exception e){
			return 0;
		}
	}
	public List findByName(String userName) {
		String sql="select * from t_user where userName=?";
		return jdbcTemplate.queryForList(sql,userName);
	}
	public int getMoney(int id, int sum) {
		String sql="select money from t_user where id=?";
		int n=jdbcTemplate.queryForInt(sql,id);
		if(n<sum){
			return -1;
		}
		String sql1="update t_user set money=? where id=?";
		int m=jdbcTemplate.update(sql1,n-sum,id);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sql2="insert into t_trade(trade,balance,dataTime,userOf,money) values(?,?,?,?,?)";
		int l=jdbcTemplate.update(sql2,"取款",sum,df.format(new Date()),id,n-sum);
		return n-sum;
	}
	public int setMoney(int id, int sum) {
		String sql="select money from t_user where id=?";
		int n=jdbcTemplate.queryForInt(sql,id);
		String sql1="update t_user set money=? where id=?";
		int m=jdbcTemplate.update(sql1,n+sum,id);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sql2="insert into t_trade(trade,balance,dataTime,userOf,money) values(?,?,?,?,?)";
		int l=jdbcTemplate.update(sql2,"活期存款",sum,df.format(new Date()),id,n+sum);
		return n+sum;
	}
	public List selfInfo(int id) {
		String sql="select * from t_user where id="+id+"";
		List list=jdbcTemplate.queryForList(sql);
		return list;
	}
	public int update(BankUser bankUser) {
		String sql="update t_user set passWord=?,tel=?,city=?,userAddress=? where id=?";
		int n=jdbcTemplate.update(sql,bankUser.getPassWord(),bankUser.getTel(),bankUser.getCity(),bankUser.getUserAddress(),bankUser.getId());
		return n;
	}
	public int cancel(int id) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sql="select money from t_user where id=?";
		int m=jdbcTemplate.queryForInt(sql,id);
		if(m!=0){
			return m;
		}else{
			String sql1="update t_user set userFlag=? where id=?";
			int n=jdbcTemplate.update(sql1,0,id);
			String sql2="insert into t_trade(trade,balance,dataTime,userOf,money) values(?,?,?,?,?)";
			int p=jdbcTemplate.update(sql2,"注销","0",df.format(new Date()),id,0);
			return 0;
		}
	}
	public int findById(int n) {
		try{
			String sql="select userFlag from t_user where id=? ";
			int m=jdbcTemplate.queryForInt(sql,n);
			return m;
		}catch(Exception e){
			return 0;
		}
	}
	public int remittance(int id, int sum, String name, String number) {
		try{
			int m = 0;
			String sql="select id from t_user where userName=? and card=?";
			int n=jdbcTemplate.queryForInt(sql,name,number);
			if(n<=0){
				return -1;
			}
			String sql10="select userFlag from t_user where id=?";
			int p=jdbcTemplate.queryForInt(sql10,n);
			if(p==0){
				return -2;
			}
			if(n>0){
				String sql1="select money from t_user where id="+id+"";
				m=jdbcTemplate.queryForInt(sql1);
				String sql2="select money from t_user where id="+n+"";
				int m1=jdbcTemplate.queryForInt(sql2);
				String sql7="select userName from t_user where id="+id+"";
				String name1=jdbcTemplate.queryForObject(sql7,String.class);
				String sql8="select card from t_user where id="+id+"";
				String number1=jdbcTemplate.queryForObject(sql8,String.class);
				if(m<sum){
					return 0;
				}else{
					String sql3="update t_user set money=? where id=?";
					jdbcTemplate.update(sql3,m-sum,id);
					String sql4="update t_user set money=? where id=?";
					jdbcTemplate.update(sql4,m1+sum,n);
					SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String sql5="insert into t_trade(trade,balance,dataTime,userOf,money,info) values(?,?,?,?,?,?)";
					String s="收款人:"+name+"</br>收款账户:"+number+"";
					jdbcTemplate.update(sql5,"汇款",sum,df.format(new Date()),id,m-sum,s);
					String sql6="insert into t_trade(trade,balance,dataTime,userOf,money,info) values(?,?,?,?,?,?)";
					String s1="汇款人:"+name1+"</br>汇款账户:"+number1+"";
					jdbcTemplate.update(sql6,"收款",sum,df.format(new Date()),n,m1+sum,s1);
					return m-sum+1;
				}
			}else{
				return -1;
			}
		}catch(Exception e){
			return -1;
		}

	}
	public int select(int id) {
		try{
			String sql="select money from t_user where id=? ";
			int m=jdbcTemplate.queryForInt(sql,id);
			return m;
		}catch(Exception e){
			return 0;
		}
	}

	public int setTimeMoney(int id, int sum,int year,String balanceDue) {
		String sql="select time_money from t_user where id=?";
		int n=jdbcTemplate.queryForInt(sql,id);
		String sql1="update t_user set time_money=? where id=?";
		int m=jdbcTemplate.update(sql1,n+sum,id);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sql2="insert into t_trade(trade,balance,dataTime,userOf,money) values(?,?,?,?,?)";
		String sql3="insert into t_fixeddeposit(useId,dataTime,year,money,balanceDue) values(?,?,?,?,?)";
		int l=jdbcTemplate.update(sql2,"定期存款",sum,df.format(new Date()),id,n+sum);
		int k=jdbcTemplate.update(sql3,id,df.format(new Date()),year,sum,balanceDue);
		return n+sum;
	}

	public int setTimeMoney(int id) {
		String sql="select time_money from t_user where id=?";
		int n=jdbcTemplate.queryForInt(sql,id);
		return n;
	}
}
