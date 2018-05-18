package proj.ecom.product.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import proj.ecom.product.domain.ProductDTO;
import proj.ecom.product.domain.ProductSizeDTO;
import proj.ecom.util.Criteria;

@Repository
public class ProductDAO implements ProductDAO_Interface{
	static final String NAMESPACE = "ProductMapper";
	@Inject
	private SqlSession sqlSession;



	@Override
	public List<ProductDTO> listProduct(int product_itemType, int product_sortType, Criteria cri) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("product_itemType", product_itemType);
		map.put("product_sortType", product_sortType);
		map.put("cri", cri);
		System.out.println("product_itemType dao " + product_itemType);
		System.out.println("product_sortType dao " + product_sortType);
		
		return sqlSession.selectList(NAMESPACE+".listProduct", map);
	}

	@Override
	public ProductDTO productDetail(int product_id) {
		
		
		return sqlSession.selectOne(NAMESPACE+".productDetail", product_id);
	}
	//mapper에서 productSize
	@Override
	public List<ProductSizeDTO> productSize(int product_id) {
		
		return sqlSession.selectList(NAMESPACE+".productSize", product_id);
	}

	public int getTotalCount() {
		Integer totalCount=sqlSession.selectOne(NAMESPACE+".getTotalCount");  
		if(totalCount==null) totalCount=0;
		return totalCount;
	}
}
