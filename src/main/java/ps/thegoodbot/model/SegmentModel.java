package ps.thegoodbot.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class SegmentModel {
	
	private long idSegment;
	private String nameSegment;
	
	public SegmentModel() {
	}

	public SegmentModel(long idSegment, String nameSegment) {
		super();
		this.idSegment = idSegment;
		this.nameSegment = nameSegment;
	}

	public long getIdSegment() {
		return idSegment;
	}

	public void setIdSegment(long idSegment) {
		this.idSegment = idSegment;
	}
	
	@NotNull(message = "Nome obrigatório")
	@Size(min = 2, max = 50, message = "NOME deve ser entre 2 e 40 caracteres")
	public String getNameSegment() {
		return nameSegment;
	}

	public void setNameSegment(String nameSegment) {
		this.nameSegment = nameSegment;
	}
}
