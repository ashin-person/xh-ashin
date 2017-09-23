package com.ashin.service.system;

import com.ashin.bean.system.TSysUser;

/**
 * 系统管理员的处理service
 * Created by AshinLiang on 2017/9/23.
 */
public interface TSysUserService {
    /**
     * 添加一个系统管理员
     * @param tSysUser
     * @return
     */
    public int addTSysUser(TSysUser tSysUser);
}
