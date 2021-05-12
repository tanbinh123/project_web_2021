package vn.edu.topedu.entity.test;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "Test")
public class Test {
	   @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    @Column(name = "id", nullable = false)
	    
	    private Long id;
	 
	    @Column(name = "name", length = 1, nullable = false)
	    private boolean name;
	   
		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		

		/**
		 * 
		 */
		public Test() {
			super();
		}

		public boolean getName() {
			return name;
		}

		public void setName(boolean name) {
			this.name = name;
		}

	
}
