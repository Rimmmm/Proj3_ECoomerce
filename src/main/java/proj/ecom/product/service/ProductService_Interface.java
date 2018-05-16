package proj.ecom.product.service;

import java.util.List;

import proj.ecom.product.domain.ProductDTO;
import proj.ecom.product.domain.ProductSizeDTO;
import proj.ecom.util.Criteria;

public interface ProductService_Interface {
	//페이징 처리
	int getTotalCount();
	//상품 전체 목록 보기
	List<ProductDTO> listProduct(int product_itemType, int product_sortType, Criteria cri);
	
	//상품 자세히 보기
	ProductDTO productDetail(int product_id);
	
	//상품 사이즈와 수량확인
	ProductSizeDTO productSize(int product_id);
	
}
