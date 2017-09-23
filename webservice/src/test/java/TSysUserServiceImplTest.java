import com.ashin.bean.system.TSysUser;
import com.ashin.service.system.TSysUserService;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.Date;

/**
 * Created by AshinLiang on 2017/9/23.
 */
public class TSysUserServiceImplTest extends BaseTest {

    @Resource
    TSysUserService TSysUserService;

    @Test
    public void testAddTSysUser(){
        TSysUser tSysUser = new TSysUser();
        tSysUser.setName("alice");
        tSysUser.setPhoneNum("13008889992");
        tSysUser.setPwd("a4358");
        tSysUser.setSex("0");
        tSysUser.setCreateTime(new Date());
        int result = TSysUserService.addTSysUser(tSysUser);
        System.out.println(result);
    }


}
