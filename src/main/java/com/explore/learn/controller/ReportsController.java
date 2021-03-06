package com.explore.learn.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.explore.learn.model.GameScore;
import com.explore.learn.model.User;
import com.explore.learn.service.GameScoreService;
import com.explore.learn.service.UserService;

@Controller
@RequestMapping("/reports")
public class ReportsController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	GameScoreService gameScoreService;
	
	@RequestMapping(value = {""}, method = RequestMethod.GET)
	public String listReports(ModelMap model) {
		
		model.addAttribute("display", "none");
		return "reports";
	}
	
	/**
	 * Show the list of users in the report along with their preferences
	 * @param model
	 * @return
	 */
	@RequestMapping(value = {"/listUsers"}, method = RequestMethod.GET)
	public String listUsers(ModelMap model) {
		
		List<User> userList = userService.findAllUsers();
		
		StringBuilder sb = new StringBuilder();
		sb.append("<table class='table'>" +
	        "<tr>\n" +
	          "  <td>First Name</td>\n" +
	          "  <td>Last Name</td>\n" +
	          "  <td>Username</td>\n" +
	          "  <td>Role</td>\n" +
	          "  <td>Active?</td>\n" +
	        "</tr>\n"
	    );
		
		for (User u : userList) {
			sb.append("<tr>\n");
			sb.append("  <td>" + u.getFirstName() + "</td>\n");
			sb.append("  <td>" + u.getLastName() + "</td>\n");
			sb.append("  <td>" + u.getUsername() + "</td>\n");
			sb.append("  <td>" + u.getRole() + "</td>\n");
			sb.append("  <td>" + u.getIsActive() + "</td>\n");
			sb.append("</tr>\n");
		}
		sb.append("</table>");
		
		model.addAttribute("title", "List of Registered Users");
		model.addAttribute("report", sb.toString());
		
		//show the div
		model.addAttribute("display", "block");
		return "reports";
	}
	
	@RequestMapping(value = {"/listAdmins"}, method = RequestMethod.GET)
	public String listAdmins(ModelMap model) {
		
		List<User> userList = userService.findAllUsers();
		
		StringBuilder sb = new StringBuilder();
		sb.append("<table class='table'>" +
	        "<tr>\n" +
	          "  <td>First Name</td>\n" +
	          "  <td>Last Name</td>\n" +
	          "  <td>Username</td>\n" +
	          "  <td>Role</td>\n" +
	          "  <td>Active?</td>\n" +
	        "</tr>\n"
	    );
		
		for (User u : userList) {
			if (u.getRole().equals("ADMIN")) {
				sb.append("<tr>\n");
				sb.append("  <td>" + u.getFirstName() + "</td>\n");
				sb.append("  <td>" + u.getLastName() + "</td>\n");
				sb.append("  <td>" + u.getUsername() + "</td>\n");
				sb.append("  <td>" + u.getRole() + "</td>\n");
				sb.append("  <td>" + u.getIsActive() + "</td>\n");
				sb.append("</tr>\n");
			}
			
		}
		sb.append("</table>");
		
		model.addAttribute("title", "List of Registered Users");
		model.addAttribute("report", sb.toString());
		
		//show the div
		model.addAttribute("display", "block");
		return "reports";
	}
	
	@RequestMapping(value = {"/gameScores"}, method = RequestMethod.GET)
	public String getGameScores(ModelMap model) {
		
		List<GameScore> gsList = gameScoreService.findAllGameScores();
		
		StringBuilder sb = new StringBuilder();
		sb.append("<table class='table table-bordered'>" + 
			"<tr>\n" +
			"  <td>List of Games</td>\n" +
			"</tr>\n"
		);
		
		String gamename;
		for (int i = 0; i < gsList.size(); i++) {
			gamename = gsList.get(i).getGameTitle();
			sb.append("<tr>\n");
			sb.append("  <td><a href='/Exploration/reports/gameScores/" + gamename + "'>" + gamename +"</a></td>\n");
			sb.append("</tr>\n");
		}
		
		sb.append("</table>");
		
		model.addAttribute("title", "List of Individual Game scores");
		model.addAttribute("report", sb.toString());
		
		//show the div
		model.addAttribute("display", "block");
		return "reports";
	}
	
	@RequestMapping(value = {"/gameScores/{gameTitle:.+}"}, method = RequestMethod.GET)
	public String getOneGameScore(@PathVariable String gameTitle, ModelMap model) {

		GameScore gs = gameScoreService.findbyGameName(gameTitle);
		String title = "Game " + gameTitle;
		
		//Add format flag to run javascript
		model.addAttribute("fmtFlag", "true");
		model.addAttribute("display", "block");
		model.addAttribute("title", title);
		model.addAttribute("report", gs.getData());
		
		return "reports";
	}
}
