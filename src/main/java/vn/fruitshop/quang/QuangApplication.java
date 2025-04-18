package vn.fruitshop.quang;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
// temporaly disable Spring security
// keyword exclude: chạy bỏ qua class trong exclude >< include
// @SpringBootApplication(exclude =
// org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class)
public class QuangApplication {

	public static void main(String[] args) {
		SpringApplication.run(QuangApplication.class, args);
		System.out.println("============================= Start successfully =============================");
		System.out.println("============================= Start successfully =============================");
		System.out.println("============================= Start successfully =============================");
		System.out.println("============================= Start successfully =============================");
	}

}
