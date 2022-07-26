package com.khs.test.ajax.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.khs.test.ajax.model.favorite;

@Repository
public interface FavoriteDAO {
	
	
	public List<favorite> selectfavorite();
	
	public int insertfavorite(@Param("name") String name
				,@Param("address") String address);
	
	public int selectCountByAddress(@Param("address") String address);
	
	public int deletefavoriteById(@Param("id") int id);
}
