import com.crud.entity.Emp;
import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:conf/application-bean.xml", "classpath:conf/springmvc-config.xml"})
public class SpringmvcTest {
    @Autowired
    WebApplicationContext context;
    MockMvc mockMvc;

    @Before
    public void init() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void req() {
        try {
            MvcResult request = mockMvc.perform(MockMvcRequestBuilders.get("/findAllemp").param("pageno", "1")).andReturn();
            MockHttpServletRequest request1 = request.getRequest();
            PageInfo pageInfo = (PageInfo) request1.getAttribute("pageinfo");
            System.out.println("当前页数:"+pageInfo.getPageNum());
            System.out.println("总数:"+pageInfo.getTotal());
            System.out.println("总页数:"+pageInfo.getPages());
            List<Emp> list=pageInfo.getList();
            for (Emp e: list){
                System.out.println(e);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
