package ps.thegoodbot.repository.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;

import ps.thegoodbot.model.BotModel;
import ps.thegoodbot.model.SegmentModel;

public class BotRowMapper implements RowMapper<BotModel>{
	
	@Override
	public BotModel mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		BotModel bot = new BeanPropertyRowMapper<>(BotModel.class).mapRow(rs, rowNum);
		SegmentModel segment = new BeanPropertyRowMapper<>(SegmentModel.class).mapRow(rs, rowNum);
		
		bot.setSegment(segment);
		
		return bot;
	}

}
