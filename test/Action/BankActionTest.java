package Action;

import Bean.BankUser;
import Dao.BankDao;
import Service.BankService;
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
    BankAction bankAction = new BankAction();
    BankUser bankUser = new BankUser();
    BindingResult bindingResult= Mockito.mock(BindingResult.class);
    HttpServletRequest request=Mockito.mock(HttpServletRequest.class);
    HttpSession session=Mockito.mock(HttpSession.class);


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
    }

    @Test
    public void getMoney() {
    }

    @Test
    public void setMoney() {
    }

    @Test
    public void findInfo() {
    }

    @Test
    public void selfInfo() {
    }

    @Test
    public void find() {
    }

    @Test
    public void update() {
    }

    @Test
    public void cancel() {
    }

    @Test
    public void remittance() {
    }

    @Test
    public void fixedToCurrent() {
    }

    @Test
    public void getTimeMoney() {
    }
}