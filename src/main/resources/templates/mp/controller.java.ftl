package ${package.Controller};

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hc.${package.ModuleName}.configer.ApiResponse;
import ${package.Entity}.${entity};
import ${package.Service}.${table.serviceName};
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;


/**
 * <p>
 * ${table.comment!} 前端控制器
 * </p>
 *
 * @author ${author}
 * @version v1.0
 * @since ${date}
 */
@RestController
@RequestMapping("/${entity?uncap_first}")
public class ${table.controllerName} {
    @Autowired
    private ${table.serviceName} ${entity?uncap_first}Service;

    /**
     * 新增
     *
     * @param ${entity?uncap_first}
     * @return
     */
    @PostMapping
    public ApiResponse<?> createEntity(@RequestBody ${entity} ${entity?uncap_first}) {
        LocalDateTime now = LocalDateTime.now();
        ${entity?uncap_first}.setCreatedAt(now);
        ${entity?uncap_first}.setUpdatedAt(now);
        boolean created = ${entity?uncap_first}Service.save(${entity?uncap_first});
        if (created) {
            return ApiResponse.ok(${entity?uncap_first}); // 返回创建的用户对象
        } else {
            return ApiResponse.resultCreateError("创建失败");
        }
    }


    /**
     * 分页
     *
     * @param page
     * @param size
     * @return
     */
    @GetMapping("/page")
    public ApiResponse<Page<${entity}>> get${entity}Page(
        @RequestParam(value = "page", defaultValue = "1") int page,
        @RequestParam(value = "size", defaultValue = "10") int size) {
        QueryWrapper<${entity}> queryWrapper = new QueryWrapper<>();

        queryWrapper.orderByAsc("${entity?uncap_first}_id");

        Page<${entity}> pageResult = ${entity?uncap_first}Service.page(new Page<>(page, size), queryWrapper);
        return ApiResponse.ok(pageResult);
    }

    /**
     * 查询列表
     *
     * @return
     */
    @GetMapping("/list")
    public ApiResponse<List<${entity}>> get${entity}List() {
        QueryWrapper<${entity}> queryWrapper = new QueryWrapper<>();
        List<${entity}> list = ${entity?uncap_first}Service.list(queryWrapper);
        return ApiResponse.ok(list);
    }

    /**
     * 根据ID获取
     *
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public ApiResponse<${entity}> get${entity}ById(@PathVariable Long id) {
        ${entity} ${entity?uncap_first} = ${entity?uncap_first}Service.getById(id);
        return ${entity?uncap_first} != null ? ApiResponse.ok(${entity?uncap_first}) : ApiResponse.result404(null);
    }

    /**
     * 更新
     *
     * @param id
     * @param ${entity?uncap_first}
     * @return
     */
    @PutMapping("/{id}")
    public ApiResponse<?> update${entity}(@PathVariable Long id, @RequestBody ${entity} ${entity?uncap_first}) {
        ${entity} exist${entity} = ${entity?uncap_first}Service.getById(id);
        if (exist${entity} == null) {
            return ApiResponse.result404(null);
        }
        // 暂时先不用
        BeanUtils.copyProperties(${entity?uncap_first}, exist${entity}, "${entity?uncap_first}Id");
        exist${entity}.setUpdatedAt(LocalDateTime.now());
        boolean updated = ${entity?uncap_first}Service.updateById(exist${entity});
        if (updated) {
           return ApiResponse.ok(exist${entity}); // 返回更新后信息
        } else {
            return ApiResponse.resultUpdateError("更新失败");
        }
    }

    /**
     * 删除
     *
     * @param id
     * @return
     */
    @DeleteMapping("/{id}")
    public ApiResponse<?> delete${entity}(@PathVariable Long id) {
        boolean removed = ${entity?uncap_first}Service.removeById(id);
        if (removed) {
            return ApiResponse.ok(null);
        } else {
            return ApiResponse.resultDeleteError("删除失败");
        }
    }
}
