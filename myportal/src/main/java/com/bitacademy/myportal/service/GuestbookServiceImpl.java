package com.bitacademy.myportal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitacademy.myportal.repository.GuestbookDao;
import com.bitacademy.myportal.repository.GuestbookVo;

@Service
//	service -> 선택적. 지금 단계에서는 그냥 저장소랑 컨트롤의 연결다리 밖에 안 됨
//	구조가 복잡해져서 여러 DAO를 이용하거나 하는 경우에 활약함
//	해당 작업에 Transaction을 걸어줄 수도 있음
public class GuestbookServiceImpl implements GuestbookService {
	@Autowired
	GuestbookDao guestbookDaoImpl;
	
	@Override
	public List<GuestbookVo> getMessageList() {
		List<GuestbookVo> list = guestbookDaoImpl.selectAll();
		return list;
	}

	@Transactional
	@Override
	public boolean writeMessage(GuestbookVo vo) {
		int insertedCount = guestbookDaoImpl.insert(vo);
		System.out.println("삽입된 방명록 레코드:" + insertedCount);
		return 1 == insertedCount;
	}

	@Override
	public boolean deleteMessge(GuestbookVo vo) {
		int deletedCount = guestbookDaoImpl.delete(vo);
		System.out.println("삭제된 방명록 레코드:" + deletedCount);
		return 1 == deletedCount;
	}

}
