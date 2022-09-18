package Action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import Bean.BankUser;
import Bean.Trade;
import Service.BankService;
import Service.TradeService;

@Controller
public class BankAction {
	BankService bankService;
	TradeService tradeService;
	public BankService getBankService() {
		return bankService;
	}
	@Resource
	public void setBankService(BankService bankService) {
		this.bankService = bankService;
	}
	
	public TradeService getGradeService() {
		return tradeService;
	}
	@Resource
	public void setTradeService(TradeService gradeService) {
		this.tradeService = gradeService;
	}
	//???
	@RequestMapping("login.do")
	public String login(@Valid@ModelAttribute("command") BankUser bankUser,BindingResult bindingResult,HttpServletRequest request){
		if(bindingResult.hasErrors()){
			return "bottom";
		}
		int n=bankService.login(bankUser);
		int m=bankService.findById(n);
		if(n>0){
			request.setAttribute("id", n);
			request.setAttribute("m", m);
			return "bank";
		}else{
			request.setAttribute("id", 0);
			return "bottom";
		}
		
	}
	//???
	@RequestMapping("register.do")
	public String register(@Valid@ModelAttribute("command") BankUser bankUser,BindingResult bindingResult,HttpSession session){
		if(bindingResult.hasErrors()){
			return "register";
		}
		int n=bankService.register(bankUser);
		if(n>0){
			List list=bankService.findByName(bankUser.getUserName());
			session.setAttribute("list", list);
			return "registerShow";
		}else{
			return "false";
		}
	}
	//?????
	@RequestMapping("select.do")
	public String select(HttpServletRequest request){
		int id=Integer.parseInt(request.getParameter("id"));
		int sum=bankService.select(id);
		int timeMoney=bankService.selectTimeMoney(id);
		request.setAttribute("sum", sum);
		request.setAttribute("timeMoney", timeMoney);
		return "myMoney";
	}
	//???
	@RequestMapping("get.do")
	public String getMoney(HttpServletRequest request){
		int id=Integer.parseInt(request.getParameter("id"));
		int sum=Integer.parseInt(request.getParameter("much"));
		int n=bankService.getMoney(id,sum);
		if(n>=0){
			request.setAttribute("no", n);
			return "get";
		}else{
			request.setAttribute("no", -1);
			return "get";
		}
	}
	//???
	@RequestMapping("set.do")
	public String setMoney(HttpServletRequest request){
		int n=0;
		int id=Integer.parseInt(request.getParameter("id"));
		int sum=Integer.parseInt(request.getParameter("much"));
		int type=Integer.parseInt(request.getParameter("type"));
		if(type==1){
			n=bankService.setMoney(id,sum);
		}else{
			int year=Integer.parseInt(request.getParameter("year"));
			String balanceDue=request.getParameter("balanceDue");
			n=bankService.setTimeMoney(id,sum,year,balanceDue);
		}
		request.setAttribute("no", n);
		return "set";
	}
	//??????
	@RequestMapping("info.do")
	public String findInfo(HttpSession session,HttpServletRequest request){
		int id=Integer.parseInt(request.getParameter("id").toString());
		String pageNum=request.getParameter("p")==null?"1":request.getParameter("p");
	    request.setAttribute("page", tradeService.getTradePage(Integer.valueOf(pageNum),id));
	    request.setAttribute("id",id);
		return "info";
	}
	//?????????
	@RequestMapping("selfInfo")
	public String selfInfo(HttpSession session,HttpServletRequest request){
		int id=Integer.parseInt(request.getParameter("id").toString());
		List n=bankService.selfInfo(id);
		session.setAttribute("list", n);
		return "selfInfo";
	}
	//????????????
	@RequestMapping("find.do")
	public String find(HttpSession session,HttpServletRequest request){
		int id=Integer.parseInt(request.getParameter("id").toString());
		List n=bankService.selfInfo(id);
		session.setAttribute("list", n);
		return "update";
	}
	//???
	@RequestMapping("update.do")
	public String update(BankUser bankUser,HttpSession session){
		int n=bankService.update(bankUser);
		int id=bankUser.getId();
		List m=bankService.selfInfo(id);
		session.setAttribute("list", m);
		return "update";
	}
	//???
	@RequestMapping("cancel.do")
	public String cancel(HttpServletRequest request,HttpSession session){
		int id=Integer.parseInt(request.getParameter("id"));
		int n=bankService.cancel(id);
		if(n!=0){
			request.setAttribute("id", id);
			request.setAttribute("n", n);
			return "cancel";
		}
		else
		return "do";
	}
	//???
	@RequestMapping("remittance.do")
	public String remittance(HttpServletRequest request){
		int id=Integer.parseInt(request.getParameter("id"));
		String name=request.getParameter("who");
		String number=request.getParameter("number");
		int sum=Integer.parseInt(request.getParameter("much"));
		int n=bankService.remittance(id,sum,name,number);
		request.setAttribute("id", id);
		request.setAttribute("no", n);
		return "remittance";
	}

}
