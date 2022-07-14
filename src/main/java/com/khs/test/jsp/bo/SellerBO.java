package com.khs.test.jsp.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khs.test.jsp.dao.SellerDAO;
import com.khs.test.jsp.model.Seller;

@Service
public class SellerBO {
	
	@Autowired
	private SellerDAO sellerDAO;
	
	public int addSeller(String nickname, String profileImage, double temperature) {
		return sellerDAO.insertSeller(nickname, profileImage, temperature);
	}
	
	public Seller getLastseller() {
		return sellerDAO.selectLastSeller();
	}
	public Seller getSeller(Integer id) {
		
		if(id == null) {
			return sellerDAO.selectLastSeller();
		}else {
			return sellerDAO.selectSeller(id);
		}
	}
}
