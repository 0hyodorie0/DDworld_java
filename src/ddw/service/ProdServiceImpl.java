package ddw.service;

import java.util.List;

import ddw.dao.ProdDao;
import ddw.dao.ProdDaoImpl;
import ddw.vo.ProdVO;

public class ProdServiceImpl implements IprodService{
	private ProdDao dao;  // DAO객체가 저장될 변수 선언
	private static ProdServiceImpl service;	// 1번

	// 생성자
	private ProdServiceImpl() {	// 2 번
		// DAO객체 생성
		dao = ProdDaoImpl.getInstance();
	}
	
	// 3번
	public static ProdServiceImpl getInstance(){
		if(service==null) service = new ProdServiceImpl();
		return service;
	}
	
	@Override
	public List<ProdVO> Allprod() {		      
		return dao.Allprod();
	}
	
	@Override
	public List<ProdVO> Lprodgu(String lprod_gu) {		      
		return dao.Lprodgu(lprod_gu);
	}
	
	
	
}
