package ${groupId}.controller;

import com.boot.framework.config.SysConstantConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author lindj
 * @date 2019/2/26
 * @description
 */
@RestController
@RequestMapping("/api/sys")
public class SysConstantController {

    @Autowired
    private SysConstantConfig sysConstantConfig;

    @GetMapping("/list")
    public Object getList(){
        return this.sysConstantConfig.getValue("size");
    }
}