package sample.util;

public class ExamPaper {
	private int id;
	private String subjectId;
	private String choiceNum;
	private String ChoiceId;
	private String optionNum;
	private String optionId;
	private int totalPoint;
	public ExamPaper(){
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(String subjectId) {
		this.subjectId = subjectId;
	}
	public String getChoiceNum() {
		return choiceNum;
	}
	public void setChoiceNum(String choiceNum) {
		this.choiceNum = choiceNum;
	}
	public String getChoiceId() {
		return ChoiceId;
	}
	public void setChoiceId(String choiceId) {
		ChoiceId = choiceId;
	}
	public String getOptionNum() {
		return optionNum;
	}
	public void setOptionNum(String optionNum) {
		this.optionNum = optionNum;
	}
	public String getOptionId() {
		return optionId;
	}
	public void setOptionId(String optionId) {
		this.optionId = optionId;
	}
	public int getTotalPoint() {
		return totalPoint;
	}
	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
	}

}
