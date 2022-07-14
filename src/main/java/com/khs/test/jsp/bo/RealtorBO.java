package com.khs.test.jsp.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khs.test.jsp.dao.RealtorDAO;
import com.khs.test.jsp.model.Realtor;

@Service
public class RealtorBO {

	@Autowired RealtorDAO realtorDAO;	
	public int addRealtorWithId(Realtor realtor) {
		
		return realtorDAO.insertRealtorWithID(realtor);
	}
}
