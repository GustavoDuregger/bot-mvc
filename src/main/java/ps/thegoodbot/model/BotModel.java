package ps.thegoodbot.model;

import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Size;


public class BotModel {
	
	private long id_bot;
	private String name;
	private String welcome_msg;
	private String farewell_msg;
	private int downtime;
	private String default_answer;
	private SegmentModel segment;

	public BotModel() {
	}

	public BotModel(long id_bot, String name, String welcome_msg, String farewell_msg, int downtime,
			String default_answer, SegmentModel segment) {
		super();
		this.id_bot = id_bot;
		this.name = name;
		this.welcome_msg = welcome_msg;
		this.farewell_msg = farewell_msg;
		this.downtime = downtime;
		this.default_answer = default_answer;
		this.segment = segment;
	}

	public long getId_bot() {
		return id_bot;
	}

	public void setId_bot(long id_bot) {
		this.id_bot = id_bot;
	}
	
	@Size(min = 2, max = 40, message = "Nome deve ter no mínimo 2 e no máximo 40 caracteres")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Size(min = 1, max = 200, message = "A mensagem de boas-vindas deve ter no mínimo 1 e no máximo 200 caracteres")
	public String getWelcome_msg() {
		return welcome_msg;
	}

	public void setWelcome_msg(String welcome_msg) {
		this.welcome_msg = welcome_msg;
	}
	
	@Size(min = 1, max = 200, message = "A mensagem de despedida deve ter no mínimo 1 e no máximo 200 caracteres")
	public String getFarewell_msg() {
		return farewell_msg;
	}

	public void setFarewell_msg(String farewell_msg) {
		this.farewell_msg = farewell_msg;
	}
	
	
	public int getDowntime() {
		return downtime;
	}

	public void setDowntime(int downtime) {
		this.downtime = downtime;
	}
	
	@Size(min = 1, max = 200, message = "A mensagem padrão deve ter no mínimo 1 e no máximo 200 caracteres")
	public String getDefault_answer() {
		return default_answer;
	}

	public void setDefault_answer(String default_answer) {
		this.default_answer = default_answer;
	}

	public SegmentModel getSegment() {
		return segment;
	}

	public void setSegment(SegmentModel segment) {
		this.segment = segment;
	}
}
