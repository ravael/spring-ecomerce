package br.spring.ecomerce.loja.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import br.spring.ecomerce.loja.models.Product;

public class ProductValidator implements Validator{
	

	public boolean supports(Class<?> clazz) {
		return Product.class.isAssignableFrom(clazz);
	}

	public void validate(Object target, Errors errors) {
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", "field.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "description", "field.required");
		
		Product product = (Product) target;
		if(product.getPages() == 0){
			errors.rejectValue("pages", "field.required");
		}
	}

}
