package com.rice.common;

import java.util.Date;

import org.springframework.stereotype.Component;
@Component
public class KakaoPayReadyVO {

	
	    private String tid, next_redirect_pc_url;
	    private Date created_at;
	    
	    
	    
	    
	    
	    /*
		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + ((created_at == null) ? 0 : created_at.hashCode());
			result = prime * result + ((next_redirect_pc_url == null) ? 0 : next_redirect_pc_url.hashCode());
			result = prime * result + ((tid == null) ? 0 : tid.hashCode());
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
			KakaoPayReadyVO other = (KakaoPayReadyVO) obj;
			if (created_at == null) {
				if (other.created_at != null)
					return false;
			} else if (!created_at.equals(other.created_at))
				return false;
			if (next_redirect_pc_url == null) {
				if (other.next_redirect_pc_url != null)
					return false;
			} else if (!next_redirect_pc_url.equals(other.next_redirect_pc_url))
				return false;
			if (tid == null) {
				if (other.tid != null)
					return false;
			} else if (!tid.equals(other.tid))
				return false;
			return true;
		}
		@Override
		public String toString() {
			return "KakaoPayReadyVO [tid=" + tid + ", next_redirect_pc_url=" + next_redirect_pc_url + ", created_at="
					+ created_at + ", getTid()=" + getTid() + ", getNext_redirect_pc_url()=" + getNext_redirect_pc_url()
					+ ", getCreated_at()=" + getCreated_at() + ", getClass()=" + getClass() + ", hashCode()="
					+ hashCode() + ", toString()=" + super.toString() + "]";
		}
		*/
		public String getTid() {
			return tid;
		}
		public void setTid(String tid) {
			this.tid = tid;
		}
		public String getNext_redirect_pc_url() {
			return next_redirect_pc_url;
		}
		public void setNext_redirect_pc_url(String next_redirect_pc_url) {
			this.next_redirect_pc_url = next_redirect_pc_url;
		}
		public Date getCreated_at() {
			return created_at;
		}
		public void setCreated_at(Date created_at) {
			this.created_at = created_at;
		}
	    
		
	
		

}
