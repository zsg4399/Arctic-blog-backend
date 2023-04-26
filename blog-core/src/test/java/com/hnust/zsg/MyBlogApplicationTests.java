package com.hnust.zsg;



import com.hnust.zsg.entity.vo.MyUserVO;
import com.hnust.zsg.utils.EmailUtil;
import com.hnust.zsg.utils.ValidataUtil;
import org.junit.jupiter.api.Test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;


@SpringBootTest
class MyBlogApplicationTests {

    @Autowired
    private JavaMailSender sender;

    @Test
    void testSQL() throws Exception {
        ValidataUtil.ValidBirthday("121");
    }
}
