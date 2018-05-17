package proj.ecom.product.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import proj.ecom.product.dao.ProductDAO;
import proj.ecom.product.domain.ProductDTO;
import proj.ecom.product.domain.ProductSizeDTO;
import proj.ecom.util.Criteria;

@Service
public class ProductService implements ProductService_Interface{
	@Inject ProductDAO productDao;
	
	

	@Override
	public int getTotalCount() {
		
		return productDao.getTotalCount();
	}
	//상품 목록 전체 조회
	@Override
	public List<ProductDTO> listProduct(int product_itemType, int product_sortType, Criteria cri) {
		System.out.println("product_itemType service "+product_itemType);
		System.out.println("product_sortType service "+product_sortType);

		return productDao.listProduct(product_itemType, product_sortType, cri);
	}
	//상품 자세히 보기
	@Override
	public ProductDTO productDetail(int product_id) {
		
		return productDao.productDetail( product_id);
	}
	
	//상품 사이즈와 수량 확인
	@Override
	public ProductSizeDTO productSize(int product_id) {
		return productDao.productSize(product_id);
	}


}
