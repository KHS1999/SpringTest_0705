package com.khs.test.ajax.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khs.test.ajax.dao.FavoriteDAO;
import com.khs.test.ajax.model.favorite;

@Service
public class FavoriteBO {
	@Autowired
	private FavoriteDAO favoritedao;
	public List<favorite> getfavorite() {
		
		return favoritedao.selectfavorite();
	}
	public int addFavorite(String name, String address) {
		
		return favoritedao.insertfavorite(name, address);
	}
	
	public boolean isDuplicateAddress(String address) {
		
		int count = favoritedao.selectCountByAddress(address);
		
		if(count == 0) {
			
			return false;
		}else {
			return true;
		}
	}
}
