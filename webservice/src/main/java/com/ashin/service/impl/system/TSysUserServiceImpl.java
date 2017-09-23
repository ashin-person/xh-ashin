package com.ashin.service.impl.system;

import com.ashin.bean.system.TSysUser;
import com.ashin.dao.system.TSysUserDao;
import com.ashin.service.system.TSysUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by AshinLiang on 2017/9/23.
 */
@Service
public class TSysUserServiceImpl implements TSysUserService {

    @Resource
    TSysUserDao tSysUserDao;

    public int addTSysUser(TSysUser tSysUser) {

        int result = 0;
        if (tSysUser!=null){
            result = tSysUserDao.insert(tSysUser);
        }
        return result;
    }
}
