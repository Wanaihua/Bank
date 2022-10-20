package Action;

import Bean.BankUser;
import Bean.Page;
import Dao.BankDao;
import Service.BankService;
import Service.TradeService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.springframework.test.util.ReflectionTestUtils;
import org.springframework.validation.BindingResult;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(org.mockito.runners.MockitoJUnitRunner.class)
@PrepareForTest({BankService.class,BankAction.class})

public class BankActionTest {
    @Mock
    BankService bankService = new BankService();
    @Mock
    TradeService tradeService = new TradeService();
    BankAction bankAction = new BankAction();
    BankUser bankUser = new BankUser();
    BindingResult bindingResult= Mockito.mock(BindingResult.class);
    HttpServletRequest request=Mockito.mock(HttpServletRequest.class);
    HttpSession session=Mockito.mock(HttpSession.class);

    @Test
    public void getBankService() {
        ReflectionTestUtils.setField(bankAction,"bankService",bankService);
        assertEquals(bankService,bankAction.getBankService());
    }

    @Test
    public void setBankService() {
        bankAction.setBankService(bankService);
        assertEquals(bankService,ReflectionTestUtils.getField(bankAction,"bankService"));
    }

    @Test
    public void getGradeService() {
        ReflectionTestUtils.setField(bankAction,"tradeService",tradeService);
        assertEquals(tradeService,bankAction.getGradeService());
    }

    @Test
    public void setTradeService() {
        bankAction.setTradeService(tradeService);
        assertEquals(tradeService,ReflectionTestUtils.getField(bankAction,"tradeService"));
    }

    @Test
    public void login() {
        bankUser.setUserName("root");
        bankUser.setPassWord("123456");
        ReflectionTestUtils.setField(bankAction, "bankService", bankService);
        Mockito.when(bindingResult.hasErrors()).thenReturn(false);
        Mockito.when(bankService.login(bankUser)).thenReturn(2);
        Mockito.when(bankService.findById(2)).thenReturn(2);
        assertEquals("bank", bankAction.login(bankUser,bindingResult, request));
    }


    @Test
    public void register() {
        List l = Mockito.mock(List.class);
        bankUser.setUserName("test");
        bankUser.setPassWord("123456");
        bankUser.setMoney("0");
        bankUser.setCard("123456789");
        bankUser.setCity("吉林长春");
        bankUser.setTel("123456789");
        bankUser.setTime_money("0");
        bankUser.setIdCard("123456789");
        bankUser.setSex("男");
        bankUser.setUserAge(18);
        bankUser.setUserFlag(0);
        ReflectionTestUtils.setField(bankAction, "bankService", bankService);
        Mockito.when(bindingResult.hasErrors()).thenReturn(false);
        Mockito.when(bankService.register(bankUser)).thenReturn(1);
        Mockito.when(bankService.findByName(bankUser.getUserName())).thenReturn(l);
        assertEquals("registerShow", bankAction.register(bankUser,bindingResult, session));
    }

    @Test
    public void select() {
        ReflectionTestUtils.setField(bankAction, "bankService", bankService);
        Mockito.when(bankService.select(1)).thenReturn(1);
        Mockito.when(bankService.selectTimeMoney(1)).thenReturn(1);
        Mockito.when(request.getParameter("id")).thenReturn("1");
        assertEquals("myMoney", bankAction.select(request));
    }

    @Test
    public void getMoney() {
        ReflectionTestUtils.setField(bankAction, "bankService", bankService);
        Mockito.when(bankService.getMoney(1, 1)).thenReturn(1);
        Mockito.when(request.getParameter("id")).thenReturn("1");
        Mockito.when(request.getParameter("much")).thenReturn("1");
        assertEquals("get", bankAction.getMoney(request));
    }

    @Test
    public void setMoney() {
        ReflectionTestUtils.setField(bankAction, "bankService", bankService);
        Mockito.when(bankService.setMoney(1, 1)).thenReturn(1);
        Mockito.when(request.getParameter("id")).thenReturn("1");
        Mockito.when(request.getParameter("much")).thenReturn("1");
        Mockito.when(request.getParameter("type")).thenReturn("1");
        assertEquals("set", bankAction.setMoney(request));
    }

