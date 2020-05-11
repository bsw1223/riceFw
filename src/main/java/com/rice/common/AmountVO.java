package com.rice.common;

import org.springframework.stereotype.Component;

@Component
public class AmountVO {
	private Integer total, tax_free, vat, point, discount, total_amount;
	
	
	
	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((discount == null) ? 0 : discount.hashCode());
		result = prime * result + ((point == null) ? 0 : point.hashCode());
		result = prime * result + ((tax_free == null) ? 0 : tax_free.hashCode());
		result = prime * result + ((total == null) ? 0 : total.hashCode());
		result = prime * result + ((total_amount == null) ? 0 : total_amount.hashCode());
		result = prime * result + ((vat == null) ? 0 : vat.hashCode());
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
		AmountVO other = (AmountVO) obj;
		if (discount == null) {
			if (other.discount != null)
				return false;
		} else if (!discount.equals(other.discount))
			return false;
		if (point == null) {
			if (other.point != null)
				return false;
		} else if (!point.equals(other.point))
			return false;
		if (tax_free == null) {
			if (other.tax_free != null)
				return false;
		} else if (!tax_free.equals(other.tax_free))
			return false;
		if (total == null) {
			if (other.total != null)
				return false;
		} else if (!total.equals(other.total))
			return false;
		if (total_amount == null) {
			if (other.total_amount != null)
				return false;
		} else if (!total_amount.equals(other.total_amount))
			return false;
		if (vat == null) {
			if (other.vat != null)
				return false;
		} else if (!vat.equals(other.vat))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "AmountVO [total=" + total + ", tax_free=" + tax_free + ", vat=" + vat + ", point=" + point
				+ ", discount=" + discount + ", total_amount=" + total_amount + ", getTotal_amount()="
				+ getTotal_amount() + ", getTotal()=" + getTotal() + ", getTax_free()=" + getTax_free() + ", getVat()="
				+ getVat() + ", getPoint()=" + getPoint() + ", getDiscount()=" + getDiscount() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}

	public Integer getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(Integer total_amount) {
		this.total_amount = total_amount;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public Integer getTax_free() {
		return tax_free;
	}

	public void setTax_free(Integer tax_free) {
		this.tax_free = tax_free;
	}

	public Integer getVat() {
		return vat;
	}

	public void setVat(Integer vat) {
		this.vat = vat;
	}

	public Integer getPoint() {
		return point;
	}

	public void setPoint(Integer point) {
		this.point = point;
	}

	public Integer getDiscount() {
		return discount;
	}

	public void setDiscount(Integer discount) {
		this.discount = discount;
	}

}
