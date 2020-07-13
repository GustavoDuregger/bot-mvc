package ps.thegoodbot.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import ps.thegoodbot.model.SegmentModel;

@Component
public class SegmentRepository {
	
	private static final String FIND_ALL = "SELECT * FROM TB_SEGMENT";
	private static final String FIND_BY_ID = "SELECT * FROM TB_SEGMENT WHERE ID_SEGMENT = ?";
	private static final String SAVE = "INSERT INTO TB_SEGMENT (NAME_SEGMENT) VALUES (?)";
	private static final String UPDATE = "UPDATE TB_SEGMENT SET NAME_SEGMENT = ? WHERE ID_SEGMENT = ?";
	private static final String DELETE_BY_ID = "DELETE FROM TB_SEGMENT WHERE ID_SEGMENT = ?";

	@Autowired
	public JdbcTemplate jdbcTemplate;
	
	public SegmentRepository() {
		
	}
	
	public List<SegmentModel> findAll() {

		List<SegmentModel> segments = this.jdbcTemplate.query(FIND_ALL, new BeanPropertyRowMapper<SegmentModel>(SegmentModel.class));
		return segments;
	}
	
	public SegmentModel findById(long id) {

		SegmentModel segment = this.jdbcTemplate.queryForObject(FIND_BY_ID, new BeanPropertyRowMapper<SegmentModel>(SegmentModel.class), id);
		return segment;
	}

	public void save(SegmentModel segmentModel) {
		this.jdbcTemplate.update(SAVE, 
				segmentModel.getNameSegment());
	}

	public void update(SegmentModel segmentModel) {
		this.jdbcTemplate.update(UPDATE, 
				segmentModel.getNameSegment(),
				segmentModel.getIdSegment());
	}

	public void deleteById(long id) {
		this.jdbcTemplate.update(DELETE_BY_ID, id);
	}

}
