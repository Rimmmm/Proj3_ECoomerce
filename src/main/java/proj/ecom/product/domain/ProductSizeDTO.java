package proj.ecom.product.domain;

import java.io.Serializable;

public class ProductSizeDTO implements Serializable{
	private static final long serialVersionUID = 2L;
	
	//별개의 테이블을 만들었음 
		private int product_id; //외래키
		private String product_size;
		private int product_quantity;
	
		public ProductSizeDTO() {
			
		}


		public ProductSizeDTO(int product_id, String product_size, int product_quantity) {
			super();
			this.product_id = product_id;
			this.product_size = product_size;
			this.product_quantity = product_quantity;
		}


		public String getProduct_size() {
			return product_size;
		}

		public void setProduct_size(String product_size) {
			this.product_size = product_size;
		}

		public int getProduct_quantity() {
			return product_quantity;
		}

		public void setProduct_quantity(int product_quantity) {
			this.product_quantity = product_quantity;
		}
		
		
		public int getProduct_id() {
			return product_id;
		}


		public void setProduct_id(int product_id) {
			this.product_id = product_id;
		}


		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + ((product_size == null) ? 0 : product_size.hashCode());
			return result;
		}

		@Override
		public boolean equals(Object obj) {
			if (this == obj)
				return true;
			if (obj == null)
				return false;
			if (getClass() != obj.getClass())
				return false;
			ProductSizeDTO other = (ProductSizeDTO) obj;
			if (product_size == null) {
				if (other.product_size != null)
					return false;
			} else if (!product_size.equals(other.product_size))
				return false;
			return true;
		}


		@Override
		public String toString() {
			return "ProductSizeDTO [product_id=" + product_id + ", product_size=" + product_size + ", product_quantity="
					+ product_quantity + "]";
		}

		
		
	
}
