package ps.thegoodbot.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import ps.thegoodbot.model.BotModel;
import ps.thegoodbot.repository.mapper.BotRowMapper;

@Repository
public class BotRepository {
	
	private static final String FIND_ALL = "SELECT * FROM TB_BOT B INNER JOIN TB_SEGMENT S ON S.ID_SEGMENT = B.ID_SEGMENT ORDER BY B.ID_BOT";
	private static final String FIND_BY_ID = "SELECT * FROM TB_BOT B INNER JOIN TB_SEGMENT S ON S.ID_SEGMENT = B.ID_SEGMENT WHERE B.ID_BOT = ?";
	private static final String SAVE = "INSERT INTO TB_BOT (NAME, WELCOME_MSG, FAREWELL_MSG, DOWNTIME, DEFAULT_ANSWER, ID_SEGMENT) VALUES (?, ?, ?, ?, ?, ?)";
	private static final String UPDATE = "UPDATE TB_BOT SET NAME = ?, WELCOME_MSG = ?, FAREWELL_MSG = ?, DOWNTIME = ?, DEFAULT_ANSWER = ?, ID_SEGMENT = ? WHERE ID_BOT = ?";
	private static final String DELETE_BY_ID = "DELETE FROM TB_BOT WHERE ID_BOT = ?";

	@Autowired
	public JdbcTemplate jdbcTemplate;
	
	public BotRepository() {
	}
	
	public List<BotModel> findAll() {

		List<BotModel> bots = this.jdbcTemplate.query(FIND_ALL, new BotRowMapper());
		return bots;
	}
	
	public BotModel findById(long id) {

		BotModel bot = this.jdbcTemplate.queryForObject(FIND_BY_ID, new BotRowMapper(), id);
		return bot;
	}
	
	public void save(BotModel botModel) {
		this.jdbcTemplate.update(SAVE, 
				botModel.getName(), 
				botModel.getWelcome_msg(), 
				botModel.getFarewell_msg(),
				botModel.getDowntime(), 
				botModel.getDefault_answer(),
				botModel.getSegment().getIdSegment());
	}
	
	public void update(BotModel botModel) {
		this.jdbcTemplate.update(UPDATE, 
				botModel.getName(), 
				botModel.getWelcome_msg(), 
				botModel.getFarewell_msg(),
				botModel.getDowntime(), 
				botModel.getDefault_answer(),
				botModel.getSegment().getIdSegment(),
				botModel.getId_bot());
	}
	
	public void deleteById(long id) {
		this.jdbcTemplate.update(DELETE_BY_ID, id);
	}	
}
