import com.biao.dao.DepartmentMapper;
import com.biao.dao.EmployeeMapper;
import com.biao.pojo.Department;
import com.biao.pojo.Employee;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:ssm-springdao.xml"})
public class MapperTest {
    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;

    @Test
    public void testCRUD(){
        System.out.println(departmentMapper);

        //departmentMapper.insertSelective(new Department(null,"沙雕部"));
        for(int i=0;i<30;i++){
            String uuid = UUID.randomUUID().toString().substring(0,5);
            employeeMapper.insertSelective(new Employee(null,uuid,"男",uuid+"@biao.com",1));
        }
    }
}
