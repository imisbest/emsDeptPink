package com.csw.test;

import com.csw.Application;
import com.csw.service.EmpService;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * Created by HIAPAD on 2019/10/30.
 */
//
@RunWith(SpringRunner.class)  //==@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = Application.class)
public class BasicTest {
    @Autowired
    private EmpService empService;

    /*<dependency>
              <groupId>org.springframework.boot</groupId>
              <artifactId>spring-boot-starter-test</artifactId>
              <scope>test</scope>
          </dependency>*/
    /*@Test
    public void testcount() {
        Integer aa = empService.countPage(2);
    }*/
}

