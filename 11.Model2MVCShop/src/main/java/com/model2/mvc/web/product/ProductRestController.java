package com.model2.mvc.web.product;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.comment.CommentService;
import com.model2.mvc.service.domain.Comment;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.sun.media.jfxmedia.logging.Logger;


//==> 회원관리 Controller
@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 구현 않음
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	@Autowired
	@Qualifier("commentServiceImpl")
	private CommentService commentService;
	@Resource(name="uploadPath")
	private String savePath;
	
	public ProductRestController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
	//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	

	
	//@RequestMapping("/addProduct.do")
	@RequestMapping(value="json/addProduct", method=RequestMethod.POST)
	public Product addProduct( @RequestBody Product product) throws Exception {

		System.out.println("add Product POST");
		//Business Logic
		product.setManuDate(product.getManuDate().replaceAll("-", ""));
		System.out.println(product);
		productService.addProduct(product);
		
		System.out.println(product);
		return product;
	}
	
	//@RequestMapping("/addProduct.do")
		@RequestMapping(value="json/getProduct/{prodNo}", method=RequestMethod.GET)
		public Product getProduct( @PathVariable int prodNo) throws Exception {

			System.out.println("get Product GET");
			//Business Logic
			
			System.out.println(prodNo);
			return productService.getProduct(prodNo);
		}
		
	@RequestMapping(value="json/getProductList",method=RequestMethod.POST)
	public Map getProductList(@RequestBody Search search) throws Exception{
		System.out.println(" JSON SEARCH : : : :"+search);
		Map map = productService.getProductList(search);
		System.out.println("JSON MAP.GET LIST ===="+map.get("list"));
		return map;
	}
	
	@RequestMapping(value="json/updateProduct",method=RequestMethod.POST)
	public Product updateProduct(@RequestBody Product product) throws Exception{
		
		productService.updateProduct(product);
		
		product = productService.getProduct(product.getProdNo());
		
		return product;
	}
	
	
	
	private String uploadFile(String originalName, byte[] fileData) throws Exception {

		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		File target = new File(savePath, savedName);
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}
}