import com.crud.dao.DeptMapper;
import com.crud.dao.EmpMapper;
import com.crud.entity.Emp;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:conf/application-bean.xml"})
public class TestDemo {
    @Autowired
    DeptMapper deptMapper;

    @Autowired
    EmpMapper empMapper;
    @Test
    public void test(){
        //ApplicationContext context=new ClassPathXmlApplicationContext("conf/application-bean.xml");
        //DeptMapper deptMapper = context.getBean("deptMapper", DeptMapper.class);
       // deptMapper.insertSelective(new Dept(null,"开发部"));
       // EmpMapper empMapper=context.getBean("empMapper",EmpMapper.class);
       // empMapper.insertSelective(new Emp(null,"hello","男","1222qq.com",1));
        for(int i=0;i<100;i++){
            String uid= UUID.randomUUID().toString().substring(0,5);
            empMapper.insertSelective(new Emp(null,uid+""+i,"女",uid+"qq.com",1));
        }
    }
}
