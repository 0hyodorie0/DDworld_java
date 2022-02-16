package ddw.dao;

import java.util.List;

import ddw.vo.ProdVO;

public interface ProdDao {
	
	//상품 전체 목록
	public List<ProdVO> Allprod();
	
	//상품 카테고리목록
	public List<ProdVO> Lprodgu(String lprod_gu);

}
