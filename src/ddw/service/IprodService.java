package ddw.service;

import java.util.List;

import ddw.vo.ProdVO;


public interface IprodService {
	
	/**
	 * 상품 정보를 전체 조회 할 수 있는 메서드
	 * @return
	 */
	public List<ProdVO> Allprod();

	
	/**
	 * 상품 카테고리별 조회할 수 있는 메서드 
	 * @return
	 */
	public List<ProdVO> Lprodgu(String lprod_gu);

}
