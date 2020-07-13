package ps.thegoodbot.controller;

import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ps.thegoodbot.model.BotModel;
import ps.thegoodbot.repository.BotRepository;
import ps.thegoodbot.repository.SegmentRepository;

@Controller
@RequestMapping("/thegoodbot")
public class BotController {
	private static final String BOT_FOLDER = "bot/";
	
	@Autowired
	public BotRepository repository;
	
	@Autowired
	public SegmentRepository segmentRepository;

	@GetMapping("/bot/form")
	public String open(@RequestParam String page, 
			@RequestParam(required = false) Long id,
			@ModelAttribute("botModel") BotModel botModel, Model model) {

		if ("bot-editar".equals(page)) {
			model.addAttribute("botModel", repository.findById(id));
		}
		
		model.addAttribute("segments",segmentRepository.findAll());

		return BOT_FOLDER + page;
	}

	// INDEX HOME PAGE
	@GetMapping()
	public String index() {
		return "index";
	}

	// FIND ALL
	@GetMapping("/bot")
	public String findAll(Model model) {

		model.addAttribute("bots", repository.findAll());
		return BOT_FOLDER + "bots";
	}

	// FIND BY ID
	@GetMapping("/bot/{id}")
	public String findById(@PathVariable("id") long id, Model model) {

		model.addAttribute("bot", repository.findById(id));
		return BOT_FOLDER + "bot-detalhe";
	}
	
	// SAVE
	@PostMapping("/bot")
	public String save(@Valid BotModel botModel, BindingResult bindingResult,
			RedirectAttributes redirectAttributes, Model model) {

		if (bindingResult.hasErrors()) {
			model.addAttribute("segments",segmentRepository.findAll());
			return BOT_FOLDER + "bot-novo";
		}

		repository.save(botModel);
		redirectAttributes.addFlashAttribute("messages", "Bot cadastrado com sucesso!");

		return "redirect:/thegoodbot/bot";
	}
	
	// UPDATE
	@PutMapping("/bot/{id}")
	public String update(@PathVariable("id") long id, @Valid BotModel botModel, BindingResult bindingResult, RedirectAttributes redirectAttributes, Model model) {
		
		if(bindingResult.hasErrors()) {
			model.addAttribute("segments", segmentRepository.findAll());
			return BOT_FOLDER + "bot-editar";
		}
		
		botModel.setId_bot(id);
		repository.update(botModel);
		redirectAttributes.addFlashAttribute("messages", "Bot alterado com sucesso!");
		
		return "redirect:/thegoodbot/bot";
	}
	
	// DELETE
	@DeleteMapping("/bot/{id}")
	public String deleteById(@PathVariable("id") long id, RedirectAttributes redirectAttributes) {

		repository.deleteById(id);
		redirectAttributes.addFlashAttribute("messages", "Bot excluido com sucesso!");

		return "redirect:/thegoodbot/bot";
	}
}
