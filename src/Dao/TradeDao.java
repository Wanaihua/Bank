package Dao;

import java.util.List;

import javax.annotation.Resource;

import Bean.FixedDeposit;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Component;

import Bean.Page;
import Bean.Trade;

@Component
public class TradeDao {
JdbcTemplate jdbcTemplate;
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Resource
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	public int getTotalRecord(String sql, Object... arrayParameters) {
        int totalRecord = jdbcTemplate.queryForInt(sql, arrayParameters);
        return totalRecord;
    }
	public Page getPage(int pageNum, Class clazz, String sql, int totalRecord, Object... parameters) {
        Page page = new Page(pageNum, totalRecord);
        sql = sql+" limit "+page.getStartIndex()+","+page.getPageSize();
        List list=jdbcTemplate.query(sql, parameters, ParameterizedBeanPropertyRowMapper.newInstance(clazz));    
        page.setTradelist(list);
        return page;
    }
	public Page getTradePage(int pageNum,int id) {
        String sql = "select count(*) from t_trade where userOf="+id+"";
        int totalRecord = getTotalRecord(sql);
        sql = "select * from t_trade where userOf="+id+"";
        Page page = getPage(pageNum, Trade.class, sql, totalRecord);
        return page;
    }

    public Page getFixeDepositPage(int pageNum, int id) {
        String sql = "select count(*) from t_fixeddeposit where useId="+id+" and lapse=0";
        int totalRecord = getTotalRecord(sql);
        sql = "select * from t_fixeddeposit where useId="+id+" and lapse=0";
        Page page = getPage(pageNum, FixedDeposit.class, sql, totalRecord);
        return page;
    }
}
