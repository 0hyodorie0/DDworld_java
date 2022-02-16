package ddw.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import ddw.util.SqlMapClientFactory;
import ddw.vo.ProdVO;

public class ProdDaoImpl implements ProdDao {
	
	private static ProdDaoImpl dao;  // 1번
	private SqlMapClient smc;		// SqlMapClient객체 변수 선언
	
	// 2번  생성자
	private ProdDaoImpl() {
		smc = SqlMapClientFactory.getSqlmapClient(); // SqlMapClient객체 생성  
	}	
	
	// 3번
	public static ProdDaoImpl getInstance(){
		if(dao==null) dao = new ProdDaoImpl();
		
		return dao;
	}
	

	@Override
	public List<ProdVO> Allprod() {
		
		List<ProdVO> prodlist = null;  // 가져온 데이터가 저장될 List객체 변수 선언
		
		try {
			prodlist = smc.queryForList("prod.allprod");
		} catch (SQLException e) {
			prodlist = null;
		} 
		return prodlist;
	}

	@Override
	public List<ProdVO> Lprodgu(String lprod_gu) {
		
		List<ProdVO> prodgulist = null;  // 가져온 데이터가 저장될 List객체 변수 선언		
		try {
			prodgulist = smc.queryForList("prod.lprodgu",lprod_gu);
		} catch (SQLException e) {
			prodgulist = null;
		} 
		return prodgulist;
	}


}
