package com.zh.DAO;

import com.zh.Entity.Login_ticket;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

/**
 * Created by lqp on 2019/7/23
 */
@Mapper
@Component
public interface LoginTicketDao {

    final  String TABLE_NAME = "login_ticket";
    final String INSET_FIELDS = " emp_id,ticket, expired, status";
    String SELECT_FIELDS = " id, emp_id, ticket, expired, status";

    @Insert({"insert into ", TABLE_NAME, "(", INSET_FIELDS,
            ") values (#{emp_id},#{ticket},#{expired},#{status})"})
    int addTicket(Login_ticket loginTicket);

    @Select({"select ", SELECT_FIELDS, " from ", TABLE_NAME, " where id=#{id}"})
    Login_ticket selectById(int id);

    @Select({"select ", SELECT_FIELDS, " from ", TABLE_NAME, " where emp_id=#{emp_id}"})
    Login_ticket selectByName(String emp_id);

    @Select({"select ", SELECT_FIELDS, " from ", TABLE_NAME, " where ticket=#{ticket}"})
    Login_ticket selectByTicket(String ticket);

    //此处的@Param用于传入多个参数时，区分不同的参数，因为单凭变量名没办法判断谁是谁
    @Update({"update ", TABLE_NAME, " set status=#{status} where ticket=#{ticket}"})
    void updateStatus(@Param(value = "ticket") String ticket, @Param(value = "status") int status);

    @Delete({"delete from ", TABLE_NAME, " where id=#{id}"})
    void deleteById(int id);

}
