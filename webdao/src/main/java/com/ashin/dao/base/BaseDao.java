package com.ashin.dao.base;

/**
 * 基础的dao接口
 * Created by AshinLiang on 2017/9/22.
 */
public interface BaseDao<T> {
    /**
     * 根据Id查找对应的实体
     * @param id
     * @return
     */
    public T getById(int id);

    /**
     * 根据实体对象，新增记录
     * @param t
     * @return
     */
    public int insert(T t);

    /**
     * 更新某个实体
     * @param entity
     * @return
     */
    public int update(T entity);

    /**
     * 根据ID删除对应的实体
     * @param id int类型
     * @return
     */
    public int delelteById(int id);


}
