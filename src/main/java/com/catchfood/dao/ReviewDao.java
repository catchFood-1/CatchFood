package com.catchfood.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.catchfood.dto.ReviewDto;

@Mapper
public interface ReviewDao {
    List<ReviewDto> ReviewListPage(@Param("startRow") int startRow, 
                                   @Param("pageSize") int pageSize);

    int ReviewInsert(ReviewDto dto);

    int getTotalCount();
}
