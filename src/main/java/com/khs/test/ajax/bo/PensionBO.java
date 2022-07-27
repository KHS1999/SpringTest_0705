package com.khs.test.ajax.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khs.test.ajax.dao.PensionDAO;
import com.khs.test.ajax.model.pension;

@Service
public class PensionBO {
	
	@Autowired
	private PensionDAO pensionDAO;
	public List<pension> getPensnionList(){
		return pensionDAO.selectPension();
	}
	
	public int deletePensionList(int id) {
		return pensionDAO.deletePension(id);
	}
	
	public int getinsertPension(String name, String date, int day, int headcount, String phoneNumber) {
		return pensionDAO.insertPension(name, date, day, headcount, phoneNumber);
	}
}