    @Test
    public void findInfo() {
        Page page = new Page(5,1);
        int pageNum = 5,id = 1;
        ReflectionTestUtils.setField(bankAction, "bankService", bankService);
        ReflectionTestUtils.setField(bankAction, "tradeService", tradeService);
        Mockito.when(request.getParameter("id")).thenReturn("1");
        Mockito.when(request.getParameter("p")).thenReturn(null);
        assertEquals("info", bankAction.findInfo(session,request));
    }

    @Test
    public void selfInfo() {
        List l=Mockito.mock(List.class);
        ReflectionTestUtils.setField(bankAction, "bankService", bankService);
        Mockito.when(request.getParameter("id")).thenReturn("1");
        Mockito.when(bankService.selfInfo(1)).thenReturn(l);
        assertEquals("selfInfo", bankAction.selfInfo(session,request));
    }

    @Test
    public void find() {
        List l=Mockito.mock(List.class);
        ReflectionTestUtils.setField(bankAction, "bankService", bankService);
        Mockito.when(request.getParameter("id")).thenReturn("1");
        Mockito.when(bankService.selfInfo(1)).thenReturn(l);
        assertEquals("update", bankAction.find(session,request));
    }

    @Test
    public void update() {
        List l=Mockito.mock(List.class);
        bankUser.setUserName("test");
        bankUser.setPassWord("123456");
        bankUser.setMoney("0");
        bankUser.setCard("123456789");
        bankUser.setCity("吉林长春");
        bankUser.setTel("123456789");
        bankUser.setTime_money("0");
        bankUser.setIdCard("123456789");
        bankUser.setSex("男");
        bankUser.setUserAge(18);
        bankUser.setUserFlag(0);
        ReflectionTestUtils.setField(bankAction, "bankService", bankService);
        Mockito.when(bankService.update(bankUser)).thenReturn(1);
        assertEquals("update", bankAction.update(bankUser,session));
    }

    @Test
    public void cancel() {
        ReflectionTestUtils.setField(bankAction, "bankService", bankService);
        Mockito.when(request.getParameter("id")).thenReturn("1");
        Mockito.when(bankService.cancel(1)).thenReturn(1);
        assertEquals("cancel", bankAction.cancel(request,session));
    }

    @Test
    public void remittance() {
        ReflectionTestUtils.setField(bankAction, "bankService", bankService);
        Mockito.when(request.getParameter("id")).thenReturn("1");
        Mockito.when(request.getParameter("who")).thenReturn("root");
        Mockito.when(request.getParameter("number")).thenReturn("0");
        Mockito.when(request.getParameter("much")).thenReturn("0");
        Mockito.when(bankService.remittance(1,0,"root","0")).thenReturn(1);
        assertEquals("remittance", bankAction.remittance(request));
    }

    @Test
    public void fixedToCurrent() {
        Page page = new Page(5,1);
        ReflectionTestUtils.setField(bankAction, "bankService", bankService);
        ReflectionTestUtils.setField(bankAction, "tradeService", tradeService);
        Mockito.when(tradeService.getFixeDepositPage(1,1)).thenReturn(page);
        Mockito.when(request.getParameter("id")).thenReturn("1");
        assertEquals("fixedToCurrent", bankAction.fixedToCurrent(request));
    }

    @Test
    public void getTimeMoney() {
        Page page = new Page(5,1);
        ReflectionTestUtils.setField(bankAction, "bankService", bankService);
        ReflectionTestUtils.setField(bankAction, "tradeService", tradeService);
        Mockito.when(tradeService.getFixeDepositPage(1,1)).thenReturn(page);
        Mockito.when(request.getParameter("id")).thenReturn("1");
        Mockito.when(bankService.getTimeMoney(1)).thenReturn(1);
        assertEquals("fixedToCurrent", bankAction.getTimeMoney(request));
    }
}