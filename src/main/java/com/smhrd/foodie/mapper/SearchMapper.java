package com.smhrd.foodie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.smhrd.foodie.model.Ingredient;
import com.smhrd.foodie.model.Recipe;

@Mapper
public interface SearchMapper {
    @Select("SELECT * FROM recipe_info WHERE recipe_all_ingre LIKE CONCAT('%' , #{keyword}, '%')")
    List<Recipe> searchRecipes(String keyword);
    
    @Select("SELECT * FROM ingredient_info WHERE ingre_name LIKE CONCAT('%' , #{keyword}, '%')")
    List<Ingredient> searchIngredients(String keyword);
}
