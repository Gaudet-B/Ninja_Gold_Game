package com.gaudetb.ninjagoldgame.controllers;

import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gaudetb.ninjagoldgame.models.Message;


@Controller
public class NinjaGoldController {
	
	@RequestMapping("/gold")
	public String index(HttpSession session, Model model) {
		
		if (session.getAttribute("gold") == null) {
			session.setAttribute("gold", 0);
		}
		
		if (session.getAttribute("activity") == null) {
			session.setAttribute("activity", new ArrayList<Message>());
		} else {
			model.addAttribute("activity", session.getAttribute("activity"));
		}
		
		int gold = (int) session.getAttribute("gold");
		model.addAttribute("gold", gold);
		
		return "index.jsp";
		
	}
	
	@PostMapping("/gold/find")
	public String find(HttpSession session, @RequestParam(value="find") String find) {
		
		Random random = new Random();
		ArrayList<Message> activity = (ArrayList<Message>) session.getAttribute("activity");
		
		if (find.equals("farm")) {
			int farmGold = random.nextInt(11) + 10;
			session.setAttribute("gold", (int) session.getAttribute("gold") + farmGold);
			Message farmActivity = new Message("success", String.format("You entered a farm and earned %d gold. (%s)", farmGold, new Date()));
			activity.add(farmActivity);
		}
		
		else if (find.equals("cave")) {
			int caveGold = random.nextInt(6) + 5;
			session.setAttribute("gold", (int) session.getAttribute("gold") + caveGold);
			Message caveActivity = new Message("success", String.format("You entered a cave and earned %d gold. (%s)", caveGold, new Date()));
			activity.add(caveActivity);
		}
		
		else if (find.equals("house")) {
			int houseGold = random.nextInt(4) + 2;
			session.setAttribute("gold", (int) session.getAttribute("gold") + houseGold);
			Message houseActivity = new Message("success", String.format("You entered a house and earned %d gold. (%s)", houseGold, new Date()));
			activity.add(houseActivity);
		}
		
		else if (find.equals("casino")) {
			int casinoGold = random.nextInt(101) - 50;
			session.setAttribute("gold", (int) session.getAttribute("gold") + casinoGold);
			if (casinoGold < 0) {
				Message casinoActivity = new Message("danger", String.format("You entered a casino and lost %d gold. Ouch. (%s)", casinoGold, new Date()));
				activity.add(casinoActivity);				
			} else {
				Message casinoActivity = new Message("success", String.format("You entered a casino and earned %d gold. (%s)", casinoGold, new Date()));
				activity.add(casinoActivity);
			}
		}
		
		return "redirect:/gold";
	}
	
	@RequestMapping("/gold/reset")
	public String reset(HttpSession session) {
		session.setAttribute("gold", 0);
		session.setAttribute("activity", new ArrayList<Message>());
		
		return "redirect:/gold";
	}
	

}
