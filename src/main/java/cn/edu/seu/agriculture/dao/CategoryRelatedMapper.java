package cn.edu.seu.agriculture.dao;

import cn.edu.seu.agriculture.entity.CategoryRelated;
import cn.edu.seu.agriculture.entity.CategoryRelatedExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CategoryRelatedMapper {
    long countByExample(CategoryRelatedExample example);

    int deleteByExample(CategoryRelatedExample example);

    int insert(CategoryRelated record);

    int insertSelective(CategoryRelated record);

    List<CategoryRelated> selectByExample(CategoryRelatedExample example);

    int updateByExampleSelective(@Param("record") CategoryRelated record, @Param("example") CategoryRelatedExample example);

    int updateByExample(@Param("record") CategoryRelated record, @Param("example") CategoryRelatedExample example);
}