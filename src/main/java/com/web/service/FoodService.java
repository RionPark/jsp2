package com.web.service;

import java.util.List;

import com.web.dto.FoodDTO;
import com.web.repository.FoodRepository;

public class FoodService {
	private FoodRepository FoodRepo = new FoodRepository();

	public List<FoodDTO> selectFoods(FoodDTO Food){
		return FoodRepo.selectFoods(Food);
	}

	public FoodDTO selectFood(int biNum){
		return FoodRepo.selectFood(biNum);
	}

	public int insertFood(FoodDTO Food){
		return FoodRepo.insertFood(Food);
	}

	public int updateFood(FoodDTO Food){
		return FoodRepo.updateFood(Food);
	}

	public int deleteFood(int biNum){
		return FoodRepo.deleteFood(biNum);
	}
}
